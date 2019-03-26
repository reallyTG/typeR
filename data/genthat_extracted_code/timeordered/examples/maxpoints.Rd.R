library(timeordered)


### Name: maxpoints
### Title: Determines the maximum value of each row of a matrix; used as a
###   convenience function for plotting.
### Aliases: maxpoints
### Keywords: ~kwd1 ~kwd2

### ** Examples

tl100 <- generatetimelags(0,1500,100)
boxplot(t(maxpoints(tl100)))



