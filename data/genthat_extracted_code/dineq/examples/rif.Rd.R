library(dineq)


### Name: rif
### Title: Recentered influence function (RIF)
### Aliases: rif

### ** Examples

data(mex_inc_2008)

#Recentered influence funtion of 20th quantile
rif_q20 <- rif(x=mex_inc_2008$income, weights=mex_inc_2008$factor, method="quantile",
quantile=0.2)

#Recentered influence funtion of the gini coefficient
rif_gini <- rif(x=mex_inc_2008$income, weights=mex_inc_2008$factor, method="gini")




