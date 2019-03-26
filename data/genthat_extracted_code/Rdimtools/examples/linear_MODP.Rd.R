library(Rdimtools)


### Name: do.modp
### Title: Modified Orthogonal Discriminant Projection
### Aliases: do.modp

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## try different beta (scaling control) parameter
out1 = do.modp(X, label, beta=1)
out2 = do.modp(X, label, beta=10)
out3 = do.modp(X, label, beta=100)

## visualize
par(mfrow=c(1,3))
plot(out1$Y[,1], out1$Y[,2], main="modp::beta=1")
plot(out2$Y[,1], out2$Y[,2], main="modp::beta=10")
plot(out3$Y[,1], out3$Y[,2], main="modp::beta=100")




