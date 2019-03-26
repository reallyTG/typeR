library(queueing)


### Name: NewInput.OJN
### Title: Define the inputs of an Open Jackson Network
### Aliases: NewInput.OJN NewInput2.OJN NewInput3.OJN
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

ojn1 <- NewInput.OJN(prob, n1, n2, n3, n4)

## Using function NewInput2
## Not run: 
##D   ojn1 <- NewInput2.OJN(prob, list(n1, n2, n3, n4))
## End(Not run)


## Using visit ratios. Values taken from [Lazowska84], pag. 113.

## E[S] cpu = 0.005, Visit cpu = 121, D cpu = E[S] cpu * Visit cpu = 0.605
cpu <- NewInput.MM1(lambda=0.2, mu=1/0.005)

## E[S] disk1 = 0.030, Visit disk1 = 70, D disk1 = E[S] disk1 * Visit disk1 = 2.1
disk1 <- NewInput.MM1(lambda=0.2, mu=1/0.030)

## E[S] disk2 = 0.027, Visit disk2 = 50, D disk2 = E[S] disk2 * Visit disk2 = 1.35
disk2 <- NewInput.MM1(lambda=0.2, mu=1/0.027)

## In this example, to have the throughput per node, the visit ratios has to be given in this form.
## Please, don't use in the closed Jackson Network 
visit <- c(121, 70, 50)
net <- NewInput.OJN(visit, cpu, disk1, disk2)

## Using NewInput3
vLambda <- c(0.2, 0.2, 0.2)
vService <- c(0.005, 0.030, 0.027)
numNodes <- 3
vType <- c("Q", "Q", "Q")
vChannel <- c(1, 1, 1)
net2 <- NewInput3.OJN(vLambda, numNodes, vType, visit, vService, vChannel)




