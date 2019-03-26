library(imageData)


### Name: calcLagged
### Title: Replaces the values in a vector with the result of applying an
###   operation to it and a lagged value
### Aliases: calcLagged
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat$Days.diffs <- calcLagged(longi.dat$xDays, operation ="-")



