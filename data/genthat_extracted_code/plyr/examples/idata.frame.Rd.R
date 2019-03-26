library(plyr)


### Name: idata.frame
### Title: Construct an immutable data frame.
### Aliases: idata.frame
### Keywords: manip

### ** Examples

system.time(dlply(baseball, "id", nrow))
system.time(dlply(idata.frame(baseball), "id", nrow))



