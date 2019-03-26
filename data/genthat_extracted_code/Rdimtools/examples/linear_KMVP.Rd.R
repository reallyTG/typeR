library(Rdimtools)


### Name: do.kmvp
### Title: Kernel-Weighted Maximum Variance Projection
### Aliases: do.kmvp

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## perform KMVP with different bandwidths
out1 = do.kmvp(X, label, bandwidth=10)
out2 = do.kmvp(X, label, bandwidth=100)
out3 = do.kmvp(X, label, bandwidth=1000)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="bandwidth=1e+1")
plot(out2$Y[,1], out2$Y[,2], main="bandwidth=1e+2")
plot(out3$Y[,1], out3$Y[,2], main="bandwidth=1e+3")




