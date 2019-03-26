library(bestglm)


### Name: bestglm-package
### Title: bestglm: Best Subset GLM
### Aliases: bestglm-package
### Keywords: package

### ** Examples

## Not run: 
##D data(zprostate)
##D train<-(zprostate[zprostate[,10],])[,-10]
##D #Best subset using AIC
##D bestglm(train, IC="AIC")
##D #Best subset using BIC
##D bestglm(train, IC="BIC")
##D #Best subset using EBIC
##D bestglm(train, IC="BICg")
##D #Best subset using BICg with g=0.5 (tuning parameter)
##D bestglm(train, IC="BICg", t=0.5)
##D #Best subset using BICq. Note BICq with q=0.25 is default.
##D bestglm(train, IC="BICq")
##D #Best subset using BICq with q=0.5 (equivalent to BIC)
##D bestglm(train, IC="BICq", t=0.5)
##D #Remark: set seed since CV depends on it
##D set.seed(123321123)
##D bestglm(train, IC="CV", t=10)
##D #using HTF method
##D bestglm(train, IC="CV", CVArgs=list(Method="HTF", K=10, REP=1))
##D #Best subset, logistic regression
##D data(SAheart)
##D bestglm(SAheart, IC="BIC", family=binomial)
##D #Best subset, factor variables with more than 2 levels
##D data(AirQuality)
##D #subset
##D bestglm(AirQuality, IC="BICq")
## End(Not run)



