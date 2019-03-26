library(queueing)


### Name: Wq.o_MM1
### Title: Returns the mean time spend in queue in the M/M/1 queueing model
### Aliases: Wq.o_MM1
### Keywords: M/M/1

### ** Examples

## See example 10.3 in reference [Sixto2004] for more details.
## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the Wq
Wq(o_mm1)



