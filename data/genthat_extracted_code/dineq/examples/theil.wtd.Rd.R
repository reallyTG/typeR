library(dineq)


### Name: theil.wtd
### Title: Theil index
### Aliases: theil.wtd

### ** Examples

#calculate Theil Index using Mexican Income data set
data(mex_inc_2008)

#unweighted Theil Index:
theil.wtd(mex_inc_2008$income)

#weighted Theil Index:
theil.wtd(x=mex_inc_2008$income, weights=mex_inc_2008$factor)




