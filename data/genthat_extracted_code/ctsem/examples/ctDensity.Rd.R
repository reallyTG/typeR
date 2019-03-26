library(ctsem)


### Name: ctDensity
### Title: ctDensity
### Aliases: ctDensity

### ** Examples

y <- ctDensity(exp(rnorm(80)))
plot(y$density,xlim=y$xlim,ylim=y$ylim)

#### Compare to base defaults:
par(mfrow=c(1,2))
y=exp(rnorm(10000))
ctdens<-ctDensity(y)
plot(ctdens$density, ylim=ctdens$ylim,xlim=ctdens$xlim)
plot(density(y))



