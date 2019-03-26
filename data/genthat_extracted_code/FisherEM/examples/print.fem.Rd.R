library(FisherEM)


### Name: print.fem
### Title: The print function for 'fem' objects.
### Aliases: print.fem

### ** Examples

data(iris)
res = fem(iris[,-5],K=3,model='DkBk',method='reg')
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))



