library(np)


### Name: npplreg
### Title: Partially Linear Kernel Regression with Mixed Data Types
### Aliases: npplreg npplreg.call npplreg.formula npplreg.plbandwidth
### Keywords: nonparametric

### ** Examples

## Not run: 
##D # EXAMPLE 1 (INTERFACE=FORMULA): For this example, we simulate an
##D # example for a partially linear model and compare the coefficient
##D # estimates from the partially linear model with those from a correctly
##D # specified parametric model...
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
##D # First, compute data-driven bandwidths. This may take a few minutes
##D # depending on the speed of your computer...
##D 
##D bw <- npplregbw(formula=y~x1+factor(x2)|factor(z1)+z2)
##D 
##D # Next, compute the partially linear fit
##D 
##D pl <- npplreg(bws=bw)
##D 
##D # Print a summary of the model...
##D 
##D summary(pl)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Retrieve the coefficient estimates and their standard errors...
##D 
##D coef(pl)
##D coef(pl, errors = TRUE)
##D 
##D # Compare the partially linear results to those from a correctly
##D # specified model's coefficients for x1 and x2
##D 
##D ols <- lm(y~x1+factor(x2)+factor(z1)+I(sin(z2)))
##D 
##D # The intercept is coef()[1], and those for x1 and x2 are coef()[2] and
##D # coef()[3]. The standard errors are the square root of the diagonal of
##D # the variance-covariance matrix (elements 2 and 3)
##D 
##D coef(ols)[2:3]
##D sqrt(diag(vcov(ols)))[2:3]
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Plot the regression surfaces via plot() (i.e., plot the `partial
##D # regression surface plots').
##D 
##D plot(bw)
##D 
##D # Note - to plot regression surfaces with variability bounds constructed
##D # from bootstrapped standard errors, use the following (note that this
##D # may take a minute or two depending on the speed of your computer as
##D # the bootstrapping is done in real time, and note also that we override
##D # the default number of bootstrap replications (399) reducing them to 25
##D # in order to quickly compute standard errors in this instance - don't
##D # of course do this in general)
##D 
##D plot(bw,
##D      plot.errors.boot.num=25, 
##D      plot.errors.method="bootstrap")
##D 
##D 
##D # EXAMPLE 1 (INTERFACE=DATA FRAME): For this example, we simulate an
##D # example for a partially linear model and compare the coefficient
##D # estimates from the partially linear model with those from a correctly
##D # specified parametric model...
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
##D # First, compute data-driven bandwidths. This may take a few minutes
##D # depending on the speed of your computer...
##D 
##D bw <- npplregbw(xdat=X, zdat=Z, ydat=y)
##D 
##D # Next, compute the partially linear fit
##D 
##D pl <- npplreg(bws=bw)
##D 
##D # Print a summary of the model...
##D 
##D summary(pl)
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Retrieve the coefficient estimates and their standard errors...
##D 
##D coef(pl)
##D coef(pl, errors = TRUE)
##D 
##D # Compare the partially linear results to those from a correctly
##D # specified model's coefficients for x1 and x2
##D 
##D ols <- lm(y~x1+factor(x2)+factor(z1)+I(sin(z2)))
##D 
##D # The intercept is coef()[1], and those for x1 and x2 are coef()[2] and
##D # coef()[3]. The standard errors are the square root of the diagonal of
##D # the variance-covariance matrix (elements 2 and 3)
##D 
##D coef(ols)[2:3]
##D sqrt(diag(vcov(ols)))[2:3]
##D 
##D # Sleep for 5 seconds so that we can examine the output...
##D 
##D Sys.sleep(5)
##D 
##D # Plot the regression surfaces via plot() (i.e., plot the `partial
##D # regression surface plots').
##D 
##D plot(bw)
##D 
##D # Note - to plot regression surfaces with variability bounds constructed
##D # from bootstrapped standard errors, use the following (note that this
##D # may take a minute or two depending on the speed of your computer as
##D # the bootstrapping is done in real time, and note also that we override
##D # the default number of bootstrap replications (399) reducing them to 25
##D # in order to quickly compute standard errors in this instance - don't
##D # of course do this in general)
##D 
##D plot(bw,
##D      plot.errors.boot.num=25, 
##D      plot.errors.method="bootstrap")
## End(Not run) 



