library(KnowGRRF)


### Name: select.stable.aic
### Title: Select a set of stable features based on AIC after an initial
###   selection by GRRF
### Aliases: select.stable.aic

### ** Examples

##---- Example: classification  ----
library(randomForest)

set.seed(1)
X.train<-data.frame(matrix(rnorm(100*100), nrow=100))
b=seq(0.1, 2.2, 0.2) 
##y has a linear relationship with first 10 variables
y.train=b[7]*X.train$X6+b[8]*X.train$X7+b[9]*X.train$X8+b[10]*X.train$X9+b[11]*X.train$X10 
y.train=ifelse(y.train>0, 1, 0) ##classification

##use RRF to impute regularized coefficients
imp<-randomForest(X.train, as.factor(y.train))$importance 
coefReg=0.5+0.5*imp/max(imp) 

##select a stable set of feature that are selected by GRRF followed by stepAIC
select.stable.aic(X.train, as.factor(y.train), coefReg)




