library(Rdimtools)


### Name: do.lfda
### Title: Local Fisher Discriminant Analysis
### Aliases: do.lfda

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## try different affinity matrices
out1 = do.lfda(X, label)
out2 = do.lfda(X, label, localscaling=FALSE)

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="binary affinity matrix")
plot(out2$Y[,1], out2$Y[,2], main="local scaling affinity")




