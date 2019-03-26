library(SpatialExtremes)


### Name: predict
### Title: Prediction of the marginal parameters for various models
### Aliases: predict predict.maxstab predict.copula predict.pspline2
###   predict.spatgev
### Keywords: htest

### ** Examples

## 1- Simulate a max-stable random field
n.site <- 35
locations <- matrix(runif(2*n.site, 0, 10), ncol = 2)
colnames(locations) <- c("lon", "lat")

data <- rmaxstab(50, locations, cov.mod = "whitmat", nugget = 0, range = 30,
smooth = 0.5)

## 2- Transformation to non unit Frechet margins
param.loc <- -10 + 2 * locations[,2]
param.scale <- 5 + 2 * locations[,1]
param.shape <- rep(0.2, n.site)

for (i in 1:n.site)
  data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
param.shape[i])

## 3- Fit a max-stable process with the following model for
##    the GEV parameters
form.loc <- loc ~ lat
form.scale <- scale ~ lon
form.shape <- shape ~ 1

schlather <- fitmaxstab(data, locations, "whitmat", loc.form = form.loc,
                        scale.form = form.scale, shape.form =
                        form.shape)

## 4- GEV parameters estimates at each locations or at ungauged locations
predict(schlather)
ungauged <- data.frame(lon = runif(10, 0, 10), lat = runif(10, 0, 10))
predict(schlather, ungauged)



