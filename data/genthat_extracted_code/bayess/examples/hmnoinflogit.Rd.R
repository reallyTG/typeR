library(bayess)


### Name: hmnoinflogit
### Title: Metropolis-Hastings for the logit model under a noninformative
###   prior
### Aliases: hmnoinflogit
### Keywords: logit model Metropolis-Hastings algorithm random walk
###   proposal noninformative prior

### ** Examples

data(bank)
bank=as.matrix(bank)
y=bank[,5]
X=bank[,1:4]
noinflogit=hmnoinflogit(1000,y,X,1)
par(mfrow=c(1,3),mar=1+c(1.5,1.5,1.5,1.5))
plot(noinflogit[,1],type="l",xlab="Iterations",ylab=expression(beta[1]))
hist(noinflogit[101:1000,1],nclass=50,prob=TRUE,main="",xlab=expression(beta[1]))
acf(noinflogit[101:1000,1],lag=10,main="",ylab="Autocorrelation",ci=FALSE)



