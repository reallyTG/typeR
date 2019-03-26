library(FisherEM)


### Name: plot.fem
### Title: The plot function for 'fem' objects.
### Aliases: plot.fem

### ** Examples

data(iris)
res = fem(iris[,-5],K=3,model='DkBk',method='reg')
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))



