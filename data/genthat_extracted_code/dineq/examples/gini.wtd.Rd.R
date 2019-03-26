library(dineq)


### Name: gini.wtd
### Title: Gini coefficient
### Aliases: gini.wtd

### ** Examples

#calculate Gini coefficient using Mexican Income data set
data(mex_inc_2008)

#unweighted Gini coefficient:
gini.wtd(mex_inc_2008$income)

#weighted Gini coefficient:
gini.wtd(x=mex_inc_2008$income, weights=mex_inc_2008$factor)




