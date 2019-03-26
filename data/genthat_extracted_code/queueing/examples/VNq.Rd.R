library(queueing)


### Name: VNq
### Title: Returns the variance of the number of customers in the queue in
###   a queueing model
### Aliases: VNq
### Keywords: M/M/1

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the variance
VNq(o_mm1)



