library(locits)


### Name: EstBetaCov
### Title: Compute estimate of wavelet periodogram and the estimate's
###   covariance matrix.
### Aliases: EstBetaCov
### Keywords: ts

### ** Examples

#
# Small example, not too computationally demanding on white noise
#
myb <- EstBetaCov(rnorm(64), nz=32)
#
# Let's see the results (of my run)
#
## Not run: myb$betahat
#[1] 0.8323344 0.7926963 0.7272328 1.3459313 2.1873395 0.8364632
#
# For white noise, these values should be 1 (they're estimates)
## Not run: myb$Sigma
#            [,1]        [,2]        [,3]       [,4]        [,5]        [,6]
#[1,] 0.039355673 0.022886994 0.008980497 0.01146325 0.003211176 0.001064377
#[2,] 0.022886994 0.054363333 0.035228164 0.06519112 0.017146883 0.006079162
#[3,] 0.008980497 0.035228164 0.161340373 0.38326812 0.111068916 0.040068318
#[4,] 0.011463247 0.065191118 0.383268115 1.31229598 0.632725858 0.228574601
#[5,] 0.003211176 0.017146883 0.111068916 0.63272586 1.587765187 0.919247252
#[6,] 0.001064377 0.006079162 0.040068318 0.22857460 0.919247252 2.767615374
#
# Here's an example for T (length of series) bigger, T=1024
#
## Not run: myb <- EstBetaCov(rnorm(1024), nz=512)
#
# Let's look at results
#
## Not run: myb$betahat
# [1] 1.0276157 1.0626069 0.9138419 1.1275545 1.4161028 0.9147333 1.1935089
# [8] 0.6598547 1.1355896 2.3374615
#
# These values (especially for finer scales) are closer to 1
#



