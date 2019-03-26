library(trackeR)


### Name: timeline
### Title: Generic function for visualising the sessions on a time versus
###   date plot
### Aliases: timeline timeline.trackeRdata timeline.trackeRdataSummary

### ** Examples

## Not run: 
##D data('runs', package = 'trackeR')
##D ## timeline plot applied on the \code{trackeRdata} object directly and with
##D ## inferred limits for the time axis
##D timeline(runs)
##D 
##D ## the same timeline plot applied on the \code{trackeRdataSummary} object
##D runSummary <- summary(runs)
##D timeline(runSummary, lims = c('00:01', '23:59'))
## End(Not run)



