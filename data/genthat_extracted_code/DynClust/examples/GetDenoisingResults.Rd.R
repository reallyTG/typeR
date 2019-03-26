library(DynClust)


### Name: GetDenoisingResults
### Title: Get denoising step result
### Aliases: GetDenoisingResults

### ** Examples


## Not run: 
##D     library(DynClust)
##D 
##D     ## use fluorescence calcium imaging of neurons performed with Fura 2 excited at 340 nm
##D     data('adu340_4small',package='DynClust')
##D 
##D     ## Gain of the CCD camera:
##D     G <- 0.146
##D     ## readout variance of the CCD camera:
##D     sro2 <- (16.4)^2
##D     ## Stabilization of the variance to get a normalized dataset (variance=1)
##D     FT <- 2*sqrt(adu340_4small/G + sro2)
##D     FT.range = range(FT)
##D 
##D     ## launches the denoising step on the dataset with a statistical level of 5%
##D     FT.den.tmp <- RunDenoising(FT,1,mask.size=NA,nproc=2)
##D 
##D     ## get the results of the denoising step
##D     FT.den.res <- GetDenoisingResults(FT,FT.den.tmp)
##D 
##D     ## plot results at time 50 in same grey scale
##D     par(mfrow=c(1,3))
##D     image(FT[,,50],zlim=FT.range,col=gray(seq(0,1,l=128)))
##D     title('Original')
##D     image(FT.den.res[,,50],zlim=FT.range,col=gray(seq(0,1,l=128)))
##D     title('Denoised')
##D     image(FT.den.res[,,50]-FT[,,50],col=gray(seq(0,1,l=128)))
##D     title('Residuals')
## End(Not run)



