library(distrEllipse)


### Name: EllipticalDistribution
### Title: Generating function for EllipticalDistribution-class
### Aliases: EllipticalDistribution
### Keywords: distribution

### ** Examples

E0 <- EllipticalDistribution()
plot(E0)
E1 <- diag(1,2)%*%E0+c(1,2)
plot(E1)
E(E1)
var(E1)



