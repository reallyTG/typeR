library(rqdatatable)


### Name: ex_data_table.relop_extend
### Title: Implement extend/assign operator.
### Aliases: ex_data_table.relop_extend

### ** Examples


dL <- build_frame(
    "subjectID", "surveyCategory"     , "assessmentTotal", "one" |
    1          , "withdrawal behavior", 5                , 1     |
    1          , "positive re-framing", 2                , 1     |
    2          , "withdrawal behavior", 3                , 1     |
    2          , "positive re-framing", 4                , 1     )
rquery_pipeline <- local_td(dL) %.>%
  extend_nse(.,
             probability %:=%
               exp(assessmentTotal * 0.237)/
               sum(exp(assessmentTotal * 0.237)),
             count %:=% sum(one),
             rank %:=% rank(),
             orderby = c("assessmentTotal", "surveyCategory"),
             reverse = c("assessmentTotal"),
             partitionby = 'subjectID') %.>%
  orderby(., c("subjectID", "probability"))
ex_data_table(rquery_pipeline)




