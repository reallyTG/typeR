library(KnowGRRF)


### Name: rf.repeat
### Title: Build random forest multiple times and return AUC for both
###   training and test set if available
### Aliases: rf.repeat

### ** Examples

##---- Example: classification  ----

set.seed(1)
X<-data.frame(matrix(rnorm(100*100), nrow=100))
b=seq(0.1, 2.2, 0.2) 
##y has a linear relationship with first 10 variables
y=b[5]*X$X4+b[6]*X$X5+b[7]*X$X6+b[8]*X$X7+b[9]*X$X8+b[10]*X$X9+b[11]*X$X10 
y=as.factor(ifelse(y>0, 1, 0)) ##classification

##split training and test set
X.train=X[1:70,]
X.test=X[71:100,]
y.train=y[1:70]
y.test=y[71:100]

rf.repeat(X.train, y.train, fea=1:20)  ##no test set
rf.repeat(X.train, y.train, X.test, y.test, 1:10)  ##relevant feature set
rf.repeat(X.train, y.train, X.test, y.test, 11:20)  ##irrelevant feature set




