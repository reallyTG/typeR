library(RandomFields)


### Name: Coordinate systems
### Title: Coordinate systems
### Aliases: zenit 'Coordinate systems' 'coordinate systems' 'coordinate
###   system' coordinates
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

z <- 1:4
x <- cbind(z, 0)
y <- cbind(0, z)
model <- RMwhittle(nu=0.5)
RFcov(model, x, y, grid=FALSE) ##  standard is (cartesian) model


## same as above, but explicit:
RFcov(model, x, y, grid=FALSE, coord_sys="cartesian") 


## model is not valid on a sphere; x,y coordinates are
## transformed from earth coordinates to spherical coordinates
RFcov(model, x, y, grid=FALSE, coord_sys="earth")


## now the scale is chosen such that the covariance
## values are comparable to those in the cartesian case
RFcov(RMS(model, s= 1 / 180 * pi), x, y, grid=FALSE,
      coord_sys="earth")


## projection onto a plane first. Then the scale is interpreted
## in the usual, i.e. cartesian, sense, i.e. the model does not
## really make sense
RFoptions(zenit = c(2.5, 2.5))
RFcov(model, x, y, grid=FALSE,
      coord_sys="earth", new_coord_sys="orthographic")


## again, here the scale is chosen to be comparable to the cartesian case
## here the (standard) units are [km]
(z1 <- RFcov(RMS(model, s= 6350 / 180 * pi), x, y, grid=FALSE,
             coord_sys="earth", new_coord_sys="orthographic"))


## as above, but in miles
(z2 <- RFcov(RMS(model, s= 6350 / 1.609344 / 180 * pi), x, y, grid=FALSE,
             coord_sys="earth", new_coord_sys="orthographic",
             new_coordunits="miles"))
stopifnot(all.equal(z1, z2))


## again, projection onto a plane first, but now using the
## gnomonic projection
## here the (standard) units are [km]
(z1 <- RFcov(RMS(model, s= 6350 / 180 * pi), x, y, grid=FALSE,
             coord_sys="earth", new_coord_sys="gnomonic"))

## as above, but in miles
(z2 <- RFcov(RMS(model, s= 6350 / 1.609344 / 180 * pi), x, y, grid=FALSE,
             coord_sys="earth", new_coord_sys="gnomonic",
             new_coordunits="miles"))
stopifnot(all.equal(z1, z2, tol=1e-5))




## Don't show: 
FinalizeExample()
## End(Don't show)


