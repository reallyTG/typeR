library(graphon)


### Name: gmodel.block
### Title: Generate binary random graphs based on stochastic blockmodel
### Aliases: gmodel.block

### ** Examples

## set inputs
W = matrix(c(0.9,0.2,0.2,0.7),nr=2)
n = 200

## generate 2 observations without self-loops.
out <- gmodel.block(W,n,rep=2,noloop=TRUE)

## No test: 
## Visualize generated graphs
par(mfrow=c(1,2), pty="s")
image(out$G[[1]]); title("Observation 1")
image(out$G[[2]]); title("Observation 2")
## End(No test)




