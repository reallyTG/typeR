library(dga)


### Name: bma.cr
### Title: Bayesiam Model Averaging for Capture-Recapture
### Aliases: bma.cr
### Keywords: capture-recapture multiple systems estimation BMA

### ** Examples

#### 5 list example from M & Y ##########
delta <- .5
Y = c(0,27,37,19,4,4,1,1,97,22,37,25,2,1,3,5,83,36,34,18,3,5,0,2,30,5,23,8,0,3,0,2)
Y <- array(Y, dim=c(2,2,2,2,2))
Nmissing <- 1:300
N <- Nmissing + sum(Y)
data(graphs5)
weights <- bma.cr(Y,  Nmissing, delta, graphs5	)
plotPosteriorN(weights, N)
 
##### 3 list example from M & Y #######
Y <- c(0, 60, 49, 4, 247, 112, 142, 12)
Y <- array(Y, dim=c(2,2,2))

delta <- 1
a <- 13.14
b <- 55.17


Nmissing <- 1:300
N <- Nmissing + sum(Y)

logprior <- N*log(b) - (N + a)*log(1 + b)  + lgamma(N + a) - lgamma(N + 1) - lgamma(a)

data(graphs3)
weights <- bma.cr(Y,  Nmissing, delta, graphs3, logprior)
plotPosteriorN(weights, N)




