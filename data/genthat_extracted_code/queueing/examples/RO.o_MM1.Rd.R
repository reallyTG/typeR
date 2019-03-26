library(queueing)


### Name: RO.o_MM1
### Title: Reports the server use of a M/M/1 queueing model
### Aliases: RO.o_MM1
### Keywords: M/M/1

### ** Examples

## See example 10.3 in reference [Sixto2004] for more details.
## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
o_mm1 <- QueueingModel(i_mm1)

## Report the use of the server
RO(o_mm1)



