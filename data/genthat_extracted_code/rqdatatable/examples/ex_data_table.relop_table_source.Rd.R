library(rqdatatable)


### Name: ex_data_table.relop_table_source
### Title: Build a data source description.
### Aliases: ex_data_table.relop_table_source

### ** Examples


dL <- build_frame(
    "x", "y" |
    2L , "b" |
    1L , "a" |
    3L , "c" )
rquery_pipeline <- local_td(dL)
ex_data_table(rquery_pipeline)




