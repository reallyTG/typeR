library(queueing)


### Name: Lq.o_MMC
### Title: Returns the mean number of customers in the queue in the M/M/c
###   queueing model
### Aliases: Lq.o_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Returns the Lq
Lq(o_mmc)



