library(CDM)


### Name: deltaMethod
### Title: Variance Matrix of a Nonlinear Estimator Using the Delta Method
### Aliases: deltaMethod

### ** Examples

#############################################################################
# EXAMPLE 1: Nonlinear parameter
#############################################################################

#-- parameter estimate
est <- c( 510.67, 102.57)
names(est) <- c("mu", "sigma")
#-- covariance matrix
Sigma <- matrix( c(5.83, 0.45, 0.45, 3.21 ), nrow=2, ncol=2 )
colnames(Sigma) <- rownames(Sigma) <- names(est)
#-- define derived nonlinear parameters
derived.pars <- list( "d"=~ I( ( mu - 508 ) / sigma ),
                      "dsig"=~ I( sigma / 100 - 1) )

#*** apply delta method
res <- CDM::deltaMethod( derived.pars, est, Sigma )
res



