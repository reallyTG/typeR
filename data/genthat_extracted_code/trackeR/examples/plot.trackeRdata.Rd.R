library(trackeR)


### Name: plot.trackeRdata
### Title: Plot training sessions in form of trackeRdata objects
### Aliases: plot.trackeRdata

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D ## plot heart rate and pace for the first 3 sessions
##D plot(runs, session = 1:3)
##D ## plot raw speed data for session 4
##D plot(runs, session = 4, what = "speed", threshold = FALSE, smooth = FALSE)
##D ## threshold speed variable
##D plot(runs, session = 4, what = "speed", threshold = TRUE, smooth = FALSE,
##D     variable = "speed", lower = 0, upper = 10)
##D ## and smooth (thresholding with default values)
##D plot(runs, session = 4, what = "speed", threshold = TRUE,
##D     smooth = TRUE, width = 15, parallel = FALSE)
## End(Not run)



