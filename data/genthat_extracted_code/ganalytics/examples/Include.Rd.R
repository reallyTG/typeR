library(ganalytics)


### Name: Include
### Title: Include
### Aliases: Include Include,ANY-method

### ** Examples

return_shoppers <- Include(
  Expr(~transactions > 1, metricScope = "perUser"),
  scope = "users"
)




