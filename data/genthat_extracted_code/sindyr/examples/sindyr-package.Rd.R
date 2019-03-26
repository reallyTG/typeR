library(sindyr)


### Name: sindyr-package
### Title: Sparse Identification of Nonlinear Dynamics
### Aliases: sindyr-package
### Keywords: package

### ** Examples


# example to reconstruct of 
# the Lorenz system

library(sindyr)

set.seed(666)
dt = .001
numsteps = 10000; dt = dt; sigma = 10; r = 28; b = 2.6;
xs = data.frame(lorenzattractor(numsteps, dt, sigma, r, b, plots=FALSE))
colnames(xs) = list('x','y','z')
xs = xs[2000:nrow(xs),] # cut out initialization

points3D(xs$x,xs$y,xs$z,type='l',col='black')
Theta = features(xs,3) # grid of features
par(mfrow=c(7,3),oma = c(2,0,0,0) + 0.1,mar = c(1,1,1,1) + 0.1)
for (i in 2:ncol(Theta)) {
  plot(Theta[,i],xlab='t',main=gsub(':','',colnames(Theta)[i]),type='l',xaxt='n',yaxt='n')
}

sindy.obj = sindy(xs=xs,dt=dt,lambda=.5) # let's reconstruct
sindy.obj$B # Lorenz equations




