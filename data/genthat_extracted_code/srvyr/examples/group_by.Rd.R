library(srvyr)


### Name: group_by
### Title: Group a (survey) dataset by one or more variables.
### Aliases: group_by group_by_

### ** Examples

# Examples of svy_tbl group_by
library(survey)
data(api)
dstrata <- apistrat %>%
  as_survey_design(strata = stype, weights = pw) %>%
  group_by(stype)

  dstrata %>%
    summarise(api_diff = survey_mean(api00 - api99))



