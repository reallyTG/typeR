library(neuRosim)


### Name: Sim.3D.GRF
### Title: Simulate a GRF (adopted from 'AnalyzeFMRI')
### Aliases: Sim.3D.GRF
### Keywords: low-level noise

### ** Examples

     d <- c(64, 64, 21)
     FWHM <- 9
     sigma <- diag(FWHM^2, 3) / (8 * log(2))
     voxdim <- c(2, 2, 4)
     msk <- array(1, dim = d)   
     field <- Sim.3D.GRF(d = d, voxdim = voxdim, sigma = sigma, 
		ksize = 9, mask = msk, type = "max")
## Don't show: 
rm(d,FWHM,sigma,voxdim,msk,field)
## End(Don't show)



