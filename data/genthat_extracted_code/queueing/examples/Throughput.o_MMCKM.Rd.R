library(queueing)


### Name: Throughput.o_MMCKM
### Title: Throughput of a M/M/c/K/m queueing model
### Aliases: Throughput.o_MMCKM
### Keywords: M/M/c/K/m

### ** Examples

## create input parameters
i_mmckm <- NewInput.MMCKM(lambda=0.25, mu=4, c=2, k=4, m=8, method=0)

## Build the model
o_mmckm <- QueueingModel(i_mmckm)

## Throughput
Throughput(o_mmckm)




