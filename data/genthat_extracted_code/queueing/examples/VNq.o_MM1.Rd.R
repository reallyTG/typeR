library(queueing)


### Name: VNq.o_MM1
### Title: Returns the variance of the number of customers in the queue in
###   the M/M/1 queueing model
### Aliases: VNq.o_MM1
### Keywords: M/M/1

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Returns the variance
VNq(o_mm1)



