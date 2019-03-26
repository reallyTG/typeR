library(FisherEM)


### Name: fem
### Title: The Fisher-EM algorithm
### Aliases: fem

### ** Examples

data(iris)
res = fem(iris[,-5],K=3,model='DkBk',method='reg')
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))

## No test: 
# Fit several models and numbers of groups (use by default on non-Windows
# platforms the parallel computing).
res = fem(iris[,-5],K=2:6,model='all',method='svd')
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))
## End(No test)



