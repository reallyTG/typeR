library(queueing)


### Name: Throughput.o_MMInfKK
### Title: Throughput of a M/M/Infinite/K/K queueing model
### Aliases: Throughput.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Throughput
Throughput(o_MMInfKK)




