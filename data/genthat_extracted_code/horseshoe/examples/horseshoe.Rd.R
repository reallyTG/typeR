library(horseshoe)


### Name: horseshoe
### Title: Function to implement the horseshoe shrinkage prior in Bayesian
###   linear regression
### Aliases: horseshoe

### ** Examples

## Not run: 
##D #In this example, there are no relevant predictors
##D #20 observations, 30 predictors (betas)
##D y <- rnorm(20)
##D X <- matrix(rnorm(20*30) , 20)
##D res <- horseshoe(y, X, method.tau = "truncatedCauchy", method.sigma = "Jeffreys")
##D 
##D plot(y, X%*%res$BetaHat) #plot predicted values against the observed data
##D res$TauHat #posterior mean of tau
##D HS.var.select(res, y, method = "intervals") #selected betas
##D #Ideally, none of the betas is selected (all zeros)
##D #Plot the credible intervals
##D library(Hmisc)
##D xYplot(Cbind(res$BetaHat, res$LeftCI, res$RightCI) ~ 1:30)
## End(Not run)

## Not run: 
##D  #The horseshoe applied to the sparse normal means problem
##D # (note that HS.normal.means is much faster in this case)
##D X <- diag(100)
##D beta <- c(rep(0, 80), rep(8, 20))
##D y <- beta + rnorm(100)
##D res2 <- horseshoe(y, X, method.tau = "truncatedCauchy", method.sigma = "Jeffreys")
##D #Plot predicted values against the observed data (signals in blue)
##D plot(y, X%*%res2$BetaHat, col = c(rep("black", 80), rep("blue", 20)))
##D res2$TauHat #posterior mean of tau
##D HS.var.select(res2, y, method = "intervals") #selected betas
##D #Ideally, the final 20 predictors are selected
##D #Plot the credible intervals
##D library(Hmisc)
##D xYplot(Cbind(res2$BetaHat, res2$LeftCI, res2$RightCI) ~ 1:100)
## End(Not run)




