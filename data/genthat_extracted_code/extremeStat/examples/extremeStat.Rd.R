library(extremeStat)


### Name: extremeStat
### Title: Extreme value statistics on a linear scale
### Aliases: extremeStat extremeStat-package
### Keywords: documentation package

### ** Examples

data(annMax) # annual discharge maxima from a stream in Austria
plot(annMax, type="l")
dle <- distLextreme(annMax)
dle$returnlev




