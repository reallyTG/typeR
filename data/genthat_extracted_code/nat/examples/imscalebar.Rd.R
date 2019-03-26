library(nat)


### Name: imscalebar
### Title: Make a scalebar to accompany an image.im3d plot
### Aliases: imscalebar

### ** Examples

## Not run: 
##D LHMask=read.im3d(system.file('tests/testthat/testdata/nrrd/LHMask.nrrd',package='nat'))
##D op=par(no.readonly = TRUE)
##D layout(matrix(c(1, 2), ncol = 2L), widths = c(1, 0.2))
##D rval=image(imslice(LHMask,10), asp=TRUE)
##D imscalebar(rval)
##D par(op)
## End(Not run)



