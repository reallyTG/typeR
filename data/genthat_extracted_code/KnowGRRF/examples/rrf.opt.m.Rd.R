library(KnowGRRF)


### Name: rrf.opt.m
### Title: KnowGRRF with weights from multiple knowledge domain
### Aliases: rrf.opt.m

### ** Examples

##---- Example: regression ----
library(randomForest)

set.seed(1)
X.train<-data.frame(matrix(rnorm(100*100), nrow=100))
b=seq(1, 6, 0.5) 
##y has a linear relationship with first 10 variables
y.train=b[7]*X.train$X6+b[8]*X.train$X7+b[9]*X.train$X8+b[10]*X.train$X9+b[11]*X.train$X10 


##use weights from domain knowledge. If not available, 
##can use statistic-based weights, e.g., variable importance, p/q value, etc
prior1 <- abs(c(rnorm(5, 5, 1), rnorm(95, 0, 1)))  
##domain 1 suggest first five are important variables
prior2 <- abs(c(rnorm(5, 0, 1), rnorm(5, 8, 2), rnorm(90, 0, 1)))  
##domain 2 suggest next five are important variables
imp<-randomForest(X.train, y.train)$importance 
prior3=0.5+0.5*imp/max(imp)   ##domain 3 uses relative varialbe importance



#'\donttest{
#'use optimization function to find the appropriate regularization term 
#'to scale weights and then apply the weights to guide the RRF

#'opt<-optim(par=c(1,1,1,1), fn=on.aic, X.train=X.train, Y.train=y.train, 
#'weight=cbind(prior1, prior2, prior3), iter=5,total=10, cutoff=0.5, num = 3, 
#'method='L-BFGS-B', lower=0.01, upper=0.5, control=list(fnscale=1,trace = TRUE)) 
#'can take long for four parameters to be optimized.
#'opt$par can be used as input of pwr in rrf.opt.m
#'}

rrf.opt.m(X.train, y.train, pwr=c(5,1,1,1), weight=cbind(prior1, prior2, prior3))  





