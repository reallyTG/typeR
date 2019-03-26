library(rqdatatable)


### Name: ex_data_table.relop_unionall
### Title: Bind tables together by rows.
### Aliases: ex_data_table.relop_unionall

### ** Examples


dL <- build_frame(
    "x", "y" |
    2L , "b" |
    1L , "a" |
    3L , "c" )
rquery_pipeline <- unionall(list(local_td(dL), local_td(dL)))
ex_data_table(rquery_pipeline)




