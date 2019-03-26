library(timeordered)


### Name: midpoints
### Title: Determines the mean value of each row of a matrix; used as a
###   convenience function for plotting.
### Aliases: midpoints
### Keywords: ~kwd1 ~kwd2

### ** Examples

tl100 <- generatetimelags(0,1500,100)
boxplot(t(midpoints(tl100)))



