library(rqdatatable)


### Name: ex_data_table.relop_order_expr
### Title: Order rows by expression.
### Aliases: ex_data_table.relop_order_expr

### ** Examples


dL <- build_frame(
    "x", "y" |
    2L , "b" |
   -4L , "a" |
    3L , "c" )
rquery_pipeline <- local_td(dL) %.>%
  order_expr(., abs(x))
ex_data_table(rquery_pipeline)




