library(Directional)


### Name: Density of the ESAG distribution
### Title: Density of the ESAG distribution
### Aliases: ESAGdensity
### Keywords: ESAG distribution spherical data

### ** Examples

m <- colMeans( as.matrix( iris[,1:3] ) )
y <- ESAGsim(1000, c(m, 1,0.5) )
mod <- ESAGmle(y)
ESAGdensity( y, c(mod$mu, mod$gam) )



