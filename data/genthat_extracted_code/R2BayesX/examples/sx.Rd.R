library(R2BayesX)


### Name: sx
### Title: Construct BayesX Model Terms in A Formula
### Aliases: sx
### Keywords: regression

### ** Examples

## funktion sx() returns a list
## which is then processed by function
## bayesx.construct to build the
## BayesX model term structure
sx(x)

bayesx.construct(sx(x))
bayesx.construct(sx(x, bs = "rw1"))
bayesx.construct(sx(x, bs = "factor"))
bayesx.construct(sx(x, bs = "offset"))
bayesx.construct(sx(x, z, bs = "te"))

## varying coefficients
bayesx.construct(sx(x1, by = x2))
bayesx.construct(sx(x1, by = x2, center = TRUE))

## using a map for markov random fields
data("FantasyBnd")
plot(FantasyBnd)
bayesx.construct(sx(id, bs = "mrf", map = FantasyBnd))

## random effects
bayesx.construct(sx(id, bs = "re"))

## examples using optional controlling
## parameters and objects
bayesx.construct(sx(x, bs = "ps", knots = 20))
bayesx.construct(sx(x, bs = "ps", nrknots = 20))
bayesx.construct(sx(x, bs = "ps", knots = 20, nocenter = TRUE))

## use of bs with original 
## BayesX syntax 
bayesx.construct(sx(x, bs = "psplinerw1"))
bayesx.construct(sx(x, bs = "psplinerw2"))
bayesx.construct(sx(x, z, bs = "pspline2dimrw2"))

bayesx.construct(sx(id, bs = "spatial", map = FantasyBnd))
bayesx.construct(sx(x, z, bs = "kriging"))
bayesx.construct(sx(id, bs = "geospline", map = FantasyBnd, nrknots = 5))
bayesx.construct(sx(x, bs = "catspecific"))


## Not run: 
##D ## generate some data
##D set.seed(111)
##D n <- 200
##D 
##D ## regressor
##D dat <- data.frame(x = runif(n, -3, 3))
##D 
##D ## response
##D dat$y <- with(dat, 1.5 + sin(x) + rnorm(n, sd = 0.6))
##D 
##D ## estimate models with
##D ## bayesx REML and MCMC
##D b1 <- bayesx(y ~ sx(x), method = "REML", data = dat)
##D 
##D ## increase inner knots
##D ## decrease degree of the P-spline
##D b2 <- bayesx(y ~ sx(x, knots = 30, degree = 2), method = "REML", data = dat)
##D 
##D 
##D ## compare reported output
##D summary(c(b1, b2))
##D 
##D ## plot the effect for both models
##D plot(c(b1, b2), residuals = TRUE)
##D 
##D 
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
##D ## estimate model
##D b <- bayesx(y ~ sx(x) + sx(z, w, bs = "te") + fac,
##D   data = dat, method = "MCMC")
##D 
##D summary(b)
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
##D names(MunichBnd) <- 1:N
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
##D b <- bayesx(y ~ sx(x1) + sx(id, bs = "mrf", map = MunichBnd), 
##D   method = "REML", data = dat)
##D 
##D ## summary statistics
##D summary(b)
##D 
##D ## plot the effects
##D op <- par(no.readonly = TRUE)
##D par(mfrow = c(1,2))
##D plot(b, term = "sx(id)", map = MunichBnd, 
##D   main = "bayesx() estimate")
##D plotmap(MunichBnd, x = dat$sp, id = dat$id, 
##D   main = "Truth")
##D par(op)
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
##D b <- bayesx(y ~ sx(x1, bs = "psplinerw1") + sx(id, bs = "re"), data = dat)
##D summary(b)
##D plot(b)
##D 
##D ## extract estimated random effects
##D ## and compare with true effects
##D plot(fitted(b, term = "sx(id)")$Mean ~ unique(dat$re))
## End(Not run)



