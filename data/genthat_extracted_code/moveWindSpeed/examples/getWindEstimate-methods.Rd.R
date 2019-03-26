library(moveWindSpeed)


### Name: getWindEstimate
### Title: Estimate wind speed from a sample of ground speeds
### Aliases: getWindEstimate getWindEstimate,matrix,numeric-method
###   getWindEstimate,matrix,numeric,ANY-method

### ** Examples

s<-seq(0,2*pi, .1)
set.seed(34)
getWindEstimate(cbind(4*cos(s)+3+rnorm(length(s)), 4*sin(s)+2+rnorm(length(s))),0)
getWindEstimate(cbind(4*cos(s)+3+rnorm(length(s),sd=.2), 4*sin(s)+2+rnorm(length(s),sd=.2)),0)



