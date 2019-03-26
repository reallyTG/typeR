library(CepLDA)


### Name: Lopt.get
### Title: Optimal Choice of L
### Aliases: Lopt.get

### ** Examples

## Simulate data
ntrain = 50  #number of series in training data
Nlength = 500 #length of each series
set.seed(2016)
traindata1 <- r.cond.ar2(N=Nlength,nj=ntrain,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
traindata2 <- r.cond.ar2(N=Nlength,nj=ntrain,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
traindata3 <- r.cond.ar2(N=Nlength,nj=ntrain,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
train <- cbind(traindata1$X,traindata2$X,traindata3$X)
## group information
y <- c(rep(1,ntrain),rep(2,ntrain),rep(3,ntrain))
dat <- cep.get(y,train)
Lopt.get(dat,10)



