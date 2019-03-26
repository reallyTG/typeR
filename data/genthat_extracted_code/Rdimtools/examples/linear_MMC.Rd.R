library(Rdimtools)


### Name: do.mmc
### Title: Maximum Margin Criterion
### Aliases: do.mmc

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## perform MVP with different preprocessings
out1 = do.mmc(X, label, ndim=2)
out2 = do.mmc(X, label, ndim=2, preprocess="decorrelate")

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="centering")
plot(out2$Y[,1], out2$Y[,2], main="decorrelating")




