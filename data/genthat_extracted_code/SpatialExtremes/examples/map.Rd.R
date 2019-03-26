library(SpatialExtremes)


### Name: map
### Title: Produces a 2D map from a fitted max-stable process
### Aliases: map
### Keywords: hplot

### ** Examples

##We run an artifical example using the volcano data set as a study
##region
dim <- dim(volcano)
n.x <- dim[1]
n.y <- dim[2]

x <- 10 * 1:n.x
y <- 10 * 1:n.y

n.site <- 15
idx.x <- sample(n.x, n.site)
idx.y <- sample(n.y, n.site)
locations <- cbind(lon = x[idx.x], lat = y[idx.y])
alt <- diag(volcano[idx.x, idx.y])

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0, range = 750,
smooth = 1)

##Now define the spatial model for the GEV parameters
param.loc <- -10 - 0.04 * locations[,1] + alt / 5
param.scale <- 5 - locations[,2] / 30 + alt / 4
param.shape <- rep(.2, n.site)

##Transform the unit Frechet margins to GEV
for (i in 1:n.site)
  data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
param.shape[i])

##Define a model for the GEV margins to be fitted
##shape ~ 1 stands for the GEV shape parameter is constant
##over the region
loc.form <- loc ~ lon + alt
scale.form <- scale ~ lat + alt
shape.form <- shape ~ 1

##  1- Fit a max-stable process
schlather <- fitmaxstab(data, locations, "whitmat", loc.form, scale.form,
                        shape.form, marg.cov = cbind(alt = alt), nugget
= 0)

##  2- Produce a map of the pointwise 50-year return level

##Here we have only one covariate i.e. alt
n.cov <- 1
covariates <- array(volcano, dim = c(n.x, n.y, n.cov), dimnames =
list(NULL, NULL, "alt"))

par(mfrow = c(1,2))
image(x, y, volcano, col = terrain.colors(64), main = "Elevation map")
map(schlather, x, y, covariates, ret.per = 50, plot.contour = FALSE,
main = "50-year return level")



