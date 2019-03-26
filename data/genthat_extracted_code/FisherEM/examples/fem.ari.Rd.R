library(FisherEM)


### Name: fem.ari
### Title: Adjusted Rand index
### Aliases: fem.ari

### ** Examples

data(iris)
res = fem(iris[,-5],K=3,model='DkBk',method='reg')
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))



