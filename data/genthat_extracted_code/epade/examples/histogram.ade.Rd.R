library(epade)


### Name: histogram.ade
### Title: Histogram
### Aliases: histogram.ade
### Keywords: histogram

### ** Examples

g<-rbinom(1000, 1, 0.5)
x<-rnorm(1000)+g
histogram.ade(x, g, wall=3, breaks=24)
histogram.ade(x, g, wall=2, bars=FALSE)



