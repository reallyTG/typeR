library(queueing)


### Name: Lqq
### Title: Returns the mean number of customers in queue when there is
###   queue in a queueing model
### Aliases: Lqq
### Keywords: M/M/1

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the Lqq
Lqq(o_mm1)



