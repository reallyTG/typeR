library(fastmatch)


### Name: ctapply
### Title: Fast tapply() replacement functions
### Aliases: ctapply
### Keywords: manip

### ** Examples

i = rnorm(4e6)
names(i) = as.integer(rnorm(1e6))
i = i[order(names(i))]
system.time(tapply(i, names(i), sum))
system.time(ctapply(i, names(i), sum))



