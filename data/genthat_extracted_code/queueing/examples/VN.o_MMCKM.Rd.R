library(queueing)


### Name: VN.o_MMCKM
### Title: Returns the variance of the number of customers in the M/M/c/K/m
###   queueing model
### Aliases: VN.o_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## Build the model
o_mmckm <- QueueingModel(i_mmckm)

## Returns the variance
VN(o_mmckm)



