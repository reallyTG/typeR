library(agridat)


### Name: ratkowsky.onions
### Title: Onion yields for different densities at two locations
### Aliases: ratkowsky.onions
### Keywords: datasets

### ** Examples


data(ratkowsky.onions)
dat <- ratkowsky.onions

# Model inverse yield as a quadratic.  Could be better...
require(lattice)
dat <- transform(dat, iyield = 1/yield)
m1 <- lm(iyield ~ I(density^2)*loc, dat)
dat$pred <- predict(m1)

if(require(latticeExtra)) {
  foo <- xyplot(iyield ~ density, data=dat, group=loc, auto.key=TRUE,
                 main="ratkowski.onions",ylab="Inverse yield")
  foo + xyplot(pred ~ density, data=dat, group=loc, type='l')
}




