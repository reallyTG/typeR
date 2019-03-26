library(mpoly)


### Name: bernsteinApprox
### Title: Bernstein polynomial approximation
### Aliases: bernsteinApprox

### ** Examples






## Not run: 
##D   # visualize the bernstein polynomials
##D 
##D library(ggplot2); theme_set(theme_bw())
##D library(reshape2)
##D 
##D 
##D 
##D 
##D f <- function(x) sin(2*pi*x)
##D p <- bernsteinApprox(f, 20) 
##D round(p, 3)
##D 
##D x <- seq(0, 1, length.out = 101)
##D df <- data.frame(
##D   x = rep(x, 2), 
##D   y = c(f(x), as.function(p)(x)), 
##D   which = rep(c("actual", "approx"), each = 101)
##D )
##D qplot(x, y, data = df, geom = "line", color = which)
##D 
##D 
##D 
##D 
##D 
##D 
##D p <- bernsteinApprox(sin, 20, pi/2, 1.5*pi) 
##D round(p, 4)
##D 
##D x <- seq(0, 2*pi, length.out = 101)
##D df <- data.frame(
##D   x = rep(x, 2), 
##D   y = c(sin(x), as.function(p)(x)), 
##D   which = rep(c("actual", "approx"), each = 101)
##D )
##D qplot(x, y, data = df, geom = "line", color = which)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D p <- bernsteinApprox(dnorm, 15, -1.25, 1.25) 
##D round(p, 4)
##D 
##D x <- seq(-3, 3, length.out = 101)
##D df <- data.frame(
##D   x = rep(x, 2), 
##D   y = c(dnorm(x), as.function(p)(x)), 
##D   which = rep(c("actual", "approx"), each = 101)
##D )
##D qplot(x, y, data = df, geom = "line", color = which)
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)




