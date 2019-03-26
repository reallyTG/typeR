library(queueing)


### Name: QueueingModel.i_MM1
### Title: Builds a M/M/1 queueing model
### Aliases: QueueingModel.i_MM1
### Keywords: M/M/1

### ** Examples

## See example 10.3 in reference [Sixto2004] for more details.
## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
QueueingModel(i_mm1)




