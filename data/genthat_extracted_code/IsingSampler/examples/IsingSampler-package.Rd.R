library(IsingSampler)


### Name: IsingSampler-package
### Title: Sampling methods and distribution functions for the Ising model
### Aliases: IsingSampler-package

### ** Examples

## This code compares the different sampling algorithms to the expected
## distribution of states in a tractible number of nodes.

## In the end are examples on how to obtain the distribution.

# Input:
N <- 5 # Number of nodes
nSample <- 5000 # Number of samples

# Ising parameters:
Graph <- matrix(sample(0:1,N^2,TRUE,prob = c(0.7, 0.3)),N,N) * rnorm(N^2)
Graph <- pmax(Graph,t(Graph)) / N
diag(Graph) <- 0
Thresh <- -(rnorm(N)^2)
Beta <- 1

# Response options (0,1 or -1,1):
Resp <- c(0L,1L)

# All posible states:
AllStates <- do.call(expand.grid,lapply(1:N,function(x)Resp))

# Simulate with metropolis:
MetData <- IsingSampler(nSample, Graph, Thresh, Beta, 1000/N, 
  responses = Resp, method = "MH")

# Simulate exact samples (CFTP):
ExData <- IsingSampler(nSample, Graph, Thresh, Beta, 100,
  responses = Resp, method = "CFTP")

# Direct simulation:
DirectData <- IsingSampler(nSample, Graph, Thresh, Beta, method = "direct")

# State distirbutions:
MetDist <- apply(AllStates,1,function(x)sum(colSums(t(MetData) == x)==N))
ExDist <- apply(AllStates,1,function(x)sum(colSums(t(ExData) == x)==N))
DirectDist <- apply(AllStates,1,function(x)sum(colSums(t(DirectData) == x)==N))
ExpDist <- exp(- Beta * apply(AllStates,1,function(s)IsingSampler:::H(Graph,s,Thresh)))  
ExpDist <- ExpDist/sum(ExpDist) * nSample

## Plot to compare distributions:
plot(MetDist, type="l", col="blue", pch=16, xlab="State", ylab="Freq", 
  ylim=c(0,max(MetDist,DirectDist,ExDist)))
points(DirectDist,type="l",col="red",pch=16)
points(ExpDist,type="l",col="green",pch=16)
points(ExDist,type="l",col="purple",pch=16)
legend("topright", col=c("blue","red","purple","green"), 
  legend=c("Metropolis","Direct","Exact","Expected"),lty=1,bty='n')

## Likelihoods:

# Sumscores:
IsingSumLikelihood(Graph, Thresh, Beta, Resp)

# All states:
IsingLikelihood(Graph, Thresh, Beta, Resp)

# Single state:
IsingStateProb(rep(Resp[1],N),Graph, Thresh, Beta, Resp)



