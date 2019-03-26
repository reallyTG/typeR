library(TLMoments)


### Name: quantiles
### Title: Calculating quantiles from distribution parameters
### Aliases: quantiles

### ** Examples

# Generating data sets:
xmat <- matrix(rnorm(100), nc = 4)
xvec <- xmat[, 3]
xlist <- lapply(1L:ncol(xmat), function(i) xmat[, i])
xdat <- data.frame(
 station = rep(letters[1:2], each = 50),
 season = rep(c("S", "W"), 50),
 hq = as.vector(xmat)
)

# Calculating quantiles from parameters-object
tlm <- TLMoments(xvec, leftrim = 0, rightrim = 1)
quantiles(parameters(tlm, "gev"), c(.9, .99))
tlm <- TLMoments(xmat, leftrim = 1, rightrim = 1)
quantiles(parameters(tlm, "gum"), c(.9, .95, .999))
tlm <- TLMoments(xlist)
quantiles(parameters(tlm, "gpd"), .999)
tlm <- TLMoments(xdat, hq ~ station, leftrim = 2, rightrim = 3)
quantiles(parameters(tlm, "gev"), seq(.1, .9, .1))
tlm <- TLMoments(xdat, hq ~ station + season, leftrim = 0, rightrim = 2)
quantiles(parameters(tlm, "gum"), seq(.1, .9, .1))

# Distribution can be overwritten (but parameters have to fit)
tlm <- TLMoments(xvec, leftrim = 0, rightrim = 1)
params <- parameters(tlm, "gev")
quantiles(params, c(.9, .99))
quantiles(params[1:2], c(.9, .99), distr = "gum")
evd::qgumbel(c(.9, .99), loc = params[1], scale = params[2])


# Using magrittr
library(magrittr)
rgev(50, shape = .3) %>%
  TLMoments(leftrim = 0, rightrim = 1) %>%
  parameters("gev") %>%
  quantiles(c(.99, .999))

# Calculating quantiles to given parameters for arbitrary functions
quantiles(c(mean = 10, sd = 3), c(.95, .99), "norm")
qnorm(c(.95, .99), mean = 10, sd = 3)

# These give errors:
#quantiles(c(loc = 10, scale = 5, shape = .3), c(.95, .99), "notexistingdistribution")
#quantiles(c(loc = 10, scale = 5, shpe = .3), c(.95, .99), "gev") # wrong arguments



