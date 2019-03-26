library(TropFishR)


### Name: gillnetfit
### Title: Millar's original gillnet selectivity fitting function
### Aliases: gillnetfit

### ** Examples

data(gillnet)

dat <- matrix(c(gillnet$midLengths, gillnet$CatchPerNet_mat),
         byrow = FALSE, ncol=(dim(gillnet$CatchPerNet_mat)[2]+1))

gillnetfit(data = dat, meshsizes = gillnet$meshSizes)





