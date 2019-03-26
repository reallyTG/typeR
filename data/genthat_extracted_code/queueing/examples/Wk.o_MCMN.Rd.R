library(queueing)


### Name: Wk.o_MCMN
### Title: Returns a matrix with the mean time spend in each node (server)
###   of a MultiClass Mixed Network
### Aliases: Wk.o_MCMN
### Keywords: MultiClass Mixed Network

### ** Examples

## See example in pag 147 in reference [Lazowska84] for more details.

classes <- 4
vLambda <- c(1, 1/2)
vNumber <- c(1, 1)
vThink <- c(0, 0)
nodes <- 2
vType <- c("Q", "Q")
vVisit <- matrix(data=1, nrow=4, ncol=2)
vService <- matrix(data=c(1/4, 1/2, 1/2, 1, 1/6, 1, 1, 4/3), nrow=4, ncol=2)

i_mcmn1 <- NewInput.MCMN(classes, vLambda, vNumber, vThink, nodes, vType, vVisit, vService)

# Build the model
o_mcmn1 <- QueueingModel(i_mcmn1)

Wk(o_mcmn1)




