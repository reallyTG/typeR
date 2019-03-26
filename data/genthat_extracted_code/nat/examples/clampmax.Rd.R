library(nat)


### Name: clampmax
### Title: Return function that finds maximum of its inputs within a
###   clamping range
### Aliases: clampmax

### ** Examples

## Not run: 
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd',package='nat'))
##D d=unmask(rnorm(sum(LHMask),mean=5,sd=5),LHMask)
##D op=par(mfrow=c(1,2))
##D rval=image(projection(d,projfun=max))
##D image(projection(d,projfun=clampmax(0,10)),zlim=rval$zlim)
##D par(op)
## End(Not run)



