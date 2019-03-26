library(KnowGRRF)


### Name: rrf.opt.1
### Title: KnowGRRF with weights from one knowledge domain
### Aliases: rrf.opt.1

### ** Examples

##---- Example: classification ----
library(randomForest)

set.seed(1)
X.train<-data.frame(matrix(rnorm(10*100), nrow=100))
b=seq(1, 6, 0.5) 
##y has a linear relationship with 5 variables
y.train=b[7]*X.train$X6+b[8]*X.train$X7+b[9]*X.train$X8+b[10]*X.train$X9+b[11]*X.train$X10 
y.train=as.factor(ifelse(y.train>0, 1, 0)) ##classification

##use weights from domain knowledge. If not available, 
##can use statistic-based weights, e.g., variable importance, p/q value, etc
imp<-randomForest(X.train, y.train)$importance 
coefReg=0.5+0.5*imp/max(imp) 


#'\donttest{
#'use optimization function to find the appropriate regularization term 
#'to scale weights and then apply the weights to guide the RRF

#'opt<-optim(par=5, fn=on.aic, X.train=X.train, Y.train=y.train, 
#'weight=coefReg, iter=5,total=10, cutoff=0.5, num = 1, method='L-BFGS-B', 
#'lower=1, upper=10, control=list(fnscale=1,factr=100, trace = TRUE)) 
#'gives an error because under the initial value and searching space, 
#'no feature is selected, could try smaller number for initialization


#'opt<-optim(par=1, fn=on.aic, X.train=X.train, Y.train=y.train, 
#'weight=coefReg, iter=5,total=10, cutoff=0.5, num = 1, method='L-BFGS-B', 
#'lower=0.01, upper=0.5, control=list(fnscale=1,factr=100, trace = TRUE)) 
#'converged, could take long to run, opt$par returns pwr that could be used in rrf.opt.1
#'}

rrf.opt.1(X.train, y.train, pwr=1, weight=coefReg, total=5)  




