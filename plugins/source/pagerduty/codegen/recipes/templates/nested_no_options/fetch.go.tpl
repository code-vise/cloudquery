// Code generated by codegen; DO NOT EDIT.

package {{.Parent.SubService}}

import (
  "context"

  "github.com/cloudquery/cloudquery/plugins/source/pagerduty/client"
  "github.com/cloudquery/plugin-sdk/schema"
  "github.com/PagerDuty/go-pagerduty"
)

func fetch{{.SubService | ToCamel}}(ctx context.Context, meta schema.ClientMeta, parent *schema.Resource, res chan<- interface{}) error {
  cqClient := meta.(*client.Client)
  concreteParent := parent.Item.({{if .ParentIsPointer }}*{{end}}pagerduty.{{.Parent.StructName}})

  response, err := cqClient.PagerdutyClient.{{if ne .ListFunctionNameOverride ""}}{{.ListFunctionNameOverride}}{{else}}List{{.StructName}}sWithContext{{end}}(ctx, concreteParent.ID)
  if err != nil {
    return err
  }

  if len(response.{{if ne .ResponseFieldOverride ""}}{{.ResponseFieldOverride}}{{else}}{{.DefaultResponseStructFieldName}}{{end}}) == 0 {
    return nil
  }

  res <- response.{{if ne .ResponseFieldOverride ""}}{{.ResponseFieldOverride}}{{else}}{{.DefaultResponseStructFieldName}}{{end}}

  return nil
}