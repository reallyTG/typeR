library(SpatialExtremes)


### Name: condmap
### Title: Produces a conditional 2D map from a fitted max-stable process
### Aliases: condmap
### Keywords: hplot

### ** Examples

##Define the coordinate of each location
n.site <- 30
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "whitmat", nugget = 0, range =
2, smooth = 1)

##Now define the spatial model for the GEV parameters
param.loc <- -10 - 4 * locations[,1] + locations[,2]^2
param.scale <- 5 + locations[,2] + locations[,1]^2 / 10
param.shape <- rep(.2, n.site)

##Transform the unit Frechet margins to GEV
for (i in 1:n.site)
  data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
param.shape[i])

##Define a model for the GEV margins to be fitted
##shape ~ 1 stands for the GEV shape parameter is constant
##over the region
loc.form <- loc ~ lon + I(lat^2)
scale.form <- scale ~ lat + I(lon^2)
shape.form <- shape ~ 1

##  1- Fit a max-stable process
fitted <- fitmaxstab(data, locations, "whitmat", loc.form, scale.form,
                     shape.form, nugget = 0)

cond.coord <- c(5.1, 5.1)
condmap(fitted, cond.coord, seq(0, 10, length = 25), seq(0,10, length
 =25), ret.per1 = 100, ret.per2 = 1.5)
points(t(cond.coord), pch = "*", col = 2, cex = 2)



