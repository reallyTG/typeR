library(rquery)


### Name: pick_top_k
### Title: Build an optree pipeline that selects up to the top k rows from
###   each group in the given order.
### Aliases: pick_top_k

### ** Examples


# by hand logistic regression example
scale <- 0.237
d <- mk_td("survey_table",
           c("subjectID", "surveyCategory", "assessmentTotal"))
optree <- d %.>%
  extend(.,
             probability %:=%
               exp(assessmentTotal * scale))  %.>%
  normalize_cols(.,
                 "probability",
                 partitionby = 'subjectID') %.>%
  pick_top_k(.,
             partitionby = 'subjectID',
             orderby = c('probability', 'surveyCategory'),
             reverse = c('probability', 'surveyCategory')) %.>%
  rename_columns(., 'diagnosis' %:=% 'surveyCategory') %.>%
  select_columns(., c('subjectID',
                      'diagnosis',
                      'probability')) %.>%
  orderby(., 'subjectID')
cat(format(optree))




