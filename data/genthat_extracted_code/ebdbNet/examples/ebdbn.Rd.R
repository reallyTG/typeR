library(ebdbNet)


### Name: ebdbn
### Title: Empirical Bayes Dynamic Bayesian Network (EBDBN) Estimation
### Aliases: ebdbn
### Keywords: methods models

### ** Examples

library(ebdbNet)
tmp <- runif(1) ## Initialize random number generator
set.seed(125214) ## Save seed

## Simulate data
R <- 5
T <- 10
P <- 10
simData <- simulateVAR(R, T, P, v = rep(10, P), perc = 0.10)
Dtrue <- simData$Dtrue
y <- simData$y

## Simulate 8 inputs
u <- vector("list", R)
M <- 8
for(r in 1:R) {
	u[[r]] <- matrix(rnorm(M*T), nrow = M, ncol = T)
}

####################################################
## Run EB-DBN without hidden states
####################################################
## Choose alternative value of K using hankel if hidden states are to be estimated
## K <- hankel(y)$dim

## Run algorithm	
net <- ebdbn(y = y, K = 0, input = u, conv.1 = 0.15, conv.2 = 0.10, conv.3 = 0.10,
	verbose = TRUE)

## Visualize results
## Note: no edges here, which is unsurprising as inputs were randomly simulated
## (in input networks, edges only go from inputs to genes)
## plot(net, sig.level = 0.95)




