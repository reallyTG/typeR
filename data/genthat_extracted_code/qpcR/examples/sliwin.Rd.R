library(qpcR)


### Name: sliwin
### Title: Calculation of qPCR efficiency by the 'window-of-linearity'
###   method
### Aliases: sliwin
### Keywords: models nonlinear

### ** Examples

## Sliding window of size 5 between 
## take-off point and upper asymptote, 
## no baseline optimization.
m1 <- pcrfit(reps, 1, 2, l4)
sliwin(m1, wsize = 5)

## Not run: 
##D ## Optimizing with window sizes of 4 to 6,
##D ## between 0/+2 from lower/upper border, 
##D ## and baseline up to 2 standard deviations.
##D sliwin(m1, wsize = 4:6, border = c(0, 2), base = 2)
## End(Not run)



