library(dplyr)


### Name: progress_estimated
### Title: Progress bar with estimated time.
### Aliases: progress_estimated
### Keywords: internal

### ** Examples

p <- progress_estimated(3)
p$tick()
p$tick()
p$tick()

p <- progress_estimated(3)
for (i in 1:3) p$pause(0.1)$tick()$print()

p <- progress_estimated(3)
p$tick()$print()$
 pause(1)$stop()

# If min_time is set, progress bar not shown until that many
# seconds have elapsed
p <- progress_estimated(3, min_time = 3)
for (i in 1:3) p$pause(0.1)$tick()$print()

## Not run: 
##D p <- progress_estimated(10, min_time = 3)
##D for (i in 1:10) p$pause(0.5)$tick()$print()
## End(Not run)



