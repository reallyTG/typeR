## ------------------------------------------------------------------------
library("rqdatatable")
library("data.table")

## ------------------------------------------------------------------------
# data example
dL <- wrapr::build_frame(
   "subjectID", "surveyCategory"     , "assessmentTotal" |
   1          , "withdrawal behavior", 5                 |
   1          , "positive re-framing", 2                 |
   2          , "withdrawal behavior", 3                 |
   2          , "positive re-framing", 4                 )

## ------------------------------------------------------------------------
scale <- 0.237

# example rquery pipeline
rquery_pipeline <- local_td(dL) %.>%
  extend_nse(.,
             one = 1) %.>%
  extend_nse(.,
             probability =
               exp(assessmentTotal * scale)/
               sum(exp(assessmentTotal * scale)),
             count = sum(one),
             rank = rank(probability, surveyCategory),
             partitionby = 'subjectID') %.>%
  extend_nse(.,
             isdiagnosis = rank == count,
             diagnosis = surveyCategory) %.>%
  select_rows_nse(., 
                  isdiagnosis == TRUE) %.>%
  select_columns(., 
                 c('subjectID', 'diagnosis', 'probability')) %.>%
  orderby(., 'subjectID')

## ---- comment=""---------------------------------------------------------
cat(format(rquery_pipeline))

## ------------------------------------------------------------------------
ex_data_table(rquery_pipeline)

