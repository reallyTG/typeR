library(PoisNonNor)


### Name: RNG_P_NN
### Title: Simultaneously generates count and continuous data
### Aliases: RNG_P_NN

### ** Examples

## Not run: 
##D lamvec = c(0.5,0.7,0.9)
##D 
##D cmat = matrix(c(
##D   1.000,  0.352,  0.265, 0.342,  0.090, 0.141,
##D   0.352,  1.000,  0.121, 0.297, -0.022, 0.177,
##D   0.265,  0.121,  1.000, 0.294, -0.044, 0.129,
##D   0.342,  0.297,  0.294, 1.000,  0.100, 0.354,
##D   0.090, -0.022, -0.044, 0.100,  1.000, 0.386,
##D   0.141,  0.177,  0.129, 0.354,  0.386, 1.000), nrow=6, byrow=TRUE)
##D 
##D rmat = matrix(c(-0.5486,-0.2103, 0.3386, 0.9035, 1.0283, 0.9272), byrow=TRUE, ncol=2)
##D 
##D norow=10e+5
##D 
##D mean.vec=c(1,0.5,100)
##D variance.vec=c(1,0.02777778,1000)
##D 
##D P_NN_data = RNG_P_NN(lamvec, cmat, rmat, norow, mean.vec, variance.vec)
## End(Not run)



