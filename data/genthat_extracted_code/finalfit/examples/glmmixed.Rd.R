library(finalfit)


### Name: glmmixed
### Title: Mixed effects binomial logistic regression models: 'finalfit'
###   model wrapper
### Aliases: glmmixed

### ** Examples

library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "mort_5yr"

colon_s %>%
  glmmixed(dependent, explanatory, random_effect) %>%
	 fit2df(estimate_suffix=" (multilevel")



