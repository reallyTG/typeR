library(queueing)


### Name: VNq.o_MMC
### Title: Returns the variance of the number of customers in the queue in
###   the M/M/c queueing model
### Aliases: VNq.o_MMC
### Keywords: M/M/c

### ** Examples


## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Returns the variance
VNq(o_mmc)



