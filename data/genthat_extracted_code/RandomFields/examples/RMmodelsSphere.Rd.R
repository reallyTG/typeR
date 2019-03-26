library(RandomFields)


### Name: Spherical models
### Title: Covariance models valid on a sphere
### Aliases: RMmodelsSphere sphere 'spherical models' 'Spherical models'
###   'earth models' 'Earth models'
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

RFgetModelNames(isotropy=c("spherical isotropic"))

## an example of a simple model valid on a sphere
model <- RMexp(var=1.6, scale=0.5) + RMnugget(var=0) #exponential + nugget
plot(model)


## a simple simulation
l <- seq(0, 85, 1.2)
coord <- cbind(lon=l, lat=l)


z <- RFsimulate(RMwhittle(s=30, nu=0.45), coord, grid=TRUE) # takes 1 min
plot(z)


z <- RFsimulate(RMwhittle(s=500, nu=0.5), coord, grid=TRUE,
                new_coord_sys="orthographic", zenit=c(25, 25)) 
plot(z)


z <- RFsimulate(RMwhittle(s=500, nu=0.5), coord, grid=TRUE,
                new_coord_sys="gnomonic", zenit=c(25, 25)) 
plot(z)


## space-time modelling on the sphere
sigma <- 5 * sqrt((R.lat()-30)^2 + (R.lon()-20)^2)
model <- RMprod(sigma) * RMtrafo(RMexp(s=500, proj="space"), "cartesian") *
  RMspheric(proj="time") 
z <- RFsimulate(model, 0:10, 10:20, T=seq(0, 1, 0.1),
                coord_system="earth", new_coordunits="km")
plot(z, MARGIN.slices=3)


## Don't show: 
FinalizeExample(); 
## End(Don't show)


