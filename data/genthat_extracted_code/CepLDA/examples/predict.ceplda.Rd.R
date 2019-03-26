library(CepLDA)


### Name: predict.ceplda
### Title: Classify Multivariate Time Series
### Aliases: predict.ceplda

### ** Examples

## See cep.lda for predicting new data simultaneously while fitting a model to training data.
## Below is predicting new data after fitting a model to the training data.  

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

## Simulate test data
testdata1 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.01,.7),r.phi2=c(-.12,-.06),r.sig2=c(.3,3))
testdata2 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.5,1.2),r.phi2=c(-.36,-.25),r.sig2=c(.3,3))
testdata3 <- r.cond.ar2(N=N,nj=nj,r.phi1=c(.9,1.5),r.phi2=c(-.56,-.75),r.sig2=c(.3,3))
test <- cbind(testdata1$X,testdata2$X,testdata3$X)
yTest <- c(rep(1,nj),rep(2,nj),rep(3,nj))


## Classifty new data
pre <- predict(fit,cep.get(yTest,test))
mean(pre$class == yTest)
table(yTest,pre$class)



