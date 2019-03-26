library(e1071)


### Name: lca
### Title: Latent Class Analysis (LCA)
### Aliases: lca print.lca summary.lca print.summary.lca predict.lca
### Keywords: multivariate cluster

### ** Examples

## Generate a 4-dim. sample with 2 latent classes of 500 data points each.
## The probabilities for the 2 classes are given by type1 and type2.
type1 <- c(0.8,0.8,0.2,0.2)
type2 <- c(0.2,0.2,0.8,0.8)
x <- matrix(runif(4000),nr=1000)
x[1:500,] <- t(t(x[1:500,])<type1)*1
x[501:1000,] <- t(t(x[501:1000,])<type2)*1

l <- lca(x, 2, niter=5)
print(l)
summary(l)
p <- predict(l, x)
table(p, c(rep(1,500),rep(2,500)))



