library(queueing)


### Name: Lqq.o_MMC
### Title: Returns the mean number of customers in queue when there is
###   queue in the M/M/c queueing model
### Aliases: Lqq.o_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Returns the Lqq
Lqq(o_mmc)



