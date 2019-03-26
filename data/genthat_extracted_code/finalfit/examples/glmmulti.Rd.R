library(finalfit)


### Name: glmmulti
### Title: Binomial logistic regression multivariable models: 'finalfit'
###   model wrapper
### Aliases: glmmulti

### ** Examples

library(finalfit)
library(dplyr)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"

colon_s %>%
	glmmulti(dependent, explanatory) %>%
	fit2df(estimate_suffix=" (univariable)")




