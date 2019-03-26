library(qgam)


### Name: cqcheck
### Title: Visually checking a fitted quantile model
### Aliases: cqcheck

### ** Examples

#######
# Bivariate additive model y~1+x+x^2+z+x*z/2+e, e~N(0, 1)
#######
## Not run: 
##D library(qgam)
##D set.seed(15560)
##D n <- 500
##D x <- rnorm(n, 0, 1); z <- rnorm(n)
##D X <- cbind(1, x, x^2, z, x*z)
##D beta <- c(0, 1, 1, 1, 0.5)
##D y <- drop(X %*% beta) + rnorm(n) 
##D dataf <- data.frame(cbind(y, x, z))
##D names(dataf) <- c("y", "x", "z")
##D 
##D #### Fit a constant model for median
##D qu <- 0.5
##D fit <- qgam(y~1, qu = qu, data = dataf)
##D 
##D # Look at what happens along x: clearly there is non linear pattern here
##D cqcheck(obj = fit, v = c("x"), X = dataf, y = y) 
##D 
##D #### Add a smooth for x
##D fit <- qgam(y~s(x), qu = qu, err = 0.05, data = dataf)
##D cqcheck(obj = fit, v = c("x"), X = dataf, y = y) # Better!
##D 
##D # Lets look across x and z. As we move along z (x2 in the plot) 
##D # the colour changes from green to red
##D cqcheck(obj = fit, v = c("x", "z"), X = dataf, y = y, nbin = c(5, 5))
##D 
##D # The effect look pretty linear
##D cqcheck(obj = fit, v = c("z"), X = dataf, y = y, nbin = c(10))
##D 
##D #### Lets add a linear effect for z 
##D fit <- qgam(y~s(x)+z, qu = qu, data = dataf)
##D 
##D # Looks better!
##D cqcheck(obj = fit, v = c("z"))
##D 
##D # Lets look across x and y again: green prevails on the top-left to bottom-right
##D # diagonal, while the other diagonal is mainly red.
##D cqcheck(obj = fit, v = c("x", "z"), nbin = c(5, 5))
##D 
##D ### Maybe adding an interaction would help?
##D fit <- qgam(y~s(x)+z+I(x*z), qu = qu, data = dataf)
##D 
##D # It does! The real model is: y ~ 1 + x + x^2 + z + x*z/2 + e, e ~ N(0, 1)
##D cqcheck(obj = fit, v = c("x", "z"), nbin = c(5, 5))
## End(Not run)




