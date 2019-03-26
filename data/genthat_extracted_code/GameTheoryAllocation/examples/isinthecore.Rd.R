library(GameTheoryAllocation)


### Name: isinthecore
### Title: Isinthecore (core allocations)
### Aliases: isinthecore
### Keywords: core_allocations core

### ** Examples

characteristic_function<-c(0,0.538, 0.761, 1.742, 0.554, 0.137, 0.293, 0.343)
isinthecore(characteristic_function,allocation=c(0.1,0.2,0.043),game="cost")
#[1] "The allocation is not in the core"
#NULL

isinthecore(characteristic_function,allocation=c(0.05,0.206,0.087),game="cost")
#[1] "The allocation is in the core"
#NULL



