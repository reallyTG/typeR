library(episheet)


### Name: rate
### Title: Calculate risk ratio and risk difference
### Aliases: rate

### ** Examples


# Using individual level data

data(ebola)
library(dplyr)
ebola %>%
 mutate(male = ifelse(sex == "male", 1, 0)) %>%
  rate(outcome = died, denominator = days_at_risk, exposure = male,
  per_unit = 100)

# Using aggregated data
# Table 14-2
cancer_xray <- data.frame(cases = c(41, 15), pyar = c(28010, 19017),
radiation = c(1, 0))
cancer_xray
cancer_xray %>%
  rate(outcome = cases, denominator = pyar, exposure = radiation,
    per = 100000)



