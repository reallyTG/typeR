library(tripEstimation)


### Name: pick
### Title: Choose twilight segments interactively from light data.
### Aliases: pick picksegs
### Keywords: manip dplot

### ** Examples

## Not run: 
##D  
##D  d <- sin(seq(0, 10, by = 0.01))
##D  id <- 1:length(d)
##D  ## choose a series of start-begin pairs
##D  pk <- pick(id, d, 1000)
##D  ## your start/ends should be marked as blue versus red
##D  plot(id, d, col = c("red", "blue")[is.na(picksegs(pk, 1000))+1])
##D  
##D  
## End(Not run)



