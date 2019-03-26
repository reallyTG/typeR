library(cycleRtools)


### Name: summary_metrics
### Title: Summary metrics.
### Aliases: NP TSS pwr_TRIMP ride_time summary_metrics xPower

### ** Examples

data(ridedata)

## Display all summary metrics with an *apply call.
fns   <- list("ride_time", "xPower", "NP", "pwr_TRIMP", "TSS")
argl  <- list(data = ridedata, x = ridedata$timer.s, CP = 300)
metrs <- vapply(fns, function(f) {
  do.call(f, argl[names(argl) %in% names(formals(f))])
}, numeric(1))

names(metrs) <- fns
print(metrs)



