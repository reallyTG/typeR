library(RSurvey)


### Name: ProgressBar
### Title: GUI: Progress Bar
### Aliases: ProgressBar SetProgressBar
### Keywords: misc

### ** Examples

## Not run: 
##D   maximum <- 10
##D   label <- "Estimated time to completion is being calculated\u2026"
##D   pb <- ProgressBar(label = label, maximum = maximum, nsteps = maximum)
##D 
##D   for (i in seq_len(maximum)) {
##D     est.time <- system.time(Sys.sleep(1))["elapsed"] * (maximum - i)
##D     label <- paste("Estimated time to completion is", round(est.time), "secs")
##D     ans <- try(SetProgressBar(pb, value = i, label = label, step = i))
##D     if (inherits(ans, "try-error")) break
##D   }
## End(Not run)




