library(finalfit)


### Name: glmmulti_boot
### Title: Binomial logistic regression multivariable models with
###   bootstrapped confidence intervals: 'finalfit' model wrapper
### Aliases: glmmulti_boot

### ** Examples

library(finalfit)
library(dplyr)
## Note number of draws set to 100 just for speed in this example
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"

colon_s %>%
  glmmulti_boot(dependent, explanatory, R=100) %>%
  fit2df(estimate_suffix="(multivariable (BS CIs))")




