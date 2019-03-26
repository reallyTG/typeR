library(BTdecayLasso)


### Name: boot.BTdecayLasso
### Title: Compute the standard deviation of Bradley-Terry decay Lasso
###   model by bootstrapping
### Aliases: boot.BTdecayLasso

### ** Examples

##Initialize the dataframe and ability
x <- BTdataframe(NFL2010)

##The following code runs the main results
## No test: 
##Run Lasso estimate for whole Lasso path
z <- BTdecayLasso(x$dataframe, x$ability, fixed = x$worstTeam)

##Model selection using AIC with Lasso's likelihood
z1 <- BTdecayLassoC(x$dataframe, x$ability, model = z, 
                    criteria = "AIC", type = "LASSO", fixed = x$worstTeam)

##Bootstrapping for model with lowest AIC score for 100 times.
##Note that the decay.rate used in model selection should be consistent with
##the one which is used in whole Lasso path's run (keep the same model)
z2 <- boot.BTdecayLasso(x$dataframe, x$ability, lambda = z1$Optimal.lambda, 
                        boot = 100, fixed = x$worstTeam)
## End(No test)




