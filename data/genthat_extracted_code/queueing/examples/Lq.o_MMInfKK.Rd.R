library(queueing)


### Name: Lq.o_MMInfKK
### Title: Returns the mean number of customers in the queue in the
###   M/M/Infinite/K/K queueing model
### Aliases: Lq.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the Lq
Lq(o_MMInfKK)



