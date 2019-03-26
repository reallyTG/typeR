library(np)


### Name: npindexbw
### Title: Semiparametric Single Index Model Parameter and Bandwidth
###   Selection
### Aliases: npindexbw npindexbw.NULL npindexbw.default npindexbw.formula
###   npindexbw.sibandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): Generate a simple linear model then
##D # compute coefficients and the bandwidth using Ichimura's nonlinear
##D # least squares approach.
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- x1 - x2 + rnorm(n)
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer. Note also that the first element of the vector beta is
##D # normalized to one for identification purposes, and that X must contain
##D # at least one continuous variable.
##D 
##D bw <- npindexbw(formula=y~x1+x2, method="ichimura")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): Generate a simple linear model then
##D # compute coefficients and the bandwidth using Ichimura's nonlinear
##D # least squares approach.
##D 
##D set.seed(12345)
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- x1 - x2 + rnorm(n)
##D 
##D X <- cbind(x1, x2)
##D 
##D # Note - this may take a minute or two depending on the speed of your
##D # computer. Note also that the first element of the vector beta is
##D # normalized to one for identification purposes, and that X must contain
##D # at least one continuous variable.
##D 
##D bw <- npindexbw(xdat=X, ydat=y, method="ichimura")
##D 
##D summary(bw)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): Generate a simple binary outcome
##D # model then compute coefficients and the bandwidth using Klein and
##D # Spady's likelihood-based approach.
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D # Note that the first element of the vector beta is normalized to one
##D # for identification purposes, and that X must contain at least one
##D # continuous variable.
##D 
##D bw <- npindexbw(formula=y~x1+x2, method="kleinspady")
##D 
##D summary(bw)
##D 
##D # EXAMPLE 2 (INTERFACE=DATA FRAME): Generate a simple binary outcome
##D # model then compute coefficients and the bandwidth using Klein and
##D # Spady's likelihood-based approach.
##D 
##D n <- 100
##D 
##D x1 <- runif(n, min=-1, max=1)
##D x2 <- runif(n, min=-1, max=1)
##D 
##D y <- ifelse(x1 + x2 + rnorm(n) > 0, 1, 0)
##D 
##D X <- cbind(x1, x2)
##D 
##D # Note that the first element of the vector beta is normalized to one
##D # for identification purposes, and that X must contain at least one
##D # continuous variable.
##D 
##D bw <- npindexbw(xdat=X, ydat=y, method="kleinspady")
##D 
##D summary(bw)
## End(Not run) 



