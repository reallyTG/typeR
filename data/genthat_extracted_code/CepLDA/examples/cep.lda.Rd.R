library(CepLDA)


### Name: cep.lda
### Title: Discriminant Analysis of Time Series in the Presence of
###   Within-Group Spectral Variability
### Aliases: cep.lda

### ** Examples

## Simulate training data
nj = 50  #number of series in training data
N = 500  #length of time series
traindata1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
traindata2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
traindata3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
train <- cbind(traindata1$X,traindata2$X,traindata3$X)
y <- c(rep(1,nj),rep(2,nj),rep(3,nj))

## Fit the discriminant analysis
fit <- cep.lda(y,train)
fit  #displays group means and cepstral weight functions

## Discriminant plot
plot(fit)

## Plot log-spectral weights
par(mfrow=c(1,2))
plot(fit$lspec$frq, fit$lspec$dsc[,1],type='l',xlab="frequency", ylab="log-spectral weights")
plot(fit$lspec$frq, fit$lspec$dsc[,2],type='l',xlab="frequency", ylab="log-spectral weights")

## Bias classification of training data
mean(fit$predict$class == y) #classifictaion rate
table(y,fit$predict$class)

## Fit the discriminant analysis while classifing training data via cross-validation
fit.cv <- cep.lda(y,train, cv=TRUE)
mean(fit.cv$predict$class == y) #classifictaion rate
table(y,fit.cv$predict$class)

## Simulate test data
testdata1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
testdata2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
testdata3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
test <- cbind(testdata1$X,testdata2$X,testdata3$X)
yTest <- c(rep(1,nj),rep(2,nj),rep(3,nj))

## Fit discriminant analysis and classify new data
fit.pre <- cep.lda(y,train,test)
mean(fit.pre$predict$class == y)
table(yTest,fit.pre$predict$class)



