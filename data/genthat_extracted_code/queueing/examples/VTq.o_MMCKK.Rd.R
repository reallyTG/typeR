library(queueing)


### Name: VTq.o_MMCKK
### Title: Returns the variance of the time spend in queue in the M/M/c/K/K
###   queueing model
### Aliases: VTq.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## Build the model
o_mmckk <- QueueingModel(i_mmckk)

## Returns the variance
VTq(o_mmckk)



