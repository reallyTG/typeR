library(spTest)


### Name: LuTest
### Title: Nonparametric Test of Symmetry Using the Periodogram
### Aliases: LuTest
### Keywords: external

### ** Examples

library(mvtnorm)
set.seed(1)
#Number of rows and columns
nr <- 15
nc <- 15
n <- nr*nc
#Set up the coordinates
coords <- expand.grid(0:(nr-1), 0:(nc-1))
coords <- cbind(coords[,2], coords[,1])
#Compute the distance between sampling locations
D <- as.matrix(dist(coords))
#Set parameter values for exponential covariance function
sigma.sq <- 1
tau.sq <- 0.0
phi <- 1/4
#Simulate data using isotropic covariance function
D <- as.matrix(dist(coords))
R <- sigma.sq * exp(-phi*D)
R <- R + diag(tau.sq, nrow = n, ncol = n)
z <- rmvnorm(1,rep(0,n), R, method = c("chol"))
z <-  z-mean(z)
z <- t(z)
mydata <- cbind(coords, z)
#Run the test on the data from an isotropic (symmetric) covariance function
tr <- LuTest(mydata, nr, nc, test = "complete", nsim = 1000)
tr

library(geoR)
#Simulate data from anisotropic (non-symmetric) covariance function
aniso.angle <- pi/4
aniso.ratio <- 2
coordsA <- coords.aniso(coords, c(aniso.angle, aniso.ratio))
Da <- as.matrix(dist(coordsA))
R <- sigma.sq * exp(-phi*Da)
R <- R + diag(tau.sq, nrow = n, ncol = n)
z <- rmvnorm(1,rep(0,n), R, method = c("chol"))
z <-  z-mean(z)
z <- t(z)
mydata <- cbind(coords, z)
#Run the test on the data generated from an anisotropic 
#(and non reflection and non completely symmetric) covariance function
tr <- LuTest(mydata, nr, nc, test = "complete", nsim = 1000)
tr



