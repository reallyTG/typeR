library(BTdecayLasso)


### Name: BTdecayLassoC
### Title: Bradley-Terry Model with Exponential Decayed weighted likelihood
###   and weighted Lasso with AIC or BIC criteria
### Aliases: BTdecayLassoC

### ** Examples

##Initializing Dataframe
x <- BTdataframe(NFL2010)

##The following code runs the main results
## No test: 
##Model selection through AIC
z <- BTdecayLassoC(x$dataframe, x$ability, weight = NULL, fixed = x$worstTeam,
                   criteria = "AIC", type = "LASSO")
summary(z)

##If the whole Lasso path is run, we use it's result for model selection (recommended)
##Note that the decay.rate used in model selection should be consistent with
##the one which is used in whole Lasso path's run (keep the same model)
y1 <- BTdecayLasso(x$dataframe, x$ability, lambda = 0.1, 
                   decay.rate = 0.005, fixed = x$worstTeam)
                   
z1 <- BTdecayLassoC(x$dataframe, x$ability, weight = NULL, model = z1,
                    decay.rate = 0.005,
                    fixed = x$worstTeam, criteria = "BIC", type = "HYBRID")
## End(No test)




