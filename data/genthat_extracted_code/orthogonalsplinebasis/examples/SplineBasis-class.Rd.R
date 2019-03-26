library(orthogonalsplinebasis)


### Name: SplineBasis-class
### Title: Classes "SplineBasis" and "OrthogonalSplineBasis"
### Aliases: SplineBasis-class OrthogonalSplineBasis-class
###   deriv,SplineBasis-method dim,SplineBasis-method
###   evaluate,SplineBasis,numeric-method integrate,SplineBasis-method
###   orthogonalize,SplineBasis-method plot,SplineBasis,missing-method
###   plot,SplineBasis,vector-method plot,SplineBasis,matrix-method
### Keywords: classes hplot

### ** Examples

showClass("SplineBasis")

knots<-c(0,0,0,0:5,5,5,5)
(base <-SplineBasis(knots))
(obase<-OBasis(knots))
plot(base)
plot(obase)



