library(queueing)


### Name: NewInput.CJN
### Title: Define the inputs of a Closed Jackson Network
### Aliases: NewInput.CJN NewInput2.CJN NewInput3.CJN
### Keywords: Closed Jackson Network

### ** Examples

## See example 11.13 in reference [Sixto2004] for more details.
## create the nodes
n <- 2
n1 <- NewInput.MM1(lambda=0, mu=1/0.2, n=0)
n2 <- NewInput.MM1(lambda=0, mu=1/0.4, n=0)

## think time = 0
z <- 0

## operational value
operational <- FALSE

## definition of the transition probabilities
prob <- matrix(data=c(0.5, 0.5, 0.5, 0.5), nrow=2, ncol=2, byrow=TRUE)

cjn1 <- NewInput.CJN(prob, n, z, operational, 0, 0.001, n1, n2)

## Not run: 
##D   cjn1 <- NewInput2.CJN(prob, n, z, operational, 0, 0.001, list(n1, n2))
## End(Not run)


## using visit ratios and service demands. See [Lazowska84] pag 117.
## E[S] cpu = 0.005, Visit cpu = 121, D cpu = E[S] cpu * Visit cpu = 0.605
cpu <- NewInput.MM1(mu=1/0.005)

## E[S] disk1 = 0.030, Visit disk1 = 70, D disk1 = E[S] disk1 * Visit disk1 = 2.1
disk1 <- NewInput.MM1(mu=1/0.030)

## E[S] disk2 = 0.027, Visit disk2 = 50, D disk2 = E[S] disk2 * Visit disk2 = 1.35
disk2 <- NewInput.MM1(mu=1/0.027)

## The visit ratios.
vVisit <- c(121, 70, 50)

operational <- TRUE

net <- NewInput.CJN(prob=vVisit, n=3, z=15, operational, 0, 0.001, cpu, disk1, disk2)

## Using the operational creation function
n <- 3
think <- 15
numNodes <- 3
vType <- c("Q", "Q", "Q")
vService <- c(0.005, 0.030, 0.027)
vChannel <- c(1, 1, 1)

net2 <- NewInput3.CJN(n, think, numNodes, vType, vVisit, vService, vChannel, method=0, tol=0.001)




