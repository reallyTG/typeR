library(Rdimtools)


### Name: do.ldakm
### Title: Combination of LDA and K-means
### Aliases: do.ldakm

### ** Examples

## generate swiss roll data
X = aux.gensamples(n=123)

## try different tolerance level
out1 = do.ldakm(X, abstol=1e-2)
out2 = do.ldakm(X, abstol=1e-3)
out3 = do.ldakm(X, abstol=1e-4)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="LDA-KM::tol=1e-2")
plot(out2$Y[,1], out2$Y[,2], main="LDA-KM::tol=1e-3")
plot(out3$Y[,1], out3$Y[,2], main="LDA-KM::tol=1e-4")




