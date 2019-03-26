library(bayess)


### Name: hmflatprobit
### Title: Metropolis-Hastings for the probit model under a flat prior
### Aliases: hmflatprobit
### Keywords: flat prior probit model Metropolis-Hastings algorithm random
###   walk proposal

### ** Examples

data(bank)
bank=as.matrix(bank)
y=bank[,5]
X=bank[,1:4]
flatprobit=hmflatprobit(1000,y,X,1)
mean(flatprobit[101:1000,1])



