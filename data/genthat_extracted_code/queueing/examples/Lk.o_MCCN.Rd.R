library(queueing)


### Name: Lk.o_MCCN
### Title: Returns a vector with the mean number of customers in each node
###   (server) of a MultiClass Closed Network
### Aliases: Lk.o_MCCN
### Keywords: MultiClass Closed Network

### ** Examples

## See example in pag 142 in reference [Lazowska84] for more details.

classes <- 2
vNumber <- c(1, 1)
vThink <- c(0, 0)
nodes <- 2
vType <- c("Q", "Q")
vVisit <- matrix(data=c(10, 9, 5, 4), nrow=2, ncol=2, byrow=TRUE)
vService <- matrix(data=c(1/10, 1/3, 2/5, 1), nrow=2, ncol=2, byrow=TRUE)

i_MCCN1 <- NewInput.MCCN(classes, vNumber, vThink, nodes, vType, vVisit, vService)

# Build the model
o_MCCN1 <- QueueingModel(i_MCCN1)

Lk(o_MCCN1)




