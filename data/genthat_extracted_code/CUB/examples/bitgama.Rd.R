library(CUB)


### Name: bitgama
### Title: Shifted Binomial distribution with covariates
### Aliases: bitgama
### Keywords: distribution

### ** Examples

n<-100
m<-7
W<-sample(c(0,1),n,replace=TRUE)
gama<-c(0.2,-0.2)
csivett<-logis(W,gama)
ordinal<-rbinom(n,m-1,csivett)+1
pr<-bitgama(m,ordinal,W,gama)



