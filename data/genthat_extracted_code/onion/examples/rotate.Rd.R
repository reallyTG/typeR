library(onion)


### Name: rotate
### Title: Rotates 3D vectors using quaternions
### Aliases: rotate
### Keywords: misc

### ** Examples

data(bunny)
par(mfrow=c(2,2))
par(mai=rep(0,4))
p3d(rotate(bunny,Hi),box=FALSE)
p3d(rotate(bunny,H1-Hi+Hj),box=FALSE)
p3d(rotate(bunny,Hk),box=FALSE)
p3d(rotate(bunny,Hall),box=FALSE)



