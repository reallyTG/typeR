library(IDPmisc)


### Name: clock2cart
### Title: Convert Clock Coordinates to Cartesian Coordinates
### Aliases: clock2cart
### Keywords: dplot manip utilities

### ** Examples

## an easy way to plot a circle
xy <- clock2cart(rho=rep(1,33),phi=seq(0,to=360,length.out=33),circle=360)
plot(xy)



