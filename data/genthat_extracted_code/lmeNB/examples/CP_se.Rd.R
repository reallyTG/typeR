library(lmeNB)


### Name: CP.se
### Title: Compute a conditional probability of observing a set of counts
###   as extreme as the new observations of a subject given the previous
###   observations from the same subject based on the negative binomial
###   mixed effect independent model.
### Aliases: jCP CP.se
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## tpar contains: log(a),log(theta),beta0
##D tpar <-  c(0.5, -0.5, 1.3)
##D ## A scalar containing the sum of the response counts in pre scans
##D Y1 <- 0
##D ## A scalar containing the summary statistics of the response counts in new scans q(y_new)
##D Y2 <- 1
##D ## The number of scans in the pre scans.
##D sn1 <- 2
##D ## The number of scans in the new scans.
##D sn2 <- 3
##D ## the covariate matrix
##D XM <- NULL
##D RE <- "G"
##D ## the variance covariance matrix:
##D V <- matrix(
##D   c(0.0490673003, -0.0004481864, 0.013279476,
##D    -0.0004481864,  0.0245814022, 0.001231522,
##D     0.0132794760,  0.0012315221, 0.023888065),nrow=3)
##D 
##D ## the estimate of the conditional probability based on the sum summary statistics and its SE
##D CP.se(tpar = tpar, Y1=Y1 ,Y2= Y2, sn1 = sn1, sn2 = sn2, XM = XM, RE = RE, V = V, qfun = "sum")
##D 
##D ## the estimate of the conditional probability based on the max summary statistics and its SE
##D CP.se(tpar = tpar, Y1=Y1 ,Y2= Y2, sn1 = sn1, sn2 = sn2, XM = XM, RE = RE, V = V, qfun = "max")
##D 
##D ## jCP calls for CP.se to compute the estimate of the conditional probability
##D jCP(tpar = tpar, Y1 = Y1, Y2 = Y2, sn1 = sn1, sn2 = sn2, 
##D     XM = XM, RE = RE, LG = FALSE, oth = NULL, qfun = "sum")
## End(Not run)



