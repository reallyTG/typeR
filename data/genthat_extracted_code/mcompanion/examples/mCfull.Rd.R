library(mcompanion)


### Name: mc_full
### Title: Basic utilities for multi-companion matrices
### Aliases: mc_full mc_matrix
### Keywords: mcutil

### ** Examples

mc <- mCompanion("sim",dim=4,mo=2)
mcStable(mc)
x <- mc[1:2,]   # get the  top of mc
x2 <- mc[]      # whole mc as ordinary matrix
mc_matrix(x)
mc_matrix(mc)
mc_matrix(x2)

mc_full(x)
mc_full(mc)
mc_full(x2)



