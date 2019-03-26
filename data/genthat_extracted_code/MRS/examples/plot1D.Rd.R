library(MRS)


### Name: plot1D
### Title: Plot regions of the representative tree in 1D
### Aliases: plot1D

### ** Examples

set.seed(1)
p = 1
n1 = 200
n2 = 200
mu1 = matrix( c(0,10), nrow = 2, byrow = TRUE)
mu2 = mu1; mu2[2] = mu1[2] + .01
sigma = c(1,.1)

Z1 = sample(2, n1, replace=TRUE, prob=c(0.9, 0.1))
Z2 = sample(2, n2, replace=TRUE, prob=c(0.9, 0.1))
X1 = mu1[Z1] + matrix(rnorm(n1*p), ncol=p)*sigma[Z1]
X2 = mu2[Z2] + matrix(rnorm(n2*p), ncol=p)*sigma[Z1]
X = rbind(X1, X2)
G = c(rep(1, n1), rep(2,n2))

ans = mrs(X, G, K=10)
plot1D(ans, type = "prob")
plot1D(ans, type = "eff")



