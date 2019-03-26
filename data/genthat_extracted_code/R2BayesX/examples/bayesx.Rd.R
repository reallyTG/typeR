library(R2BayesX)


### Name: bayesx
### Title: Estimate STAR Models with BayesX
### Aliases: bayesx
### Keywords: regression

### ** Examples

## generate some data
set.seed(111)
n <- 200

## regressor
dat <- data.frame(x = runif(n, -3, 3))

## response
dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))

## estimate models with
## bayesx REML and MCMC
b1 <- bayesx(y ~ sx(x), method = "REML", data = dat)

## same using mgcv syntax
b1 <- bayesx(y ~ s(x, bs = "ps", k = 20), method = "REML", data = dat)

## now with MCMC
b2 <- bayesx(y ~ sx(x), method = "MCMC", 
  iter = 1200, burnin = 200, data = dat)

## compare reported output
summary(c(b1, b2))

## plot the effect for both models
plot(c(b1, b2), residuals = TRUE)

## use confint
confint(b1, level = 0.99)
confint(b2, level = 0.99)

## Not run: 
##D ## more examples
##D set.seed(111)
##D n <- 500
##D 
##D ## regressors
##D dat <- data.frame(x = runif(n, -3, 3), z = runif(n, -3, 3),
##D   w = runif(n, 0, 6), fac = factor(rep(1:10, n/10)))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + cos(z) * sin(w) +
##D   c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac] + rnorm(n, sd = 0.6))
##D 
##D ## estimate models with
##D ## bayesx MCMC and REML
##D ## and compare with
##D ## mgcv gam()
##D b1 <- bayesx(y ~ sx(x) + sx(z, w, bs = "te") + fac,
##D   data = dat, method = "MCMC")
##D b2 <- bayesx(y ~ sx(x) + sx(z, w, bs = "te") + fac,
##D   data = dat, method = "REML")
##D b3 <- gam(y ~ s(x, bs = "ps") + te(z, w, bs = "ps") + fac, 
##D   data = dat)
##D 
##D ## summary statistics
##D summary(b1)
##D summary(b2)
##D summary(b3)
##D 
##D ## plot the effects
##D op <- par(no.readonly = TRUE)
##D par(mfrow = c(3, 2))
##D plot(b1, term = "sx(x)")
##D plot(b1, term = "sx(z,w)")
##D plot(b2, term = "sx(x)")
##D plot(b2, term = "sx(z,w)")
##D plot(b3, select = 1)
##D vis.gam(b3, c("z","w"), theta = 40, phi = 40)
##D par(op)
##D 
##D ## combine models b1 and b2
##D b <- c(b1, b2)
##D 
##D ## summary
##D summary(b)
##D 
##D ## only plot effect 2 of both models
##D plot(b, term = "sx(z,w)") 
##D 
##D ## with residuals
##D plot(b, term = "sx(z,w)", residuals = TRUE) 
##D 
##D ## same model with kriging
##D b <- bayesx(y ~ sx(x) + sx(z, w, bs = "kr") + fac, 
##D   method = "REML", data = dat)
##D plot(b)
##D 
##D 
##D ## now a mrf example
##D ## note: the regional identification
##D ## covariate and the map regionnames
##D ## should be coded as integer
##D set.seed(333)
##D      
##D ## simulate some geographical data
##D data("MunichBnd")
##D N <- length(MunichBnd); n <- N*5
##D      
##D ## regressors
##D dat <- data.frame(x1 = runif(n, -3, 3),
##D   id = as.factor(rep(names(MunichBnd), length.out = n)))
##D dat$sp <- with(dat, sort(runif(N, -2, 2), decreasing = TRUE)[id])
##D      
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x1) + sp + rnorm(n, sd = 1.2))
##D 
##D ## estimate models with
##D ## bayesx MCMC and REML
##D b1 <- bayesx(y ~ sx(x1) + sx(id, bs = "mrf", map = MunichBnd), 
##D   method = "MCMC", data = dat)
##D b2 <- bayesx(y ~ sx(x1) + sx(id, bs = "mrf", map = MunichBnd), 
##D   method = "REML", data = dat)
##D 
##D ## summary statistics
##D summary(b1)
##D summary(b2)
##D 
##D ## plot the spatial effects
##D plot(b1, term = "sx(id)", map = MunichBnd, 
##D   main = "bayesx() MCMC estimate")
##D plot(b2, term = "sx(id)", map = MunichBnd, 
##D   main = "bayesx() REML estimate")
##D plotmap(MunichBnd, x = dat$sp, id = dat$id, 
##D   main = "Truth")
##D 
##D ## try geosplines instead
##D b <- bayesx(y ~ sx(id, bs = "gs", map = MunichBnd) + sx(x1), data = dat)
##D summary(b)
##D plot(b, term = "sx(id)", map = MunichBnd)
##D 
##D ## geokriging
##D b <- bayesx(y ~ sx(id, bs = "gk", map = MunichBnd) + sx(x1), 
##D   method = "REML", data = dat)
##D summary(b)
##D plot(b, term = "sx(id)", map = MunichBnd)
##D 
##D ## perspective plot of the effect
##D plot(b, term = "sx(id)")
##D 
##D ## image and contour plot 
##D plot(b, term = "sx(id)", image = TRUE, 
##D   contour = TRUE, grid = 200)
##D 
##D 
##D ## model with random effects
##D set.seed(333)
##D N <- 30
##D n <- N*10
##D 
##D ## regressors
##D dat <- data.frame(id = sort(rep(1:N, n/N)), x1 = runif(n, -3, 3))
##D dat$re <- with(dat, rnorm(N, sd = 0.6)[id])
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x1) + re + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x1) + sx(id, bs = "re"), data = dat)
##D summary(b)
##D plot(b)
##D 
##D ## extract estimated random effects
##D ## and compare with true effects
##D plot(fitted(b, term = "sx(id)")$Mean ~ unique(dat$re))
##D 
##D 
##D ## now a spatial example
##D ## with structured and
##D ## unstructered spatial 
##D ## effect
##D set.seed(333)
##D 
##D ## simulate some geographical data
##D data("MunichBnd")
##D N <- length(MunichBnd); names(MunichBnd) <- 1:N
##D n <- N*5
##D 
##D ## regressors
##D dat <- data.frame(id = rep(1:N, n/N), x1 = runif(n, -3, 3))
##D dat$sp <- with(dat, sort(runif(N, -2, 2), decreasing = TRUE)[id])
##D dat$re <- with(dat, rnorm(N, sd = 0.6)[id])
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x1) + sp + re + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x1) + 
##D   sx(id, bs = "mrf", map = MunichBnd) +
##D   sx(id, bs = "re"), method = "MCMC", data = dat)
##D summary(b)
##D 
##D ## plot all spatial effects
##D plot(b, term = "sx(id):mrf", map = MunichBnd, 
##D   main = "Structured spatial effect")
##D plot(b, term = "sx(id):re", map = MunichBnd, 
##D   main = "Unstructured spatial effect")
##D plot(b, term = "sx(id):total", map = MunichBnd, 
##D   main = "Total spatial effect", digits = 4)
##D 
##D 
##D ## some experiments with the
##D ## stepwise algorithm
##D ## generate some data
##D set.seed(321)
##D n <- 1000
##D 
##D ## regressors
##D dat <- data.frame(x1 = runif(n, -3, 3), x2 = runif(n),
##D   x3 = runif(n, 3, 6), x4 = runif(n, 0, 1))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x1) + 0.6 * x2 + rnorm(n, sd = 0.6))
##D 
##D ## estimate model with STEP
##D b <- bayesx(y ~ sx(x1) + sx(x2) + sx(x3) + sx(x4), 
##D   method = "STEP", algorithm = "cdescent1", CI = "MCMCselect", 
##D   iter = 10000, step = 10, data = dat)
##D summary(b)
##D plot(b)
##D 
##D 
##D ## a probit example
##D set.seed(111)
##D n <- 1000
##D dat <- data.frame(x <- runif(n, -3, 3))
##D 
##D dat$z <- with(dat, sin(x) + rnorm(n))
##D dat$y <- rep(0, n)
##D dat$y[dat$z > 0] <- 1
##D 
##D b <- bayesx(y ~ sx(x), family = "binomialprobit", data = dat)
##D summary(b)
##D plot(b)
##D 
##D 
##D ## estimate varying coefficient models
##D set.seed(333)
##D n <- 1000
##D dat <- data.frame(x = runif(n, -3, 3), id = factor(rep(1:4, n/4)))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) * c(-1, 0.2, 1, 5)[id] + rnorm(n, sd = 0.6))
##D 
##D ## estimate model
##D b <- bayesx(y ~ sx(x, by = id, center = TRUE),
##D   method = "REML", data = dat)
##D summary(b)
##D plot(b, resid = TRUE, cex.resid = 0.1)
## End(Not run)



