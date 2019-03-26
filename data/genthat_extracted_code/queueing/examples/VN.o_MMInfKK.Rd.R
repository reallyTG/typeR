library(queueing)


### Name: VN.o_MMInfKK
### Title: Returns the variance of the number of customers in the
###   M/M/Infinite/K/K queueing model
### Aliases: VN.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the variance
VN(o_MMInfKK)



