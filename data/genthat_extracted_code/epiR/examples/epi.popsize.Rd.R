library(epiR)


### Name: epi.popsize
### Title: Estimate population size
### Aliases: epi.popsize
### Keywords: univar univar

### ** Examples

## In a field survey 400 feral pigs are captured, marked and then released.
## On a second occassion 40 of the orignal capture are found when another 400    
## pigs are captured. Estimate the size of this feral pig population. Estimate     
## the number of feral pigs that have not been tested.

epi.popsize(T1 = 400, T2 = 400, T12 = 40, conf.level = 0.95, verbose = FALSE)

## Estimated population size: 4000 (95% CI 3125 - 5557)
## Estimated number of untested pigs: 3240 (95% CI 2365 - 4797) 




