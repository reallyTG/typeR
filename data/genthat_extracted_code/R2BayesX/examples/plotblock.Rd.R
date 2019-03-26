library(R2BayesX)


### Name: plotblock
### Title: Factor Variable and Random Effects Plots
### Aliases: plotblock
### Keywords: hplot

### ** Examples

## generate some data
set.seed(111)
n <- 500

## regressors
dat <- data.frame(fac = factor(rep(1:10, n/10)))

## response
dat$y <- with(dat, 1.5 + c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac] + 
  rnorm(n, sd = 0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ fac, data = dat)
##D summary(b)
##D 
##D ## plot factor term effects
##D plot(b, term = "fac")
##D 
##D ## extract fitted effects
##D f <- fitted(b, term = "fac")
##D 
##D ## now use plotblock
##D plotblock(f)
##D 
##D ## some variations
##D plotblock(f, col.poly = c(2, 3))
##D plotblock(f, col.poly = NA, lwd = c(2, 1, 1, 1, 1))
##D plotblock(f, col.poly = NA, lwd = 3, range = c(0.5,0.5))
##D plotblock(f, col.poly = NA, lwd = 3, col.lines = 1:5, lty = 1)
##D plotblock(f, col.poly = NA, lwd = 3, col.lines = 1:5, 
##D   lty = c(3, 1, 2, 2, 1))
##D plotblock(f, resid = TRUE)
##D plotblock(f, resid = TRUE, cex = 0.1)
##D plotblock(f, resid = TRUE, cex = 0.1, col.resid = 2)
##D plotblock(f, resid = TRUE, cex = 2, col.resid = 3, pch = 3)
##D plotblock(f, lty = 0, poly.lty = 1, density = c(5, 20))
##D plotblock(f, lty = 0, poly.lty = 1, density = c(5, 20), 
##D   poly.lwd = c(1, 2))
##D plotblock(f, lty = 0, poly.lty = c(1, 2), density = c(5, 20))
##D plotblock(f, lty = 0, poly.lty = c(1, 2), density = c(5, 20), 
##D   border = c("red", "green3"))
##D plotblock(f, lty = 0, poly.lty = c(1, 2), density = c(5, 20), 
##D   border = c("red", "green3"), col.poly = c("blue", "yellow"))
##D plotblock(f, lty = c(1,0,0,0,0), poly.lty = c(1, 2), 
##D   density = c(5, 20), border = c("red", "green3"), 
##D   col.poly = c("blue", "yellow"))
##D plotblock(f, lty = c(1,0,0,0,0), poly.lty = c(1, 2), 
##D   density = c(20, 20), border = c("red", "green3"), 
##D   col.poly = c("blue", "yellow"), angle = c(10, 75))
## End(Not run)

## another example
plotblock(y ~ fac, data = dat, range = c(0.45, 0.45))

dat <- data.frame(fac = factor(rep(1:10, n/10)))
dat$y <- with(dat, c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac])
plotblock(y ~ fac, data = dat)
plotblock(cbind(y - 0.1, y + 0.1) ~ fac, data = dat)
plotblock(cbind(y - 0.1, y + 0.1) ~ fac, data = dat, 
  fill.select = c(0, 1, 1))
plotblock(cbind(y - 0.1, y + 0.1) ~ fac, data = dat, 
  fill.select = c(0, 1, 1), poly.lty = 2, lty = 1, 
  border = "grey5")



