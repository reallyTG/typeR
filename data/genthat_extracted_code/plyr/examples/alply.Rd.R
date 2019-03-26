library(plyr)


### Name: alply
### Title: Split array, apply function, and return results in a list.
### Aliases: alply
### Keywords: manip

### ** Examples

alply(ozone, 3, quantile)
alply(ozone, 3, function(x) table(round(x)))



