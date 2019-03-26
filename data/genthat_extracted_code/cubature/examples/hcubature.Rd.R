library(cubature)


### Name: hcubature
### Title: Adaptive multivariate integration over hypercubes (hcubature and
###   pcubature)
### Aliases: hcubature adaptIntegrate pcubature pcubature
### Keywords: math

### ** Examples


## Not run: 
##D ## Test function 0
##D ## Compare with original cubature result of
##D ## ./cubature_test 2 1e-4 0 0
##D ## 2-dim integral, tolerance = 0.0001
##D ## integrand 0: integral = 0.708073, est err = 1.70943e-05, true err = 7.69005e-09
##D ## #evals = 17
##D 
##D testFn0 <- function(x) {
##D   prod(cos(x))
##D }
##D 
##D hcubature(testFn0, rep(0,2), rep(1,2), tol=1e-4)
##D 
##D pcubature(testFn0, rep(0,2), rep(1,2), tol=1e-4)
##D 
##D M_2_SQRTPI <- 2/sqrt(pi)
##D 
##D ## Test function 1
##D ## Compare with original cubature result of
##D ## ./cubature_test 3 1e-4 1 0
##D ## 3-dim integral, tolerance = 0.0001
##D ## integrand 1: integral = 1.00001, est err = 9.67798e-05, true err = 9.76919e-06
##D ## #evals = 5115
##D 
##D testFn1 <- function(x) {
##D   val <- sum (((1-x) / x)^2)
##D   scale <- prod(M_2_SQRTPI/x^2)
##D   exp(-val) * scale
##D }
##D 
##D hcubature(testFn1, rep(0, 3), rep(1, 3), tol=1e-4)
##D pcubature(testFn1, rep(0, 3), rep(1, 3), tol=1e-4)
##D 
##D ##
##D ## Test function 2
##D ## Compare with original cubature result of
##D ## ./cubature_test 2 1e-4 2 0
##D ## 2-dim integral, tolerance = 0.0001
##D ## integrand 2: integral = 0.19728, est err = 1.97261e-05, true err = 4.58316e-05
##D ## #evals = 166141
##D 
##D testFn2 <- function(x) {
##D   ## discontinuous objective: volume of hypersphere
##D   radius <- as.double(0.50124145262344534123412)
##D   ifelse(sum(x*x) < radius*radius, 1, 0)
##D }
##D 
##D hcubature(testFn2, rep(0, 2), rep(1, 2), tol=1e-4)
##D pcubature(testFn2, rep(0, 2), rep(1, 2), tol=1e-4)
##D 
##D ##
##D ## Test function 3
##D ## Compare with original cubature result of
##D ## ./cubature_test 3 1e-4 3 0
##D ## 3-dim integral, tolerance = 0.0001
##D ## integrand 3: integral = 1, est err = 0, true err = 2.22045e-16
##D ## #evals = 33
##D 
##D testFn3 <- function(x) {
##D   prod(2*x)
##D }
##D 
##D hcubature(testFn3, rep(0,3), rep(1,3), tol=1e-4)
##D pcubature(testFn3, rep(0,3), rep(1,3), tol=1e-4)
##D 
##D ##
##D ## Test function 4 (Gaussian centered at 1/2)
##D ## Compare with original cubature result of
##D ## ./cubature_test 2 1e-4 4 0
##D ## 2-dim integral, tolerance = 0.0001
##D ## integrand 4: integral = 1, est err = 9.84399e-05, true err = 2.78894e-06
##D ## #evals = 1853
##D 
##D testFn4 <- function(x) {
##D   a <- 0.1
##D   s <- sum((x - 0.5)^2)
##D   (M_2_SQRTPI / (2. * a))^length(x) * exp (-s / (a * a))
##D }
##D 
##D hcubature(testFn4, rep(0,2), rep(1,2), tol=1e-4)
##D pcubature(testFn4, rep(0,2), rep(1,2), tol=1e-4)
##D 
##D ##
##D ## Test function 5 (double Gaussian)
##D ## Compare with original cubature result of
##D ## ./cubature_test 3 1e-4 5 0
##D ## 3-dim integral, tolerance = 0.0001
##D ## integrand 5: integral = 0.999994, est err = 9.98015e-05, true err = 6.33407e-06
##D ## #evals = 59631
##D 
##D testFn5 <- function(x) {
##D   a <- 0.1
##D   s1 <- sum((x - 1/3)^2)
##D   s2 <- sum((x - 2/3)^2)
##D   0.5 * (M_2_SQRTPI / (2. * a))^length(x) * (exp(-s1 / (a * a)) + exp(-s2 / (a * a)))
##D }
##D 
##D hcubature(testFn5, rep(0,3), rep(1,3), tol=1e-4)
##D pcubature(testFn5, rep(0,3), rep(1,3), tol=1e-4)
##D 
##D ##
##D ## Test function 6 (Tsuda's example)
##D ## Compare with original cubature result of
##D ## ./cubature_test 4 1e-4 6 0
##D ## 4-dim integral, tolerance = 0.0001
##D ## integrand 6: integral = 0.999998, est err = 9.99685e-05, true err = 1.5717e-06
##D ## #evals = 18753
##D 
##D testFn6 <- function(x) {
##D   a <- (1 + sqrt(10.0)) / 9.0
##D   prod(a / (a + 1) * ((a + 1) / (a + x))^2)
##D }
##D 
##D hcubature(testFn6, rep(0,4), rep(1,4), tol=1e-4)
##D pcubature(testFn6, rep(0,4), rep(1,4), tol=1e-4)
##D 
##D 
##D ##
##D ## Test function 7
##D ##   test integrand from W. J. Morokoff and R. E. Caflisch, "Quasi=
##D ##   Monte Carlo integration," J. Comput. Phys 122, 218-230 (1995).
##D ##   Designed for integration on [0,1]^dim, integral = 1. */
##D ## Compare with original cubature result of
##D ## ./cubature_test 3 1e-4 7 0
##D ## 3-dim integral, tolerance = 0.0001
##D ## integrand 7: integral = 1.00001, est err = 9.96657e-05, true err = 1.15994e-05
##D ## #evals = 7887
##D 
##D testFn7 <- function(x) {
##D   n <- length(x)
##D   p <- 1/n
##D   (1 + p)^n * prod(x^p)
##D }
##D 
##D hcubature(testFn7, rep(0,3), rep(1,3), tol=1e-4)
##D pcubature(testFn7, rep(0,3), rep(1,3), tol=1e-4)
##D 
##D 
##D ## Example from web page
##D ## http://ab-initio.mit.edu/wiki/index.php/Cubature
##D ##
##D ## f(x) = exp(-0.5(euclidean_norm(x)^2)) over the three-dimensional
##D ## hyperbcube [-2, 2]^3
##D ## Compare with original cubature result
##D testFnWeb <-  function(x) {
##D   exp(-0.5 * sum(x^2))
##D }
##D 
##D hcubature(testFnWeb, rep(-2,3), rep(2,3), tol=1e-4)
##D pcubature(testFnWeb, rep(-2,3), rep(2,3), tol=1e-4)
##D 
##D ## Test function I.1d from
##D ## Numerical integration using Wang-Landau sampling
##D ## Y. W. Li, T. Wust, D. P. Landau, H. Q. Lin
##D ## Computer Physics Communications, 2007, 524-529
##D ## Compare with exact answer: 1.63564436296
##D ##
##D I.1d <- function(x) {
##D   sin(4*x) *
##D     x * ((x * ( x * (x*x-4) + 1) - 1))
##D }
##D 
##D hcubature(I.1d, -2, 2, tol=1e-7)
##D pcubature(I.1d, -2, 2, tol=1e-7)
##D 
##D ## Test function I.2d from
##D ## Numerical integration using Wang-Landau sampling
##D ## Y. W. Li, T. Wust, D. P. Landau, H. Q. Lin
##D ## Computer Physics Communications, 2007, 524-529
##D ## Compare with exact answer: -0.01797992646
##D ##
##D ##
##D I.2d <- function(x) {
##D   x1 = x[1]
##D   x2 = x[2]
##D   sin(4*x1+1) * cos(4*x2) * x1 * (x1*(x1*x1)^2 - x2*(x2*x2 - x1) +2)
##D }
##D 
##D hcubature(I.2d, rep(-1, 2), rep(1, 2), maxEval=10000)
##D pcubature(I.2d, rep(-1, 2), rep(1, 2), maxEval=10000)
##D 
##D ##
##D ## Example of multivariate normal integration borrowed from
##D ## package mvtnorm (on CRAN) to check ... argument
##D ## Compare with output of
##D ## pmvnorm(lower=rep(-0.5, m), upper=c(1,4,2), mean=rep(0, m), corr=sigma, alg=Miwa())
##D ##     0.3341125.  Blazing quick as well!  Ours is, not unexpectedly, much slower.
##D ##
##D dmvnorm <- function (x, mean, sigma, log = FALSE) {
##D     if (is.vector(x)) {
##D         x <- matrix(x, ncol = length(x))
##D     }
##D     if (missing(mean)) {
##D         mean <- rep(0, length = ncol(x))
##D     }
##D     if (missing(sigma)) {
##D         sigma <- diag(ncol(x))
##D     }
##D     if (NCOL(x) != NCOL(sigma)) {
##D         stop("x and sigma have non-conforming size")
##D     }
##D     if (!isSymmetric(sigma, tol = sqrt(.Machine$double.eps),
##D         check.attributes = FALSE)) {
##D         stop("sigma must be a symmetric matrix")
##D     }
##D     if (length(mean) != NROW(sigma)) {
##D         stop("mean and sigma have non-conforming size")
##D     }
##D     distval <- mahalanobis(x, center = mean, cov = sigma)
##D     logdet <- sum(log(eigen(sigma, symmetric = TRUE, only.values = TRUE)$values))
##D     logretval <- -(ncol(x) * log(2 * pi) + logdet + distval)/2
##D     if (log)
##D         return(logretval)
##D     exp(logretval)
##D }
##D 
##D m <- 3
##D sigma <- diag(3)
##D sigma[2,1] <- sigma[1, 2] <- 3/5 ; sigma[3,1] <- sigma[1, 3] <- 1/3
##D sigma[3,2] <- sigma[2, 3] <- 11/15
##D hcubature(dmvnorm, lower=rep(-0.5, m), upper=c(1,4,2),
##D                         mean=rep(0, m), sigma=sigma, log=FALSE,
##D                maxEval=10000)
##D pcubature(dmvnorm, lower=rep(-0.5, m), upper=c(1,4,2),
##D                         mean=rep(0, m), sigma=sigma, log=FALSE,
##D                maxEval=10000)
## End(Not run)




