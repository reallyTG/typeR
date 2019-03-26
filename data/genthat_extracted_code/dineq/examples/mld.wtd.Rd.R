library(dineq)


### Name: mld.wtd
### Title: Mean log deviation
### Aliases: mld.wtd

### ** Examples

#calculate mean log deviation using Mexican Income data set
data(mex_inc_2008)

#unweighted mean log deviation:
mld.wtd(mex_inc_2008$income)

#weighted mean log deviation:
mld.wtd(x=mex_inc_2008$income, weights=mex_inc_2008$factor)




