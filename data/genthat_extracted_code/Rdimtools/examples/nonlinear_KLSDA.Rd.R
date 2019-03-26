library(Rdimtools)


### Name: do.klsda
### Title: Kernel Locality Sensitive Discriminant Analysis
### Aliases: do.klsda

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-50
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+50
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## try different kernel bandwidths
out1 = do.klsda(X, label, k1=10, k2=10, t=1)
out2 = do.klsda(X, label, k1=10, k2=10, t=5)
out3 = do.klsda(X, label, k1=10, k2=10, t=10)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="bandwidth=1")
plot(out2$Y[,1], out2$Y[,2], main="bandwidth=15")
plot(out3$Y[,1], out3$Y[,2], main="bandwidth=10")




