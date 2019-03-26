library(R2BayesX)


### Name: plot2d
### Title: 2D Effect Plot
### Aliases: plot2d plotnonp
### Keywords: hplot

### ** Examples

## generate some data
set.seed(111)
n <- 500
## regressor
dat <- data.frame(x = runif(n,-3,3))

##  response 
dat$y <- with(dat, 10 + sin(x) + rnorm(n,sd=0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ sx(x), data = dat)
##D summary(b)
##D 
##D ## plot estimated effect
##D plot(b, which = 1)
##D plot(b, which = 1, rug = FALSE)
##D 
##D ## extract fitted effects
##D f <- fitted(b, term = "sx(x)")
##D 
##D ## now use plot2d
##D plot2d(f)
##D plot2d(f, residuals = TRUE)
##D plot2d(f, residuals = TRUE, pch = 2, col.resid = "green3")
##D plot2d(f, col.poly = NA, lwd = 1, lty = 1)
##D plot2d(f, col.poly = NA, lwd = 1, lty = 1, col.lines = 4)
##D plot2d(f, col.poly = c(2, 3), lwd = 1, col.lines = 4, lty = 1)
##D plot2d(f, lwd = c(1, 3, 2, 2, 3), col.poly = NA, lty = 1)
##D plot2d(f, lwd = c(1, 3, 2, 2, 3), col.poly = NA, lty = 1, col.lines = 2:6)
##D plot2d(f, lwd = c(1, 3, 2, 2, 3), col.poly = NA, lty = 1, col.lines = 2:6,
##D   resid = TRUE, pch = 4, col.resid = 7)
## End(Not run)

## another variation
plot2d(sin(x) ~ x, data = dat)
dat$f <- with(dat, sin(dat$x))
plot2d(f ~ x, data = dat)
dat$f1 <- with(dat, f + 0.1)
dat$f2 <- with(dat, f - 0.1)
plot2d(f1 + f2 ~ x, data = dat)
plot2d(f1 + f2 ~ x, data = dat, fill.select = c(0, 1, 1), lty = 0)
plot2d(f1 + f2 ~ x, data = dat, fill.select = c(0, 1, 1), lty = 0,
  density = 20, poly.lty = 1, poly.lwd = 2)
plot2d(f1 + f + f2 ~ x, data = dat, fill.select = c(0, 1, 0, 1), 
  lty = c(0, 1, 0), density = 20, poly.lty = 1, poly.lwd = 2)



