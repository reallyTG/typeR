library(Rdimtools)


### Name: do.lsda
### Title: Locality Sensitive Discriminant Analysis
### Aliases: do.lsda

### ** Examples

## create a data matrix with clear difference
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## try different affinity matrices
out1 = do.lsda(X, label, k1=2, k2=2)
out2 = do.lsda(X, label, k1=5, k2=5)
out3 = do.lsda(X, label, k1=10, k2=10)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="nbd size 2")
plot(out2$Y[,1], out2$Y[,2], main="nbd size 5")
plot(out3$Y[,1], out3$Y[,2], main="nbd size 10")




