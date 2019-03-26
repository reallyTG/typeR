library(AnalyzeFMRI)


### Name: Sim.3D.GammaRF
### Title: Simulate Gamma distributed Random Field
### Aliases: Sim.3D.GammaRF
### Keywords: utilities

### ** Examples


d <- c(64, 64, 21)
FWHM <- 9
sigma <- diag(FWHM^2, 3) / (8 * log(2))
voxdim <- c(2, 2, 4)
m <- array(1, dim = d)

a <- Sim.3D.GammaRF(d = d, voxdim = voxdim, sigma = sigma, 
                    ksize = 9, mask = m, shape = 6, rate = 1)




