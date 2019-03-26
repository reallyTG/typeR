library(queueing)


### Name: Throughputck.o_MCON
### Title: Reports a matrix with the throughput of class i in each node
###   (server) j in a MultiClass Open Network
### Aliases: Throughputck.o_MCON
### Keywords: MultiClass Open Network

### ** Examples

## See example in pag 138 in reference [Lazowska84] for more details.

classes <- 2
vLambda <- c(3/19, 2/19)
nodes <- 2
vType <- c("Q", "Q")
vVisit <- matrix(data=c(10, 9, 5, 4), nrow=2, ncol=2, byrow=TRUE)
vService <- matrix(data=c(1/10, 1/3, 2/5, 1), nrow=2, ncol=2, byrow=TRUE)

i_mcon1 <- NewInput.MCON(classes, vLambda, nodes, vType, vVisit, vService)

# Build the model
o_mcon1 <- QueueingModel(i_mcon1)

Throughputck(o_mcon1)




