library(distrEllipse)


### Name: MVtDistribution
### Title: Generating function for MvtDistribution-class
### Aliases: MVtDistribution MVt
### Keywords: distribution

### ** Examples

E0 <- MVt()
plot(E0)
E1 <- diag(1,2)%*%E0+c(1,2)
plot(E1)
E(E1)
var(E1)



