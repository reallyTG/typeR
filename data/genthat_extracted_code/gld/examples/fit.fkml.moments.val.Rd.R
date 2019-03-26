library(gld)


### Name: fit.fkml.moments.val
### Title: Method of moments estimation for the FKML type of the
###   generalised lambda distribution using given moment values
### Aliases: fit.fkml.moments.val
### Keywords: distribution

### ** Examples

# Approximation to the standard normal distribution
norm.approx <- fit.fkml.moments.val(c(0,1,0,3))
norm.approx
# Another distribution with the same moments
another <- fit.fkml.moments.val(c(0,1,0,3),start=c(2,2))
# Compared
plotgld(norm.approx,ylim=c(0,0.75),main="Approximation of the standard normal")
plotgld(another,add=TRUE,col=2)



