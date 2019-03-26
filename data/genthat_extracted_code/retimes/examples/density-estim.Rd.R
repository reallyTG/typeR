library(retimes)


### Name: density-estim
### Title: Density Estimators
### Aliases: histestim distestim kernestim

### ** Examples

x <- rexgauss(1000, mu=500, sigma=100, tau=250)
k <- kernestim(x); k
h <- histestim(x); h
d <- distestim(x); d
plot(density(x))
segments(k,0,k,1,col="red")
segments(h,0,h,1,col="blue")
segments(d,0,d,1,col="green")



