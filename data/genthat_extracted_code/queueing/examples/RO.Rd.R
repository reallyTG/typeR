library(queueing)


### Name: RO
### Title: Reports the server use of a queueing model
### Aliases: RO
### Keywords: Queueing Models

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Report the use of the server
RO(o_mm1)



