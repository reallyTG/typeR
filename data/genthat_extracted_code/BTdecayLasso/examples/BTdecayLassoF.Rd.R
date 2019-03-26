library(BTdecayLasso)


### Name: BTdecayLassoF
### Title: Bradley-Terry Model with Exponential Decayed weighted likelihood
###   and Adaptive Lasso with a given penalty rate
### Aliases: BTdecayLassoF

### ** Examples

##Initializing Dataframe
x <- BTdataframe(NFL2010)

##The following code runs the main results
## No test: 
##BTdecayLasso run with exponential decay rate 0.005 and Lasso penaty 0.5
y <- BTdecayLassoF(x$dataframe, x$ability, 0.5, decay.rate = 0.005, 
                   fixed = x$worstTeam)
summary(y)
## End(No test)




