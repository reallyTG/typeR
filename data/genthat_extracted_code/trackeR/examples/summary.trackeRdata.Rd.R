library(trackeR)


### Name: summary.trackeRdata
### Title: Summary of training sessions
### Aliases: summary.trackeRdata trackeRdataSummary

### ** Examples

data('runs', package = 'trackeR')
runSummary <- summary(runs, session = 1:2)
## print summary
runSummary
print(runSummary, digits = 3)
## Not run: 
##D ## change units
##D change_units(runSummary, variable = 'speed', unit = 'km_per_h')
##D ## plot summary
##D runSummaryFull <- summary(runs)
##D plot(runSummaryFull)
##D plot(runSummaryFull, group = c('total', 'moving'),
##D     what = c('avgSpeed', 'distance', 'duration', 'avgHeartRate'))
## End(Not run)



