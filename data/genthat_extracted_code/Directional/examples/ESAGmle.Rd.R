library(Directional)


### Name: MLE of the ESAG distribution
### Title: MLE of the ESAG distribution
### Aliases: ESAGmle
### Keywords: ESAG distribution maximum likelihood estimation spherical
###   data

### ** Examples

m <- colMeans( as.matrix( iris[,1:3] ) )
y <- ESAGsim(1000, c(m, 1,0.5) )
ESAGmle(y)



