library(queueing)


### Name: VTq.o_MMC
### Title: Returns the variance of the time spend in queue in the M/M/c
###   queueing model
### Aliases: VTq.o_MMC
### Keywords: M/M/c

### ** Examples


## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Returns the variance of the time spend in queue
VTq(o_mmc)



