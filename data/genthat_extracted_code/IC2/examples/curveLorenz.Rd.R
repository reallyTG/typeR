library(IC2)


### Name: curveLorenz
### Title: Lorenz Curve
### Aliases: curveLorenz

### ** Examples

data(hhbudgets)

curveLorenz(x=hhbudgets[, "transporte"], w =hhbudgets[,"factor"])
curveLorenz(x=hhbudgets[, "transporte"], w =hhbudgets[,"factor"], gener=TRUE, col="red")



