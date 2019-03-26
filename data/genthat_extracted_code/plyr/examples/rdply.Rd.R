library(plyr)


### Name: rdply
### Title: Replicate expression and return results in a data frame.
### Aliases: rdply
### Keywords: manip

### ** Examples

rdply(20, mean(runif(100)))
rdply(20, each(mean, var)(runif(100)))
rdply(20, data.frame(x = runif(2)))



