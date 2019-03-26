library(dineq)


### Name: ntiles.wtd
### Title: Weighted tiles
### Aliases: ntiles.wtd

### ** Examples

#Break up the income variable in the Mexican Income data set into 10 groups (tiles)
data(mex_inc_2008)

#unweighted tiles:
q <- ntiles.wtd(x=mex_inc_2008$income, n=10)

#weighted tiles:
qw <- ntiles.wtd(x=mex_inc_2008$income, n=10, weights=mex_inc_2008$factor)




