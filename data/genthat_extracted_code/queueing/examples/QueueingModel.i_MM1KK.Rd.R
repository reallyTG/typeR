library(queueing)


### Name: QueueingModel.i_MM1KK
### Title: Builds a M/M/1/K/K queueing model
### Aliases: QueueingModel.i_MM1KK
### Keywords: M/M/1/K/K

### ** Examples

## See example 10.13 in reference [Sixto2004] for more details.
## create input parameters
i_mm1kk <- NewInput.MM1KK(lambda=0.25, mu=4, k=2, method=3)

## Build the model
QueueingModel(i_mm1kk)




