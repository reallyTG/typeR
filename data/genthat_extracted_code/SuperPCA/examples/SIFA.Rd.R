library(SuperPCA)


### Name: SIFA
### Title: Supervised Integrated Factor Analysis
### Aliases: SIFA

### ** Examples

## Not run: 
##D r0 <- 2
##D r <- c(3,3)
##D V <- matrix(stats::rnorm(10*2),10,2)
##D Fmatrix <- matrix(MASS::mvrnorm(n=2*500,rep(0,2),matrix(c(9,0,0,4),2,2)),500,2)
##D E <- matrix(stats::rnorm(500*10,0,3),500,10)
##D X <- tcrossprod(Fmatrix,V)+E
##D X <-scale(X,center=TRUE,scale=FALSE)
##D Y1 <- matrix(stats::rnorm(500*200,0,1),500,200)
##D Y2 <- matrix(stats::rnorm(500*200,0,1),500,200)
##D Y <- list(Y1,Y2)
##D SIFA(X,Y,r0,r,max_niter=200)
## End(Not run)



