library(queueing)


### Name: NewInput.MCMN
### Title: Define the inputs of a MultiClass Mixed Network
### Aliases: NewInput.MCMN
### Keywords: MultiClass Mixed Network

### ** Examples

## See example in pag 147 in reference [Lazowska84] for more details.

classes <- 4 # A and B are open classes and C and D are closed classes.
vLambda <- c(1, 1/2)
vNumber <- c(1, 1)
vThink <- c(0, 0)
nodes <- 2
vType <- c("Q", "Q")

# When the visit ratios and vService are set,
#   be sure that the open classes are in the first positions
#   and the closed classes after the open classes.
vVisit <- matrix(data=1, nrow=4, ncol=2)

# A and B are open clasess:
#   with demand service of 1/4 and 1/2 at the node 1 and 1/2 and 1 at the node 2
# C and D are open clasess:
#   with demand service of 1/4 and 1/2 at the node 1 and 1/2 and 1 at the node 2 
vService <- matrix(data=c(1/4, 1/2, 1/2, 1, 1/6, 1, 1, 4/3), nrow=4, ncol=2)

i_mcmn1 <- NewInput.MCMN(classes, vLambda, vNumber, vThink, nodes, vType, vVisit, vService)




