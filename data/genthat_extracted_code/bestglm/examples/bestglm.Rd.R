library(bestglm)


### Name: bestglm
### Title: Best Subset GLM using Information Criterion or Cross-Validation
### Aliases: bestglm
### Keywords: models regression

### ** Examples

#Example 1. 
#White noise test.
set.seed(123321123)
p<-25   #number of inputs
n<-100  #number of observations
X<-matrix(rnorm(n*p), ncol=p)
y<-rnorm(n)
Xy<-as.data.frame(cbind(X,y))
names(Xy)<-c(paste("X",1:p,sep=""),"y")
bestAIC <- bestglm(Xy, IC="AIC")
bestBIC <- bestglm(Xy, IC="BIC")
bestEBIC <- bestglm(Xy, IC="BICg")
bestBICq <- bestglm(Xy, IC="BICq")
NAIC <- length(coef(bestAIC$BestModel))-1
NBIC <- length(coef(bestBIC$BestModel))-1
NEBIC <- length(coef(bestEBIC$BestModel))-1
NBICq <- length(coef(bestBICq$BestModel))-1
ans<-c(NAIC, NBIC, NEBIC, NBICq)
names(ans)<-c("AIC", "BIC", "BICg", "BICq")
ans
# AIC  BIC EBIC BICq 
#   3    1    0    0 

#Example 2. bestglm with BICq
#Find best model. Default is BICq with q=0.25
data(znuclear) #standardized data. 
#Rest of examples assume this dataset is loaded.
out<-bestglm(znuclear, IC="BICq")
out
#The optimal range for q
out$Bestq
#The possible models that can be chosen
out$qTable
#The best models for each subset size
out$Subsets
#The overall best models
out$BestModels
#
#Example 3. Normal probability plot, residuals, best model
ans<-bestglm(znuclear, IC="BICq")
e<-resid(ans$BestModel)
qqnorm(e, ylab="residuals, best model")
#
#To save time, none of the remaining examples are run
## Not run: 
##D #Example 4. bestglm, using EBIC, g=1
##D bestglm(znuclear, IC="BICg")
##D #EBIC with g=0.5
##D bestglm(znuclear, IC="BICg", t=0.5)
##D #
##D #Example 5. bestglm, CV
##D data(zprostate)
##D train<-(zprostate[zprostate[,10],])[,-10]
##D #the default CV method takes too long, set t=10 to do only
##D # 10 replications instead of the recommended 1000
##D bestglm(train, IC="CV", t=10)
##D bestglm(train, IC="CV", CVArgs=list(Method="HTF", K=10, REP=1))
##D #Compare with DH Algorithm. Normally set REP=100 is recommended.
##D bestglm(train, IC="CV", CVArgs=list(Method="DH", K=10, REP=1))
##D #Compare LOOCV
##D bestglm(train, IC="LOOCV")
##D #
##D #Example 6. Optimal q for manpower dataset
##D data(manpower)
##D out<-bestglm(manpower)
##D out$Bestq
##D #
##D #Example 7. Factors with more than 2 levels
##D data(AirQuality)
##D bestglm(AirQuality)
##D #
##D #Example 8. Logistic regression
##D data(SAheart)
##D bestglm(SAheart, IC="BIC", family=binomial)
##D #BIC agrees with backward stepwise approach
##D out<-glm(chd~., data=SAheart, family=binomial)
##D step(out, k=log(nrow(SAheart)))
##D #but BICq with q=0.25
##D bestglm(SAheart, IC="BICq", t=0.25, family=binomial)
##D #
##D #Cross-validation with glm
##D #make reproducible results
##D set.seed(33997711)
##D #takes about 15 seconds and selects 5 variables
##D bestglm(SAheart, IC="CV", family=binomial)
##D #about 6 seconds and selects 2 variables
##D bestglm(SAheart, IC="CV", CVArgs=list(Method="HTF", K=10, REP=1), family=binomial)
##D #Will produce an error -- NA
##D \dontrun{bestglm(SAheart, IC="CV", CVArgs=list(Method="DH", K=10, REP=1), family=binomial)}
##D \dontrun{bestglm(SAheart, IC="LOOCV", family=binomial)}
##D #
##D #Example 9. Model with no intercept term
##D X<-matrix(rnorm(200*3), ncol=3)
##D b<-c(0, 1.5, 0)
##D y<-X%*%b + rnorm(40)
##D Xy<-data.frame(as.matrix.data.frame(X), y=y)
##D bestglm(Xy, intercept=FALSE) 
## End(Not run)




