library(queueing)


### Name: Throughput.o_MMCKK
### Title: Throughput of a M/M/c/K/K queueing model
### Aliases: Throughput.o_MMCKK
### Keywords: M/M/c/K/K

### ** Examples

## create input parameters
i_mmckk <- NewInput.MMCKK(lambda=8, mu=2, c=5, k=12, method=0)

## build the model
o_mmckk <- QueueingModel(i_mmckk)

## Throughput
Throughput(o_mmckk)




