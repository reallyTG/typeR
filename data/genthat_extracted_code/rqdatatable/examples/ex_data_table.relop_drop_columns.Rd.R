library(rqdatatable)


### Name: ex_data_table.relop_drop_columns
### Title: Implement drop columns.
### Aliases: ex_data_table.relop_drop_columns

### ** Examples


dL <- data.frame(x = 1, y = 2, z = 3)
rquery_pipeline <- local_td(dL) %.>%
  drop_columns(., "y")
ex_data_table(rquery_pipeline)




