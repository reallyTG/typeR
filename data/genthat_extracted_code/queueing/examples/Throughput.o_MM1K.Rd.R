library(queueing)


### Name: Throughput.o_MM1K
### Title: Throughput of a M/M/1/K queueing model
### Aliases: Throughput.o_MM1K
### Keywords: M/M/1/K

### ** Examples

## See example 10.7 in reference [Sixto2004] for more details.
## create input parameters
i_mm1k <- NewInput.MM1K(lambda=5, mu=5.714, k=15)

## Build the model
o_mmck <- QueueingModel(i_mm1k)

## Throughput
Throughput(o_mmck)




