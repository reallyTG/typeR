library(Directional)


### Name: Random values generation from the ESAG distribution
### Title: Random values generation from the ESAG distribution
### Aliases: ESAGsim
### Keywords: ESAG distribution simulation spherical data

### ** Examples

m <- colMeans( as.matrix( iris[,1:3] ) )
y <- ESAGsim(1000, c(m, 1, 0.5) )
ESAGmle(y)



