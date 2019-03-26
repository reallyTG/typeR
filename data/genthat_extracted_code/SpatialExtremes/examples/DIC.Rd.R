library(SpatialExtremes)


### Name: DIC
### Title: Deviance Information Criterion
### Aliases: DIC
### Keywords: models

### ** Examples

## Generate realizations from the model
n.site <- 15
n.obs <- 35
coord <- cbind(lon = runif(n.site, -10, 10), lat = runif(n.site, -10 , 10))

gp.loc <- rgp(1, coord, "powexp", sill = 4, range = 20, smooth = 1)
gp.scale <- rgp(1, coord, "powexp", sill = 0.4, range = 5, smooth = 1)
gp.shape <- rgp(1, coord, "powexp", sill = 0.01, range = 10, smooth = 1)

locs <- 26 + 0.5 * coord[,"lon"] + gp.loc
scales <- 10 + 0.2 * coord[,"lat"] + gp.scale
shapes <- 0.15 + gp.shape

data <- matrix(NA, n.obs, n.site)
for (i in 1:n.site)
  data[,i] <- rgev(n.obs, locs[i], scales[i], shapes[i])

loc.form <- y ~ lon
scale.form <- y ~ lat
shape.form <- y ~ 1

hyper <- list()
hyper$sills <- list(loc = c(1,8), scale = c(1,1), shape = c(1,0.02))
hyper$ranges <- list(loc = c(2,20), scale = c(1,5), shape = c(1, 10))
hyper$smooths <- list(loc = c(1,1/3), scale = c(1,1/3), shape = c(1, 1/3))
hyper$betaMeans <- list(loc = rep(0, 2), scale = c(9, 0), shape = 0)
hyper$betaIcov <- list(loc = solve(diag(c(400, 100))),
                       scale = solve(diag(c(400, 100))),
                       shape = solve(diag(c(10), 1, 1)))

## We will use an exponential covariance function so the jump sizes for
## the shape parameter of the covariance function are null.
prop <- list(gev = c(2.5, 1.5, 0.3), ranges = c(40, 20, 20), smooths = c(0,0,0))
start <- list(sills = c(4, .36, 0.009), ranges = c(24, 17, 16), smooths
              = c(1, 1, 1),  beta = list(loc = c(26, 0), scale = c(10, 0),
                               shape = c(0.15)))

mc <- latent(data, coord, loc.form = loc.form, scale.form = scale.form,
             shape.form = shape.form, hyper = hyper, prop = prop, start = start,
             n = 500)
DIC(mc)



