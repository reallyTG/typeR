library(dineq)


### Name: rifrSE
### Title: Inference of recentered influence function regression (RIF
###   regression)
### Aliases: rifrSE

### ** Examples

data(mex_inc_2008)

#Recentered influence funtion of 20th quantile
rifr_q <- rifrSE(income~hh_structure+education, data=mex_inc_2008, weights="factor",
method="quantile", quantile=0.2, kernel="gaussian", Nboot=100, confidence=0.95)

#Recentered influence funtion of the gini coefficient
rifr_gini <- rifrSE(income~hh_structure+education, data=mex_inc_2008, weights="factor",
method="gini", Nboot=100, confidence=0.95)





