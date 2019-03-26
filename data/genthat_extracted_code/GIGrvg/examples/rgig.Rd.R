library(GIGrvg)


### Name: rgig
### Title: Generator and Density of Generalized Inverse Gaussian (GIG)
###   distribution.
### Aliases: rgig dgig
### Keywords: package distribution datagen

### ** Examples

## Draw a random sample
x <- rgig(n=10, lambda=0.5, chi=0.1, psi=2)

## Evaluate the density
x <- dgig(0.3, lambda=0.5, chi=0.1, psi=2)

## Create a random sample and create a histgram
y <- rgig(n=10^5,0.1,2,3)
hist(y,breaks=100,freq=FALSE)
xval <- seq(0,max(y),0.01) # to add plot the corresponding density
lines(xval,dgig(xval,0.1,2,3))

## Not run: 
##D ## Use a fast method from package Runuran for large samples
##D ## (method PINV implements an approximate inversion method)
##D library("Runuran")
##D gen <- pinvd.new(udgig(theta=0.2, psi=0.05, chi=0.05))
##D x <- ur(gen, 10^6)
## End(Not run)




