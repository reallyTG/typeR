library(surveydata)


### Name: dplyr-surveydata
### Title: Methods to support dplyr verbs.
### Aliases: dplyr-surveydata mutate.surveydata as.tbl.surveydata
###   select.surveydata filter.surveydata filter arrange.surveydata
###   summarize.surveydata slice.surveydata
### Keywords: internal

### ** Examples

library(dplyr)
membersurvey %>% as.tbl() %>% filter(Q2 == 2009)



