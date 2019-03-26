library(orthogonalsplinebasis)


### Name: SplineBasis
### Title: Creating and SplineBasis Objects.
### Aliases: SplineBasis OrthogonalSplineBasis OBasis
### Keywords: hplot algebra

### ** Examples

knots<-c(0,0,0,0:10,10,10,10)
plot(SplineBasis(knots))
obase<-OBasis(knots)
plot(obase)
dim(obase)[2] #number of functions
evaluate(obase, 1:10-.5)



