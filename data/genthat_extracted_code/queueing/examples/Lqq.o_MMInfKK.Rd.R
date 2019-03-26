library(queueing)


### Name: Lqq.o_MMInfKK
### Title: Returns the mean number of customers in queue when there is
###   queue in the M/M/Infinite/K/K queueing model
### Aliases: Lqq.o_MMInfKK
### Keywords: M/M/Infinite/K/K

### ** Examples

## create input parameters
i_MMInfKK <- NewInput.MMInfKK(lambda=0.25, mu=4, k=4)

## Build the model
o_MMInfKK <- QueueingModel(i_MMInfKK)

## Returns the Lqq
Lqq(o_MMInfKK)



