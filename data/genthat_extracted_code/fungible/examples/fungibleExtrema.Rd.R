library(fungible)


### Name: fungibleExtrema
### Title: Locate Extrema of Fungible Regression Weights
### Aliases: fungibleExtrema
### Keywords: fungible

### ** Examples

## Not run: 
##D ## Example 
##D ## This is Koopmnan's Table 2 Example
##D 
##D 
##D R.X <- matrix(c(1.00,  .69,  .49,  .39,
##D                  .69, 1.00,  .38,  .19,
##D                  .49,  .38, 1.00,  .27,
##D                  .39,  .19,  .27, 1.00),4,4)
##D                  
##D                  
##D b <- c(.39, .22, .02, .43)
##D rxy <- R.X %*% b
##D 
##D OLSRSQ <- t(b) %*% R.X %*% b
##D 
##D ## theta <- .02
##D ## r.yhata.yhatb <- sqrt( 1 - (theta)/OLSRSQ)
##D 
##D r.yhata.yhatb  <- .90
##D set.seed(5)
##D output <- fungibleExtrema(R.X, rxy, r.yhata.yhatb, Nstarts = 500, 
##D                          MaxMin = "Min")
##D 
##D ## Scale to replicate Koopman
##D a <- output$a
##D a.old <- a
##D aRa <- t(a) %*% R.X %*% a
##D 
##D ## Scale a such that a' R a = .68659
##D ## vc = variance of composite
##D vc <- aRa
##D ## sf = scale factor
##D sf <- .68659/vc
##D a <- as.numeric(sqrt(sf)) * a
##D cat("\nKoopman Scaling\n")
##D print(round(a,2))
## End(Not run)



