library(queueing)


### Name: QueueingModel.i_MMC
### Title: Builds a M/M/c queueing model
### Aliases: QueueingModel.i_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
QueueingModel(i_mmc)




