library(finalfit)


### Name: lmmixed
### Title: Mixed effects linear regression models: 'finalfit' model wrapper
### Aliases: lmmixed

### ** Examples

library(finalfit)
library(dplyr)

explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
random_effect = "hospital"
dependent = "nodes"

colon_s %>%
  lmmixed(dependent, explanatory, random_effect) %>%
	 fit2df(estimate_suffix=" (multilevel")



