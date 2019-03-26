library(IDPmisc)


### Name: cart2clock
### Title: Convert Cartesian Coordinates to Clock Coordinates
### Aliases: cart2clock
### Keywords: dplot manip utilities

### ** Examples

## convert clock coordinates to cartesian coordinates
xy <- clock2cart(rho=rep(1,33),phi=seq(0,to=360,length.out=33),circle=360)

## convert the cartesian coordinates back to clock coordinates
rhophi <- cart2clock(xy$x,xy$y,circle=360)

round(clock2cart(rhophi,circle=360)-xy)
## QED



