library(bamlss)


### Name: c95
### Title: Compute 95% Credible Interval and Mean
### Aliases: c95
### Keywords: regression

### ** Examples

x <- rnorm(100)
c95(x)

## Not run: 
##D ## Example computing predictions.
##D set.seed(123)
##D d <- data.frame("x" = seq(-3, 3, length = 30))
##D d$y <- sin(d$x) + rnorm(30, sd = 0.3)
##D 
##D ## Estimate model and compute predictions.
##D ## with c95().
##D b <- bamlss(y ~ s(x), data = d)
##D p <- predict(b, model = "mu", FUN = c95)
##D plot(d)
##D matplot(d$x, p, type = "l", lty = c(2, 1, 2),
##D   col = "black", add = TRUE)
##D 
##D ## Example extracting coefficients.
##D coef(b, FUN = c95)
## End(Not run)



