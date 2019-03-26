library(spatstat)


### Name: Kest
### Title: K-function
### Aliases: Kest
### Keywords: spatial nonparametric

### ** Examples

 X <- runifpoint(50)
 K <- Kest(X)
 K <- Kest(cells, correction="isotropic")
 plot(K)
 plot(K, main="K function for cells")
 # plot the L function
 plot(K, sqrt(iso/pi) ~ r)
 plot(K, sqrt(./pi) ~ r, ylab="L(r)", main="L function for cells")



