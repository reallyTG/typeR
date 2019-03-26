library(qgam)


### Name: cqcheckI
### Title: Interactive visual checks for additive quantile fits
### Aliases: cqcheckI

### ** Examples

## Not run: 
##D  
##D #######
##D # Example 1: Bivariate additive model y~1+x+x^2+z+x*z/2+e, e~N(0, 1)
##D #######
##D library(qgam)
##D set.seed(15560)
##D n <- 1000
##D x <- rnorm(n, 0, 1); z <- rnorm(n)
##D X <- cbind(1, x, x^2, z, x*z)
##D beta <- c(0, 1, 1, 1, 0.5)
##D y <- drop(X %*% beta) + rnorm(n) 
##D dataf <- data.frame(cbind(y, x, z))
##D names(dataf) <- c("y", "x", "z")
##D 
##D #### Fit a constant model for median
##D qu <- 0.5
##D fit <- qgam(y~1, qu = qu, err = 0.05, data = dataf)
##D 
##D # Look at what happens along x: clearly there is non linear pattern here
##D cqcheckI(obj = fit, v = c("x"), X = dataf, y = y) 
##D 
##D #### Add a smooth for x
##D fit <- qgam(y~s(x), qu = qu, err = 0.05, data = dataf)
##D cqcheckI(obj = fit, v = c("x"), X = dataf, y = y) # Better!
##D 
##D # Lets look across across x and z. As we move along z (x2 in the plot) 
##D # the colour changes from green to red
##D cqcheckI(obj = fit, v = c("x", "z"), X = dataf, y = y)
##D 
##D # The effect look pretty linear
##D cqcheckI(obj = fit, v = c("z"), X = dataf, y = y)
##D 
##D #### Lets add a linear effect for z 
##D fit <- qgam(y~s(x)+z, qu = qu, err = 0.05, data = dataf)
##D 
##D # Looks better!
##D cqcheckI(obj = fit, v = c("z"))
##D 
##D # Lets look across x and y again: green prevails on the top-left to bottom-right
##D # diagonal, while the other diagonal is mainly red.
##D cqcheckI(obj = fit, v = c("x", "z"))
##D 
##D ### Maybe adding an interaction would help?
##D fit <- qgam(y~s(x)+z+I(x*z), qu = qu, err = 0.05, data = dataf)
##D 
##D # It does! The real model is: y ~ 1 + x + x^2 + z + x*z/2 + e, e ~ N(0, 1)
##D cqcheckI(obj = fit, v = c("x", "z"))
## End(Not run)




