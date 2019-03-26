library(SpatialExtremes)


### Name: print
### Title: Printing objects of classes defined in the SpatialExtreme
###   packages
### Aliases: print print.pspline2 print.maxstab print.copula print.spatgev
###   print.latent
### Keywords: print

### ** Examples

##Define the coordinates of each location
n.site <- 30
coord <- matrix(5 + rnorm(2*n.site, sd = sqrt(2)), ncol = 2)
colnames(coord) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(30, coord, cov.mod = "whitmat", nugget = 0, range = 3,
smooth = 0.5)

## Printing max-stable objects
fit <- fitmaxstab(data, coord, "whitmat")
fit

## Printing spatial GEV objects
loc.form <- scale.form <- shape.form <- y ~ 1
fit <- fitspatgev(data, coord, loc.form, scale.form, shape.form)
fit



