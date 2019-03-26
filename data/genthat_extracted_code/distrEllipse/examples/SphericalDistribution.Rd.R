library(distrEllipse)


### Name: SphericalDistribution
### Title: Generating function for SphericalDistribution-class
### Aliases: SphericalDistribution
### Keywords: distribution

### ** Examples

E0 <- SphericalDistribution()
plot(E0)
E1 <- diag(1,2)%*%E0+c(1,2)
plot(E1)
E(E1)
var(E1)



