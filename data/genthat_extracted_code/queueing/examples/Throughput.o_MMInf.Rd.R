library(queueing)


### Name: Throughput.o_MMInf
### Title: Throughput of a M/M/Infinite queueing model
### Aliases: Throughput.o_MMInf
### Keywords: M/M/Infinite

### ** Examples

## create input parameters
i_mminf <- NewInput.MMInf(lambda=0.25, mu=4, n=0)

## Build the model
o_mminf <- QueueingModel(i_mminf)

## Throughput
Throughput(o_mminf)




