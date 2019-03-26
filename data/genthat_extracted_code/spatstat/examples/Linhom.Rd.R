library(spatstat)


### Name: Linhom
### Title: L-function
### Aliases: Linhom
### Keywords: spatial nonparametric

### ** Examples

 data(japanesepines)
 X <- japanesepines
 L <- Linhom(X, sigma=0.1)
 plot(L, main="Inhomogeneous L function for Japanese Pines")



