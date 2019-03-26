library(PurBayes)


### Name: PurBayes
### Title: Bayesian Estimation of Tumor Purity and Clonality
### Aliases: PurBayes

### ** Examples

#Homogeneous tumor example
N.var<-20
N<-round(runif(N.var,20,200))
lambda<-0.75
Y<-rbinom(N.var,N,lambda/2)
## Not run: PB.hom<-PurBayes(N,Y)

#Heterogeneous tumor example - 1 subclonal population
N.var<-20
N<-round(runif(N.var,20,200))
lambda.1<-0.75
lambda.2<-0.25
lambda<-c(rep(lambda.1,10),rep(lambda.2,10))
Y<-rbinom(N.var,N,lambda/2)
## Not run: PB.het<-PurBayes(N,Y)



