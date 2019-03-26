library(queueing)


### Name: Inputs.o_OJN
### Title: Returns the input params of an Open Jackson Network
### Aliases: Inputs.o_OJN
### Keywords: Open Jackson Network

### ** Examples

## See example 11.11 in reference [Sixto2004] for more details.
## create the nodes
n1 <- NewInput.MM1(lambda=8, mu=14, n=0)
n2 <- NewInput.MM1(lambda=0, mu=9, n=0)
n3 <- NewInput.MM1(lambda=6, mu=17, n=0)
n4 <- NewInput.MM1(lambda=0, mu=7, n=0)
m  <- c(0, 0.2, 0.56, 0.24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

# definition of the transition probabilities
prob <- matrix(data=m, nrow=4, ncol=4, byrow=TRUE)

i_ojn1 <- NewInput.OJN(prob, n1, n2, n3, n4)

# Build the model
o_ojn1 <- QueueingModel(i_ojn1)

Inputs(o_ojn1)




