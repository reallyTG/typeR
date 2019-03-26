library(finalfit)


### Name: summary_factorlist
### Title: Summarise a set of factors (or continuous variables) by a
###   dependent variable
### Aliases: summary_factorlist

### ** Examples

library(finalfit)
library(dplyr)
# Load example dataset, modified version of survival::colon
data(colon_s)

# Table 1 - Patient demographics ----
explanatory = c("age", "age.factor", "sex.factor", "obstruct.factor")
dependent = "perfor.factor"
colon_s %>%
	summary_factorlist(dependent, explanatory, p=TRUE)

# summary.factorlist() is also commonly used to summarise any number of
# variables by an outcome variable (say dead yes/no).

# Table 2 - 5 yr mortality ----
explanatory = c("age.factor", "sex.factor", "obstruct.factor", "perfor.factor")
dependent = "mort_5yr"
colon_s %>%
	summary_factorlist(dependent, explanatory)



