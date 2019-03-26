library(srvyr)


### Name: summarise
### Title: Summarise multiple values to a single value.
### Aliases: summarise summarize

### ** Examples

library(survey)
data(api)

dstrata <- apistrat %>%
  as_survey_design(strata = stype, weights = pw)

dstrata %>%
  summarise(api99 = survey_mean(api99),
            api00 = survey_mean(api00),
            api_diff = survey_mean(api00 - api99))

dstrata_grp <- dstrata %>%
  group_by(stype)

dstrata_grp %>%
  summarise(api99 = survey_mean(api99),
            api00 = survey_mean(api00),
            api_diff = survey_mean(api00 - api99))




