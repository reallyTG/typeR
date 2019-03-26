library(sjstats)


### Name: wtd_sd
### Title: Weighted statistics for tests and variables
### Aliases: wtd_sd wtd_mean wtd_se wtd_median svy_md wtd_chisqtest
###   wtd_chisqtest.default wtd_chisqtest.formula wtd_ttest
###   wtd_ttest.default wtd_ttest.formula wtd_mwu wtd_mwu.default
###   wtd_mwu.formula wtd_cor wtd_cor.default wtd_cor.formula

### ** Examples

# weighted sd and se ----

wtd_sd(rnorm(n = 100, mean = 3), runif(n = 100))

data(efc)
wtd_sd(efc[, 1:3], runif(n = nrow(efc)))
wtd_se(efc[, 1:3], runif(n = nrow(efc)))

# svy_md ----

# median for variables from weighted survey designs
library(survey)
data(nhanes_sample)

des <- svydesign(
  id = ~SDMVPSU,
  strat = ~SDMVSTRA,
  weights = ~WTINT2YR,
  nest = TRUE,
  data = nhanes_sample
)

svy_md(total, des)
svy_md("total", des)

# weighted t-test ----

efc$weight <- abs(rnorm(nrow(efc), 1, .3))
wtd_ttest(efc, e17age, weights = weight)
wtd_ttest(efc, e17age, c160age, weights = weight)
wtd_ttest(e17age ~ e16sex + weight, efc)

# weighted Mann-Whitney-U-test ----

wtd_mwu(c12hour ~ c161sex + weight, efc)

# weighted Chi-squared-test ----

wtd_chisqtest(efc, c161sex, e16sex, weights = weight, correct = FALSE)
wtd_chisqtest(c172code ~ c161sex + weight, efc)




