library(distrEllipse)


### Name: MVNormDistribution
### Title: Generating function for MVNormDistribution-class
### Aliases: MVNormDistribution MVNorm
### Keywords: distribution

### ** Examples

E0 <- MVNorm()
plot(E0)
E1 <- diag(1,2)%*%E0+c(1,2)
plot(E1)
E(E1)
var(E1)



