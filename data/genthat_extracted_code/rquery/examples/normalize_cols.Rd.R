library(rquery)


### Name: normalize_cols
### Title: Build an optree pipeline that normalizes a set of columns so
###   each column sums to one in each partition.
### Aliases: normalize_cols

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
             reverse = c('probability')) %.>%
  rename_columns(., 'diagnosis' %:=% 'surveyCategory') %.>%
  select_columns(., c('subjectID',
                      'diagnosis',
                      'probability')) %.>%
  orderby(., 'subjectID')
cat(format(optree))




