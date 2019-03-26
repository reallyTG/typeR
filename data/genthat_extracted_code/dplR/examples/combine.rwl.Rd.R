library(dplR)


### Name: combine.rwl
### Title: Combine Tree-Ring Data Sets
### Aliases: combine.rwl
### Keywords: manip

### ** Examples
library(utils)
data(ca533)
data(co021)
combi1 <- combine.rwl(list(ca533, co021))
## or alternatively for data.frames to combine
combi2 <- combine.rwl(ca533, co021)
identical(combi1, combi2) # TRUE



