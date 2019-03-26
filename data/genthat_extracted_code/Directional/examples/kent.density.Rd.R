library(Directional)


### Name: Density of the spherical Kent distribution
### Title: Density of the spherical Kent distribution
### Aliases: kent.density
### Keywords: ESAG distribution spherical data

### ** Examples

m <- colMeans( as.matrix( iris[,1:3] ) )
y <- rkent(1000, k = 10, m = m, b = 5)
mod <- kent.mle(y)
kent.density( y, G = mod$G, param = mod$param )



