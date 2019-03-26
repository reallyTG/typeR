library(itertools)


### Name: ibreak
### Title: Create an iterator that can be told to stop
### Aliases: ibreak
### Keywords: utilities

### ** Examples

# See how high we can count in a tenth of a second
mkfinished <- function(time) {
  starttime <- proc.time()[3]
  function() proc.time()[3] > starttime + time
}
length(as.list(ibreak(icount(), mkfinished(0.1))))



