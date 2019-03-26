library(spatstat)


### Name: runifdisc
### Title: Generate N Uniform Random Points in a Disc
### Aliases: runifdisc
### Keywords: spatial datagen

### ** Examples

 # 100 random points in the unit disc
 plot(runifdisc(100))
 # 42 random points in the ellipse with major axis 3 and minor axis 1
 X <- runifdisc(42)
 Y <- affine(X, mat=diag(c(3,1)))
 plot(Y)



