library(nat)


### Name: mask
### Title: Mask an object, typically to produce a copy with some values
###   zeroed out
### Aliases: mask mask.im3d

### ** Examples

x=im3d(array(rnorm(1000),dim=c(10,10,10)), BoundingBox=c(20,200,100,200,200,300))
m=array(1:5,dim=c(10,10,10))
image(x[,,1])
image(mask(x, mask=m, levels=1)[,,1])
image(mask(x, mask=m, levels=1:2)[,,1])



