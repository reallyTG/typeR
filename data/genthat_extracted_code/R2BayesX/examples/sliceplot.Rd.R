library(R2BayesX)


### Name: sliceplot
### Title: Plot Slices of Bivariate Functions
### Aliases: sliceplot
### Keywords: hplot

### ** Examples

## generate some data
set.seed(111)
n <- 500

## regressors
dat <- data.frame(z = runif(n, -3, 3), w = runif(n, 0, 6))

## response
dat$y <- with(dat, 1.5 + cos(z) * sin(w) + rnorm(n, sd = 0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ sx(z, w, bs = "te", knots = 5), data = dat, method = "REML")
##D summary(b)
##D 
##D ## plot estimated effect
##D plot(b, term = "sx(z,w)", sliceplot = TRUE)
##D plot(b, term = "sx(z,w)", sliceplot = TRUE, view = 2)
##D plot(b, term = "sx(z,w)", sliceplot = TRUE, view = "w")
##D plot(b, term = "sx(z,w)", sliceplot = TRUE, c.select = 4)
##D plot(b, term = "sx(z,w)", sliceplot = TRUE, c.select = 6)
##D plot(b, term = "sx(z,w)", sliceplot = TRUE, probs = seq(0, 1, length = 10))
## End(Not run)

## another variation
dat$f1 <- with(dat, sin(z) * cos(w))
sliceplot(cbind(z = dat$z, w = dat$w, f1 = dat$f1))

## same with formula 
sliceplot(sin(z) * cos(w) ~ z + w, ylab = "f(z)", data = dat)

## compare with plot3d()
plot3d(sin(z) * 1.5 * w ~ z + w, zlab = "f(z,w)", data = dat)
sliceplot(sin(z) * 1.5 * w ~ z + w, ylab = "f(z)", data = dat)
sliceplot(sin(z) * 1.5 * w ~ z + w, view = 2, ylab = "f(z)", data = dat)



