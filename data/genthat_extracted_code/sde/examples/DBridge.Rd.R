library(sde)


### Name: DBridge
### Title: Simulation of diffusion bridge
### Aliases: DBridge
### Keywords: datagen ts

### ** Examples

d <- expression((3-x))
s <- expression(1.2*sqrt(x))
par(mar=c(3,3,1,1))
par(mfrow=c(2,1)) 
set.seed(123)
X <- DBridge(x=1.7,y=0.5, delta=0.01, drift=d, sigma=s)
plot(X)
X <- DBridge(x=1,y=5, delta=0.01, drift=d, sigma=s)
plot(X)



