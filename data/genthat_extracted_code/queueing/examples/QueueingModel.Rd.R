library(queueing)


### Name: QueueingModel
### Title: Generic S3 method to build a queueing model (or network)
### Aliases: QueueingModel
### Keywords: Queueing Models

### ** Examples

## create input parameters
i_mm1 <- NewInput.MM1(lambda=1/4, mu=1/3, n=0)

## Build the model
QueueingModel(i_mm1)




