library(dplR)


### Name: pointer
### Title: Calculates Pointer Years from a Group of Ring-Width Series
### Aliases: pointer

### ** Examples
## Pointer years calculation on ring-width series. Returns a data.frame.
library(utils)
data(gp.rwl)
py <- pointer(rwl=gp.rwl, rgv.thresh=10, nseries.thresh=75,
              round.decimals=2)
tail(py)



