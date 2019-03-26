library(qpcR)


### Name: LRE
### Title: Calculation of qPCR efficiency by the 'linear regression of
###   efficiency' method
### Aliases: LRE
### Keywords: models nonlinear

### ** Examples

## Not run: 
##D ## Sliding window of size 5 between take-off point 
##D ## and 3 cycles upstream of the upper asymptote 
##D ## turning point, one standard deviation baseline optimization.
##D m1 <- pcrfit(reps, 1, 2, l4)
##D LRE(m1, wsize = 5, border = c(0, 3), base = 1)
## End(Not run)



