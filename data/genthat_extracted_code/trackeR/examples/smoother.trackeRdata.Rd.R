library(trackeR)


### Name: smoother.trackeRdata
### Title: Smoother for 'trackeRdata' objects.
### Aliases: smoother.trackeRdata

### ** Examples

## Not run: 
##D data('run', package = 'trackeR')
##D ## unsmoothed speeds
##D plot(run, smooth = FALSE)
##D ## default smoothing
##D plot(run, smooth = TRUE)
##D ## smoothed with some non-default options
##D runS <- smoother(run, fun = 'median', width = 20, what = 'speed')
##D plot(runS, smooth = FALSE)
## End(Not run)



