library(TLMoments)


### Name: est_cov
### Title: Covariance matrix of PWMs, TLMoments, parameters, or quantiles
### Aliases: est_cov est_cov.PWMs est_cov.TLMoments est_cov.parameters
###   est_cov.quantiles

### ** Examples

### 1: PWMs:

xvec <- rgev(100, shape = .1)
xmat <- cbind(rgev(100, shape = .1), rgev(100, shape = .3))

# Covariance estimation of PWMs normally without parametric assumption:
est_cov(PWMs(xvec))
est_cov(PWMs(xvec), select = 0:1)
est_cov(PWMs(xmat))
est_cov(PWMs(xmat), select = 3)
est_cov(PWMs(xmat[, 1, drop = FALSE]), select = 2:3)

# Parametric assumptions (only GEV by now) can be used:
est_cov(PWMs(xvec), distr = "gev")
est_cov(PWMs(xvec), distr = "gev", select = c(1, 3))

## Not run: 
##D cov(t(replicate(100000,
##D   as.vector(PWMs(cbind(rgev(100, shape = .1), rgev(100, shape = .3)), max.order = 1)))
##D ))
## End(Not run)


### 2. TLMoments:

xvec <- rgev(100, shape = .1)
xmat <- cbind(rgev(100, shape = .1), rgev(100, shape = .3))

# Covariance estimation of TLMoments normally without parametric assumption:
est_cov(TLMoments(xvec))
est_cov(TLMoments(xvec, rightrim = 1))
est_cov(TLMoments(xvec), select = 3:4)

# Parametric assumptions (only GEV by now) can be used:
est_cov(TLMoments(xvec), distr = "gev")

# Matrix inputs
est_cov(TLMoments(xmat))
est_cov(TLMoments(xmat), select = 3:4)
est_cov(TLMoments(xmat[, 1, drop = FALSE]), select = 3:4)

# Covariance of theoretical TLMoments only with parametric assumption:
est_cov(as.TLMoments(c(14, 4, 1)), distr = "gev", set.n = 100)
est_cov(as.TLMoments(c(14, 4, 1), rightrim = 1), distr = "gev", set.n = 100)

# Regionalized TLMoments
est_cov(regionalize(TLMoments(xmat), c(.75, .25)))
est_cov(regionalize(TLMoments(xmat), c(.75, .25)), distr = "gev", select = 3:4)


### 3. Parameters:

xvec <- rgev(100, shape = .1)
xmat <- cbind(rgev(100, shape = .1), rgev(100, shape = .3))

# Covariance estimation of parameters normally with parametric assumption:
est_cov(parameters(TLMoments(xvec), "gev"))
est_cov(parameters(TLMoments(xvec, rightrim = 1), "gev"))
est_cov(parameters(TLMoments(xvec, rightrim = 1), "gev"), select = c("scale", "shape"))

# A nonparametric estimation can be enforced with np.cov:
est_cov(parameters(TLMoments(xvec), "gev"), np.cov = TRUE)
est_cov(parameters(TLMoments(xvec, rightrim = 1), "gev"), np.cov = TRUE)

# Matrix inputs
est_cov(parameters(TLMoments(xmat), "gev"))
est_cov(parameters(TLMoments(xmat), "gev"), select = "shape")
est_cov(parameters(TLMoments(xmat[, 1]), "gev"), select = "shape")

# Theoretical values (leftrim and/or rightrim have to be specified)
para <- as.parameters(loc = 10, scale = 5, shape = .2, distr = "gev")
est_cov(para, set.n = 100)
est_cov(para, rightrim = 1, set.n = 100)

## Not run: 
##D var(t(replicate(10000, parameters(TLMoments(rgev(100, 10, 5, .2)), "gev"))))
## End(Not run)
## Not run: 
##D var(t(replicate(10000, parameters(TLMoments(rgev(100, 10, 5, .2), rightrim = 1), "gev"))))
## End(Not run)

# Parameter estimates from regionalized TLMoments:
est_cov(parameters(regionalize(TLMoments(xmat), c(.75, .25)), "gev"))


### 4. Quantiles:

xvec <- rgev(100, shape = .2)
xmat <- cbind(rgev(100, shape = .1), rgev(100, shape = .3))

# Covariance estimation of parameters normally with parametric assumption:
q <- quantiles(parameters(TLMoments(xvec), "gev"), c(.9, .95, .99))
est_cov(q)
est_cov(q, select = c("0.9", "0.99"))
est_cov(q, select = .95)

# A nonparametric estimation can be enforced with np.cov:
est_cov(q, np.cov = TRUE)

# Matrix inputs
param <- parameters(TLMoments(xmat, 0, 1), "gev")
q <- quantiles(param, c(.9, .95, .99))
est_cov(q)
est_cov(q, select = .99)
param <- parameters(TLMoments(xmat[, 1, drop = FALSE], 0, 1), "gev")
q <- quantiles(param, c(.9, .95, .99))
est_cov(q, select = .99)

# Theoretical values
q <- quantiles(as.parameters(loc = 10, scale = 5, shape = .3, distr = "gev"), c(.9, .99))
est_cov(q)
est_cov(q, leftrim = 0, rightrim = 1)
est_cov(q, leftrim = 0, rightrim = 1, set.n = 100)

# Quantile estimates from regionalized TLMoments:
param <- parameters(regionalize(TLMoments(xmat), c(.75, .25)), "gev")
est_cov(quantiles(param, c(.9, .99)))





