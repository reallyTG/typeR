library(lmeNB)


### Name: CP.ar1.se
### Title: Compute a conditional probability of observing a set of counts
###   as extreme as the new observations of a subjectvisit given the
###   previous observations of the same subject based on the negative
###   binomial mixed-effect AR(1) model.
### Aliases: CP.ar1.se jCP.ar1 CP1.ar1 MCCP.ar1
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D ilgt <- function (x) 
##D {
##D     tem = exp(x)
##D     res = tem/(1 + tem)
##D     return(res)
##D }
##D lgt <- function (p) 
##D {
##D     log(p/(1 - p))
##D }
##D ## the vector of a parameter estimates if log(a),log(theta),logit(delta),beta0.
##D tpar  <- c(log(2),log(0.5),lgt(0.5),2)
##D ypre <- c(0, 1)
##D ynew <- c(1, 0, 0)
##D ## No covariate
##D XM <- NULL
##D ## no missing visit
##D stp <- c(0,1,1,1,1)
##D RE <- "G"
##D ## The estimate of the variance covariance matrix
##D V <-
##D matrix(
##D c( 0.17720309, -0.240418504,  0.093562548,  0.009141980,
##D   -0.24041850,  0.605132808, -0.160454773, -0.003978118,
##D    0.09356255, -0.160454773,  0.095101658,  0.005661923,
##D    0.00914198, -0.003978118,  0.005661923,  0.007574769),
##D nrow=4)
##D 
##D ## the estimate of the conditional probability based on the sum summary statistics and its SE
##D CP.ar1.se(tpar = tpar, ypre = ypre, ynew = ynew, 
##D 	  XM =XM, stp = stp, 
##D 	  RE = RE, V = V, MC = FALSE, qfun = "sum")
##D 
##D ## the estimate of the conditional probability based on the max summary statistics and its SE
##D CP.ar1.se(tpar = tpar, ypre = ypre, ynew = ynew, 
##D 	  XM =XM, stp = stp, 
##D 	  RE = RE, V = V, MC = FALSE, qfun = "max")
##D 
##D 
##D ## CP.ar1.se calls for jCP.ar1 to compute the estimate of the conditional probability
##D ## the estimate of the conditional probability based on the sum summary statistics
##D jCP.ar1(tpar = tpar, ypre = ypre, ynew = ynew,
##D 	y2m=NULL,  XM =XM, stp = stp,
##D         RE = RE, LG = FALSE, MC = FALSE, N.MC = 40000, qfun = "sum", oth = NULL)
##D 
##D ## jCP.ar1 calls for CP.ar1 to compute the estimate of the conditional probability 
##D ## via the adaptive quadrature (MC=F)
##D ## the estimate of the conditional probability
##D 
##D u <- rep(exp(tpar[4]),length(ypre)+length(ynew))
##D 
##D CP1.ar1(ypre = ypre, ynew =ynew, 
##D 	stp =stp, u = u, th = exp(tpar[2]), a = exp(tpar[1]), 
##D 	dt= ilgt(tpar[3]), RE = RE, qfun = "sum")
##D 
##D 
##D ## jCP.ar1 calls for CP.ar1 to compute the estimate of the conditional probability 
##D ## via the Monte Carlo method (MC=T)
##D ## the estimate of the conditional probability
##D MCCP.ar1(ypre = ypre, ynew =ynew, stp = stp, 
##D 	 u = u, th = exp(tpar[2]), a = exp(tpar[1]),  dt = ilgt(tpar[3]), 
##D 	 RE = RE, N.MC = 1000, qfun = "sum")
## End(Not run)




