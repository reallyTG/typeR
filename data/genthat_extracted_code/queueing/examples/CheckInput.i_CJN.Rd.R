library(queueing)


### Name: CheckInput.i_CJN
### Title: Check the input params of a Closed Jackson Network
### Aliases: CheckInput.i_CJN
### Keywords: Closed Jackson Network

### ** Examples

## See example 11.13 in reference [Sixto2004] for more details.
## create the nodes
n <- 2
n1 <- NewInput.MM1(lambda=0, mu=1/0.2, n=0)
n2 <- NewInput.MM1(lambda=0, mu=1/0.4, n=0)

# think time = 0
z <- 0

# operational value
operational <- FALSE

# definition of the transition probabilities
prob <- matrix(data=c(0.5, 0.5, 0.5, 0.5), nrow=2, ncol=2, byrow=TRUE)

cjn1 <- NewInput.CJN(prob, n, z, operational, 0, 0.001, n1, n2)

CheckInput(cjn1)




