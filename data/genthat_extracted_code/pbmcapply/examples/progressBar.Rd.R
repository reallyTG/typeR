library(pbmcapply)


### Name: progressBar
### Title: Progress bar with the estimated time to completion (ETA).
### Aliases: progressBar

### ** Examples

# Test function
testit <- function(x, ...)
{
    pb <- progressBar(...)
    for(i in c(0, x, 1)) {
      setTxtProgressBar(pb, i)
    }
    close(pb)
}

# Txt progress bar
testit(sort(runif(10)), style = "txt", substyle = 3)

# ETA progress bar
testit(sort(runif(10)), style = "ETA")



