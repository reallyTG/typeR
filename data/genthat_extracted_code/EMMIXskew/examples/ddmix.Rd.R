library(EMMIXskew)


### Name: ddmix
### Title: Density Functions of Mixture Models
### Aliases: ddmix
### Keywords: cluster

### ** Examples


p=2
g=3

#mixing propotion of each component
pro   <- c(0.3,0.3,0.4)

#specify mean and covariance matrix for each component

sigma<-array(0,c(2,2,3))
for(h in 2:3) sigma[,,h]<-diag(2)
sigma[,,1]<-cbind( c(1,0),c(0,.1))

mu  <- cbind(c(4,-4),c(3.5,4),c( 0, 0))

#specify other parameters for "mvt","msn","mst"

delta <- cbind(c(3,3),c(1,5),c(-3,1))
dof    <- c(3,5,5)

#specify the distribution
distr <- "mst"

y <- c(1,2)

n=1

#then the density value at y for the mixture model is 

ddmix(y, n, p, g, distr, mu, sigma, dof, delta)




