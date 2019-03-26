library(mispr)


### Name: mispr
### Title: Multiple Imputation with Sequential Penalized Regression
### Aliases: mispr

### ** Examples

data(data1)
# Select a subset of data1 
x=data1[ , 1:10]
res1 = mispr(x)
# to get 3 multiply imputed datasets
res2 = mispr(x, m=3)




