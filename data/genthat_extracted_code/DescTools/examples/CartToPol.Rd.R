library(DescTools)


### Name: CartToPol
### Title: Transform Cartesian to Polar/Spherical Coordinates and Vice
###   Versa
### Aliases: CartToPol PolToCart CartToSph SphToCart
### Keywords: arith dplot

### ** Examples

CartToPol(x=1, y=1)
CartToPol(x=c(1,2,3), y=c(1,1,1))
CartToPol(x=c(1,2,3), y=1)


PolToCart(r=1, theta=pi/2)
PolToCart(r=c(1,2,3), theta=pi/2)

CartToSph(x=1, y=2, z=3)   # r=3.741657, theta=0.930274, phi=1.107149



