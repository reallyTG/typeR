library(queueing)


### Name: VNq.o_MMCKK
### Title: Returns the variance of the number of customers in the queue in
###   the M/M/c/K/K queueing model
### Aliases: VNq.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
o_mmckk <- QueueingModel(i_mmckk)

## Returns the variance
VNq(o_mmckk)



