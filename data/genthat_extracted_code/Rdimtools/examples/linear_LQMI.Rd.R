library(Rdimtools)


### Name: do.lqmi
### Title: Linear Quadratic Mutual Information
### Aliases: do.lqmi

### ** Examples

## generate 3 different groups of data X and label vector
x1 = matrix(rnorm(4*10), nrow=10)-20
x2 = matrix(rnorm(4*10), nrow=10)
x3 = matrix(rnorm(4*10), nrow=10)+20
X  = rbind(x1, x2, x3)
label = c(rep(1,10), rep(2,10), rep(3,10))

## compare against LDA
out1 = do.lda(X, label)
out2 = do.lqmi(X, label)

## visualize
par(mfrow=c(1,2))
plot(out1$Y[,1], out1$Y[,2], main="LDA projection")
plot(out2$Y[,1], out2$Y[,2], main="LQMI projection")




