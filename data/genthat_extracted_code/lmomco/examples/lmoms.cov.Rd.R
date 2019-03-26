library(lmomco)


### Name: lmoms.cov
### Title: Distribution-Free Variance-Covariance Structure of Sample
###   L-moments
### Aliases: lmoms.cov
### Keywords: L-moment (sample) PWM (sample) L-moment (variance-covariance)
###   variance-covariance

### ** Examples

## Not run: 
##D nsim <- 1000; n <- 10 # Let us compute variance of lambda_3
##D VL3sample <- mean(replicate(nsim, { zz <- lmoms.cov(rexp(n),nmom=3); zz[3,3] }))
##D falling.factorial <- function(a, b) gamma(b+1)*choose(a,b)
##D VL3exact  <- ((4*n^2 - 3*n - 2)/30)/falling.factorial (10, 3) # Exact variance is from
##D print(c(VL3sample, VL3exact)) # Elamir and Seheult (2004, table 1, line 8)
##D #[1] 0.01755058 0.01703704  # the values obviously are consistent
## End(Not run)
## Not run: 
##D # Data considered by Elamir and Seheult (2004, p. 348)
##D library(MASS); data(michelson); Light <- michelson$Speed
##D lmoms(Light, nmom=4)$lambdas # 852.4, 44.3, 0.83, 6.5 # matches those authors
##D lmoms.cov(Light) # [1, ] ==> 62.4267, 0.7116, 2.5912, -3.9847 # again matches
##D # The authors report standard error of L-kurtosis as 0.03695, which matches
##D lmoms.cov(Light, se="lmrse")[4] # 0.03695004 
## End(Not run)
## Not run: 
##D D <- rnorm(100) # Check results of Lmoments package.
##D lmoms.cov(D, rmax=5)[,5]
##D #        lam1         lam2         lam3         lam4         lam5
##D #3.662721e-04 3.118812e-05 5.769509e-05 6.574662e-05 1.603578e-04
##D Lmoments::Lmomcov(D, rmax=5)[,5]
##D #          L1           L2           L3           L4           L5
##D #3.662721e-04 3.118812e-05 5.769509e-05 6.574662e-05 1.603578e-04
## End(Not run)



