library(Rdimtools)


### Name: do.pflpp
### Title: Parameter-Free Locality Preserving Projection
### Aliases: do.pflpp

### ** Examples

## generate swiss roll data
X = aux.gensamples(n=200)

## compare with PCA
out1 = do.pca(X, ndim=2)
out2 = do.pflpp(X, ndim=2)

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="PCA")
plot(out2$Y[,1], out2$Y[,2], main="Parameter-Free LPP")




