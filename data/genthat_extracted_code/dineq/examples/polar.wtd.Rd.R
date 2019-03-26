library(dineq)


### Name: polar.wtd
### Title: Polarization index
### Aliases: polar.wtd

### ** Examples

#calculate Polarization Index using Mexican Income data set
data(mex_inc_2008)

#unweighted Polarization Index:
polar.wtd(mex_inc_2008$income)

#weighted Polarization Index:
polar.wtd(x=mex_inc_2008$income, weights=mex_inc_2008$factor)




