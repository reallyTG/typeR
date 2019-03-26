library(compositions)


### Name: as.data.frame
### Title: Convert "compositions" classes to data frames
### Aliases: as.data.frame.acomp as.data.frame.rcomp as.data.frame.aplus
###   as.data.frame.rplus as.data.frame.rmult
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
as.data.frame(acomp(sa.groups))
# The central perpose of providing this command is that the following
# works properly:
data.frame(acomp(sa.groups),groups=sa.groups.area)



