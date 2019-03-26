library(queueing)


### Name: Throughput.o_MMCC
### Title: Throughput of a M/M/c/c queueing model
### Aliases: Throughput.o_MMCC
### Keywords: M/M/c/c

### ** Examples

## See example 10.12 in reference [Sixto2004] for more details.
## create input parameters
i_mmcc <- NewInput.MMCC(lambda=3, mu=0.25, c=15)

## Build the model
o_mmcc <- QueueingModel(i_mmcc)

## Throughput
Throughput(o_mmcc)




