library(circular)


### Name: median.circular
### Title: Median Direction
### Aliases: median.circular
### Keywords: univar

### ** Examples

# Compute the median direction of a random sample of observations.
x <- circular(runif(50, circular(0), pi))
median(x) #only the median is returned
meandeviation(x) #mean deviation is reported



