library(bssn)


### Name: EMbssn
### Title: EM Algorithm Birnbaum-Saunders model based on Skew-Normal
###   distribution
### Aliases: EMbssn
### Keywords: EM bssn

### ** Examples

## Not run: 
##D #Using the ozone data
##D 
##D data(ozone)
##D attach(ozone)
##D 
##D #################################
##D #The model
##D  ti        <- dailyozonelevel
##D 
##D #Initial values for the parameters
##D  initial   <- mmmeth(ti)
##D  alpha0    <- initial$alpha0ini
##D  beta0     <- initial$beta0init
##D  lambda0   <- 0
##D  delta0    <- lambda0/sqrt(1+lambda0^2)
##D 
##D #Estimated parameters of the model (by default)
##D  est_param <- EMbssn(ti,alpha0,beta0,delta0,loglik=T,
##D  accuracy = 1e-8,show.envelope = "TRUE", iter.max=500)
##D 
##D #ML estimates
##D  alpha     <- est_param$res$alpha
##D  beta      <- est_param$res$beta
##D  lambda    <- est_param$res$lambda
##D 
##D 
##D #########################################
##D #A simple output example
##D 
##D ---------------------------------------------------------
##D Birnbaum-Saunders model based on Skew-Normal distribution
##D ---------------------------------------------------------
##D 
##D Observations = 116
##D -----------
##D Estimates
##D -----------
##D 
##D        Estimate Std. Error z value Pr(>|z|)
##D alpha   1.26014    0.23673 5.32311  0.00000
##D beta   14.65730    4.01984 3.64624  0.00027
##D lambda  1.06277    0.54305 1.95706  0.05034
##D ------------------------
##D Model selection criteria
##D ------------------------
##D 
##D         Loglik   AIC   BIC   HQC
##D Value -542.768 4.705 4.741 4.719
##D -------
##D Details
##D -------
##D 
##D Iterations = 415
##D Processing time = 0.4283214 secs
##D Convergence = TRUE
## End(Not run)



