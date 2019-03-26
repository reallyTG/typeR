library(Rdimtools)


### Name: do.lpmip
### Title: Locality-Preserved Maximum Information Projection
### Aliases: do.lpmip

### ** Examples

## generate default dataset
X <- aux.gensamples(n=123)

## try different neighborhood size
out1 <- do.lpmip(X, ndim=2, type=c("proportion",0.01))
out2 <- do.lpmip(X, ndim=2, type=c("proportion",0.1))
out3 <- do.lpmip(X, ndim=2, type=c("proportion",0.25))

## Visualize
par(mfrow=c(1,3))
plot(out1$Y[,1],out1$Y[,2],main="1% connected")
plot(out2$Y[,1],out2$Y[,2],main="10% connected")
plot(out3$Y[,1],out3$Y[,2],main="25% connected")




