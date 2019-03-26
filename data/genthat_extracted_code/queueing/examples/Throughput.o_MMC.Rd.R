library(queueing)


### Name: Throughput.o_MMC
### Title: Throughput of a M/M/c queueing model
### Aliases: Throughput.o_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Throughput
Throughput(o_mmc)




