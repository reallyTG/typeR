library(finalfit)


### Name: missing_pattern
### Title: Characterise missing data for 'finalfit' models
### Aliases: missing_pattern

### ** Examples

library(finalfit)
library(dplyr)
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"

colon_s %>%
	missing_pattern(dependent, explanatory)




