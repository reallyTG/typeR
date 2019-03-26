library(bamlss)


### Name: plot2d
### Title: Plot 2D Effects
### Aliases: plot2d plotnonp
### Keywords: hplot

### ** Examples

## Generate some data.
set.seed(111)
n <- 500
## Regressor.
d <- data.frame(x = runif(n, -3, 3))

## Response. 
d$y <- with(d, 10 + sin(x) + rnorm(n, sd = 0.6))

## Not run: 
##D ## Estimate model.
##D b <- bamlss(y ~ s(x), data = d)
##D summary(b)
##D 
##D ## Plot estimated effect.
##D plot(b)
##D plot(b, rug = FALSE)
##D 
##D ## Extract fitted values.
##D f <- fitted(b, model = "mu", term = "s(x)")
##D f <- cbind(d["x"], f)
##D 
##D ## Now use plot2d.
##D plot2d(f)
##D plot2d(f, fill.select = c(0, 1, 0, 1))
##D plot2d(f, fill.select = c(0, 1, 0, 1), lty = c(2, 1, 2))
##D plot2d(f, fill.select = c(0, 1, 0, 1), lty = c(2, 1, 2),
##D   scheme = 2)
##D 
##D ## Variations.
##D plot2d(sin(x) ~ x, data = d)
##D d$f <- with(d, sin(d$x))
##D plot2d(f ~ x, data = d)
##D d$f1 <- with(d, f + 0.1)
##D d$f2 <- with(d, f - 0.1)
##D plot2d(f1 + f2 ~ x, data = d)
##D plot2d(f1 + f2 ~ x, data = d, fill.select = c(0, 1, 1), lty = 0)
##D plot2d(f1 + f2 ~ x, data = d, fill.select = c(0, 1, 1), lty = 0,
##D   density = 20, poly.lty = 1, poly.lwd = 2)
##D plot2d(f1 + f + f2 ~ x, data = d, fill.select = c(0, 1, 0, 1), 
##D   lty = c(0, 1, 0), density = 20, poly.lty = 1, poly.lwd = 2)
## End(Not run)


