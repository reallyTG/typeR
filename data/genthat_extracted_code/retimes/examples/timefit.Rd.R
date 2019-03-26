library(retimes)


### Name: timefit
### Title: Analyzing Reaction Times
### Aliases: timefit timefit-class show,timefit-method plot,timefit-method
###   logLik,timefit-method AIC,timefit-method BIC,timefit-method

### ** Examples
## Not run: 
##D 
##D # Vector of reaction times from Heathcote (1996):
##D RT <- c(474.688, 506.445, 524.081, 530.672, 530.869,
##D         566.984, 582.311, 582.940, 603.574, 792.358)
##D RTfit <- timefit(RT); RTfit
##D 
##D # Boostrap tesing with simulated data (m=500, s=100, t=250):
##D 
##D x1 <- c(451.536,958.612,563.538,505.735,1266.825,
##D         860.663,457.707,268.679,587.303,669.594)
##D fit1a <- timefit(x1); fit1a
##D fit1b <- timefit(x1, iter=1000); fit1b
##D 
##D x2 <- c(532.474,525.185,1499.471,480.732,631.752,
##D         672.419,322.341,571.356,428.832,680.848)
##D fit2a <- timefit(x2, plot=TRUE); fit2a
##D fit2b <- timefit(x2, iter=1000, plot=TRUE); fit2b
##D 
## End(Not run)



