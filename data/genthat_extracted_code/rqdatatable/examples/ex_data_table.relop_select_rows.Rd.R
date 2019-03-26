library(rqdatatable)


### Name: ex_data_table.relop_select_rows
### Title: Select rows by condition.
### Aliases: ex_data_table.relop_select_rows

### ** Examples


dL <- build_frame(
    "x", "y" |
    2L , "b" |
    1L , "a" |
    3L , "c" )
rquery_pipeline <- local_td(dL) %.>%
  select_rows_nse(., x <= 2)
ex_data_table(rquery_pipeline)




