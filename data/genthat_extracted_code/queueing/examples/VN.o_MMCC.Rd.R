library(queueing)


### Name: VN.o_MMCC
### Title: Returns the variance of the number of customers in the M/M/c/c
###   queueing model
### Aliases: VN.o_MMCC
### Keywords: M/M/c/c

### ** Examples


## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
o_mmcc <- QueueingModel(i_mmcc)

## Returns the variance
VN(o_mmcc)



