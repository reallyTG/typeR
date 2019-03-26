library(dineq)


### Name: rifr
### Title: Recentered influence function regression (RIF Regression)
### Aliases: rifr

### ** Examples

data(mex_inc_2008)

#Recentered influence funtion of each decile
rifr_q <- rifr(income~hh_structure+education, data=mex_inc_2008, weights="factor",
method="quantile", quantile=seq(0.1,0.9,0.1), kernel="gaussian")

#Recentered influence funtion of the gini coefficient
rifr_gini <- rifr(income~hh_structure+education, data=mex_inc_2008, weights="factor",
method="gini")





