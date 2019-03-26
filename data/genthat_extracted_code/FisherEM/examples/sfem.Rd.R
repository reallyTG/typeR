library(FisherEM)


### Name: sfem
### Title: The sparse Fisher-EM algorithm
### Aliases: sfem

### ** Examples

data(iris)
res = sfem(iris[,-5],K=3,model='DkBk',l1=seq(.01,.3,.05))
res
plot(res)
fem.ari(res,as.numeric(iris[,5]))



