library(LICORS)


### Name: merge_states
### Title: Merge several states into one
### Aliases: merge_states
### Keywords: array manip

### ** Examples

set.seed(10)
WW <- matrix(c(rexp(1000, 1/10), runif(1000)), ncol = 5, byrow = FALSE)
WW <- normalize(WW)
image2(WW, density = TRUE)
## Not run: 
##D merge_states(c(1, 1, 5), WW)  # error since states were repeated
## End(Not run)
WW_new <- merge_states(c(1, 3, 5), WW)

par(mfrow = c(1, 2), mar = c(1, 1, 2, 1))
image2(WW, main = paste(ncol(WW), "states"), legend = FALSE)
image2(WW_new, main = paste(ncol(WW_new), "states"), legend = FALSE)



