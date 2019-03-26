library(baytrends)


### Name: sort.lcens
### Title: Sorting Vectors
### Aliases: sort.lcens sort.mcens sort.mcens
### Keywords: internal manip

### ** Examples

set.seed(5422)
XR <- rnorm(10)
sort(as.lcens(XR, rep(c(0, -1), each=5))) # censors at 0 and -1




