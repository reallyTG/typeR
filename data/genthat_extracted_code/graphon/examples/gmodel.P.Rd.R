library(graphon)


### Name: gmodel.P
### Title: Generate graphs given a probability matrix
### Aliases: gmodel.P

### ** Examples

## set inputs
modelP <- matrix(runif(16),nrow=4)

## generate 3 observations without self-loops.
out <- gmodel.P(modelP,rep=3,noloop=TRUE)

## Visualize generated graphs
par(mfrow=c(1,3))
image(out[[1]])
image(out[[2]])
image(out[[3]])




