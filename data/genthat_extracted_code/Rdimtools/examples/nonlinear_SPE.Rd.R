library(Rdimtools)


### Name: do.spe
### Title: Stochastic Proximity Embedding
### Aliases: do.spe

### ** Examples

## generate sample data
X = aux.gensamples()

## compare with mds using 2 distance metrics
outMDS <- do.mds(X, ndim=2)
out1 <- do.spe(X, ndim=2)
out2 <- do.spe(X, ndim=2, proximity=function(x){dist(x, method="manhattan")})

## Visualize
par(mfrow=c(1,3))
plot(outMDS$Y[,1], outMDS$Y[,2], main="MDS")
plot(out1$Y[,1], out1$Y[,2], main="SPE with L2 norm")
plot(out2$Y[,1], out2$Y[,2], main="SPE with L1 norm")




