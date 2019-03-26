library(np)


### Name: npplregbw
### Title: Partially Linear Kernel Regression Bandwidth Selection with
###   Mixed Data Types
### Aliases: npplregbw npplregbw.NULL npplregbw.default npplregbw.formula
###   npplregbw.plbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we simulate an
##D # example for a partially linear model and perform bandwidth selection
##D 
##D set.seed(42)
##D 
##D n <- 250
##D x1 <- rnorm(n)
##D x2 <- rbinom(n, 1, .5)
##D 
##D z1 <- rbinom(n, 1, .5)
##D z2 <- rnorm(n)
##D 
##D y <- 1 + x1 + x2 + z1 + sin(z2) + rnorm(n)
##D 
##D X <- data.frame(x1, factor(x2))
##D Z <- data.frame(factor(z1), z2)
##D 
##D # Compute data-driven bandwidths... this may take a minute or two
##D # depending on the speed of your computer...
##D 
##D bw <- npplregbw(formula=y~x1+factor(x2)|factor(z1)+z2)
##D 
##D summary(bw)
##D 
##D # Note - the default is to use the local constant estimator. If you wish
##D # to use instead a local linear estimator, this is accomplished via
##D # npplregbw(xdat=X, zdat=Z, ydat=y, regtype="ll")
##D 
##D # Note - see the example for npudensbw() for multiple illustrations
##D # of how to change the kernel function, kernel order, and so forth.
##D 
##D # You may want to manually specify your bandwidths
##D bw.mat <- matrix(data =  c(0.19, 0.34,  # y on Z
##D                            0.00, 0.74,  # X[,1] on Z
##D                            0.29, 0.23), # X[,2] on Z
##D                 ncol = ncol(Z), byrow=TRUE)
##D 
##D bw <- npplregbw(formula=y~x1+factor(x2)|factor(z1)+z2, 
##D                           bws=bw.mat, bandwidth.compute=FALSE)
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # You may want to tweak some of the bandwidths
##D bw$bw[[1]] # y on Z, alternatively bw$bw$yzbw
##D bw$bw[[1]]$bw <- c(0.17, 0.30)
##D 
##D bw$bw[[2]] # X[,1] on Z
##D bw$bw[[2]]$bw[1] <- 0.00054
##D 
##D summary(bw)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we simulate an
##D # example for a partially linear model and perform bandwidth selection
##D 
##D set.seed(42)
##D 
##D n <- 250
##D x1 <- rnorm(n)
##D x2 <- rbinom(n, 1, .5)
##D 
##D z1 <- rbinom(n, 1, .5)
##D z2 <- rnorm(n)
##D 
##D y <- 1 + x1 + x2 + z1 + sin(z2) + rnorm(n)
##D 
##D X <- data.frame(x1, factor(x2))
##D Z <- data.frame(factor(z1), z2)
##D 
##D # Compute data-driven bandwidths... this may take a minute or two
##D # depending on the speed of your computer...
##D 
##D bw <- npplregbw(xdat=X, zdat=Z, ydat=y)
##D 
##D summary(bw)
##D 
##D # Note - the default is to use the local constant estimator. If you wish
##D # to use instead a local linear estimator, this is accomplished via
##D # npplregbw(xdat=X, zdat=Z, ydat=y, regtype="ll")
##D 
##D # Note - see the example for npudensbw() for multiple illustrations
##D # of how to change the kernel function, kernel order, and so forth.
##D 
##D # You may want to manually specify your bandwidths
##D bw.mat <- matrix(data =  c(0.19, 0.34,  # y on Z
##D                            0.00, 0.74,  # X[,1] on Z
##D                            0.29, 0.23), # X[,2] on Z
##D                 ncol = ncol(Z), byrow=TRUE)
##D 
##D bw <- npplregbw(xdat=X, zdat=Z, ydat=y, 
##D                           bws=bw.mat, bandwidth.compute=FALSE)
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # You may want to tweak some of the bandwidths
##D bw$bw[[1]] # y on Z, alternatively bw$bw$yzbw
##D bw$bw[[1]]$bw <- c(0.17, 0.30)
##D 
##D bw$bw[[2]] # X[,1] on Z
##D bw$bw[[2]]$bw[1] <- 0.00054
##D 
##D summary(bw)
## End(Not run) 



