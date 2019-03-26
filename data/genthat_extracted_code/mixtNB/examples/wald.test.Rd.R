library(mixtNB)


### Name: wald.test
### Title: Wald test for performing DE analysis
### Aliases: wald.test
### Keywords: RNA-Seq data Wald test

### ** Examples

lambda.de<-matrix(runif(100,0,250),100)
lambda.de=cbind(lambda.de,lambda.de/exp(rnorm(100,0.5,0.125)))
lambda<-rbind(lambda.de,matrix(runif(900,0,250),900,2))
a<-runif(1000,0.5,600)
cr<-rep(1:2,each=5)
y<-matrix(0,1000,10)
for (i in 1:1000) for (l in 1:10) y[i,l]<-rnbinom(1,mu=lambda[i,cr[l]],size=a[i])
fit=fit.mixtNB(y,cr,K=3)
DE.genes=wald.test(fit)



