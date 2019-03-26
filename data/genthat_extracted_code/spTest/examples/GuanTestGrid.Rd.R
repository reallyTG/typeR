library(spTest)


### Name: GuanTestGrid
### Title: Nonparametric Test of Isotropy Using the Sample Semivariogram
### Aliases: GuanTestGrid
### Keywords: external

### ** Examples

library(mvtnorm)
set.seed(1)
#number of rows and columns
nr <- 12
nc <- 18
n <- nr*nc
#Set up the coordinates
coords <- expand.grid(0:(nr-1), 0:(nc-1))
coords <- cbind(coords[,2], coords[,1])
#compute the distance between sampling locations
D <- as.matrix(dist(coords))
#Set parameter values for exponential covariance function
sigma.sq <- 1
tau.sq <- 0.0
phi <- 1/4
R <- sigma.sq * exp(-phi*D)
R <- R + diag(tau.sq, nrow = n, ncol = n)
#Simulate Gaussian spatial data
z <- rmvnorm(1,rep(0,n), R, method = c("chol"))
z <-  z-mean(z)
z <- t(z)
mydata <- cbind(coords, z)
mylags <-  rbind(c(1,0), c(0, 1), c(1, 1), c(-1,1))
myA <-  rbind(c(1, -1, 0 , 0), c(0, 0, 1, -1))
tr <- GuanTestGrid(mydata, delta = 1, mylags, myA, df = 2, window.dims = c(3,2), 
pt.est.edge = TRUE, sig.est.edge = TRUE, sig.est.finite = TRUE )
tr

library(geoR)
#Simulate data from anisotropic covariance function
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
#Run the test on the data generated from an anisotropic covariance function
tr <- GuanTestGrid(mydata, delta = 1, mylags, myA, df = 2, window.dims = c(3,2), 
pt.est.edge = TRUE,sig.est.edge = TRUE, sig.est.finite = TRUE)
tr



