library(KnowGRRF)


### Name: rrf.once
### Title: Feature selection by regularized random forest and compare
###   against full model
### Aliases: rrf.once

### ** Examples

##---- Example: regression ----
library(randomForest)

set.seed(1)
X<-data.frame(matrix(rnorm(100*100), nrow=100))
b=seq(0.1, 2.2, 0.2) 
##y has a linear relationship with first 10 variables
y=b[4]*X$X3+b[5]*X$X4+b[6]*X$X5+b[7]*X$X6+b[8]*X$X7+b[9]*X$X8+b[10]*X$X9+b[11]*X$X10 


##split training and test set
X.train=X[1:70,]
X.test=X[71:100,]
y.train=y[1:70]
y.test=y[71:100]

##use RRF to impute regularized coefficients
imp<-randomForest(X.train, y.train)$importance 
coefReg=imp/max(imp) 

rrf.once(X.train, y.train, X.test, y.test, coefReg)

##---- Example: classification ----
y=as.factor(ifelse(y>0, 1, 0)) ##classification
y.train=y[1:70]
y.test=y[71:100]

##use RRF to impute regularized coefficients
imp<-randomForest(X.train, y.train)$importance 
coefReg=imp/max(imp) 

rrf.once(X.train, y.train, X.test, y.test, coefReg)





