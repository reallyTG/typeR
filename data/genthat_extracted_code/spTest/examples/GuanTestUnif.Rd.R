library(spTest)


### Name: GuanTestUnif
### Title: Nonparametric Test of Isotropy Using the Sample Semivariogram
### Aliases: GuanTestUnif
### Keywords: external

### ** Examples

library(mvtnorm)
set.seed(1)
#Sample Size
N <- 300
#Set parameter values for exponential covariance function
sigma.sq <- 1
tau.sq <- 0.0
phi <- 1/4
#Generate sampling locations
coords <-  cbind(runif(N,0,16), runif(N,0,16))
D <-  as.matrix(dist(coords))
R <- sigma.sq * exp(-phi*D)
R <- R + diag(tau.sq, nrow = N, ncol = N)
#Simulate Gaussian spatial data
z <- rmvnorm(1,rep(0,N), R, method = "chol")
z <- z - mean(z)
z <- t(z)
mydata <- cbind(coords, z)
mylags = rbind(c(1,0), c(0, 1), c(1, 1), c(-1,1))
myA = rbind(c(1, -1, 0 , 0), c(0, 0, 1, -1))
my.grid = c(1,1)
my.windims = c(4,4)
myh = 0.7
myh.sb = 0.8
my.xlims = c(0, 16)
my.ylims = c(0, 16)
tr <- GuanTestUnif(mydata, mylags, myA, df = 2, myh, "norm", 1.5,
 my.xlims, my.ylims, my.grid,my.windims, myh.sb)
tr


## Not run: 
##D library(geoR)
##D Simulate data from anisotropic covariance function
##D aniso.angle <- pi/4
##D aniso.ratio <- 2
##D coordsA <- coords.aniso(coords, c(aniso.angle, aniso.ratio))
##D Da <- as.matrix(dist(coordsA))
##D R <- sigma.sq * exp(-phi*Da)
##D R <- R + diag(tau.sq, nrow = N, ncol = N)
##D z <- rmvnorm(1,rep(0,N), R, method = c("chol"))
##D z <-  z-mean(z)
##D z <- t(z)
##D mydata <- cbind(coords, z)
##D Run the test on the data generated from an anisotropic covariance function
##D tr <- GuanTestUnif(mydata, mylags, myA, df = 2, myh, "norm", 1.5,
##D  my.xlims, my.ylims, my.grid,my.windims, myh.sb)
##D tr
## End(Not run)



