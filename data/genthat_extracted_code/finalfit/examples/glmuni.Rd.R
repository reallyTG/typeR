library(finalfit)


### Name: glmuni
### Title: Binomial logistic regression univariable models: 'finalfit'
###   model wrapper
### Aliases: glmuni

### ** Examples

library(finalfit)
library(dplyr)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"

colon_s %>%
	glmuni(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (univariable)")





