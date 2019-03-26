library(nat)


### Name: projection
### Title: Make 2D (orthogonal) projection of 3D image data
### Aliases: projection

### ** Examples

## Not run: 
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd',package='nat'))
##D d=unmask(rnorm(sum(LHMask),mean=5,sd=5),LHMask)
##D op=par(mfrow=c(1,2))
##D rval=image(projection(d,projfun=max))
##D image(projection(d,projfun=clampmax(0,10)),zlim=rval$zlim)
##D par(op)
## End(Not run)
## Not run: 
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd',package='nat'))
##D image(projection(LHMask),asp=TRUE)
## End(Not run)



