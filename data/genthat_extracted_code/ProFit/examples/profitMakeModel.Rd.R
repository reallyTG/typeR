library(ProFit)


### Name: profitMakeModel
### Title: High-Level 2D Galaxy and Point Source Image Creation
### Aliases: profitMakeModel
### Keywords: Model Sersic

### ** Examples

modellist = list(
  sersic = list(
    xcen   = c(180, 60),
    ycen   = c(90, 10),
    mag = c(15, 13),
    re  = c(14, 5),
    nser  = c(3, 10),
    ang  = c(46, 80),
    axrat  = c(0.4, 0.6),
    box = c(0.5,-0.5)
  ),
  pointsource = list(
    xcen   = c(34,10,150),
    ycen   = c(74,120,130),
    mag = c(10,13,16)
  ),
  sky = list(
    bg = 3e-12
  )
)

# Without a PSF provided only the extended sources are shown, with no convolution:

profitMakeModel(modellist=modellist, dim=c(200,200), plot=TRUE)

# With a PSF provided the PSFs are displayed and the extended sources are convolved with
# the PSF:

profitMakeModel(modellist=modellist, psf=profitMakePointSource(),
dim=c(200,200), plot=TRUE)

# Using a GPU to create the image:
## Not run: 
##D tempCL=profitOpenCLEnv()
##D profitMakeModel(modellist=modellist, dim=c(200,200), openclenv=tempCL, plot=TRUE)
##D 
##D # The time elapsed is the key thing to check. The system time tends to be higher for
##D # OpenCL due to the large number of system calls made to the GPU.
##D 
##D system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200))})
##D system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200),
##D openclenv=tempCL)})
## End(Not run)

# Using OpenMP to create the image:
## Not run: 
##D system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200))})
##D system.time(for(i in 1:100){profitMakeModel(modellist=modellist, dim=c(200,200), omp_threads=4)})
## End(Not run)




