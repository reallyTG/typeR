library(rqdatatable)


### Name: ex_data_table.relop_rename_columns
### Title: Rename columns.
### Aliases: ex_data_table.relop_rename_columns

### ** Examples


dL <- build_frame(
    "x", "y" |
    2L , "b" |
    1L , "a" |
    3L , "c" )
rquery_pipeline <- local_td(dL) %.>%
  rename_columns(., c("x" = "y", "y" = "x"))
ex_data_table(rquery_pipeline)




