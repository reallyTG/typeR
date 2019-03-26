library(betareg)


### Name: FoodExpenditure
### Title: Proportion of Household Income Spent on Food
### Aliases: FoodExpenditure
### Keywords: datasets

### ** Examples

data("FoodExpenditure", package = "betareg")

## Ferrari and Cribari-Neto (2004)
## Section 4
fe_lin <- lm(I(food/income) ~ income + persons, data = FoodExpenditure)
library("lmtest")
bptest(fe_lin)

## Table 2
fe_beta <- betareg(I(food/income) ~ income + persons, data = FoodExpenditure)
summary(fe_beta)



