library(emhawkes)


### Name: hsim
### Title: Simulate a multivariate Hawkes process. Generic function hsim.
### Aliases: hsim hsim,hspec-method

### ** Examples

mu <- c(0.1, 0.1)
alpha <- matrix(c(0.2, 0.1, 0.1, 0.2), nrow=2, byrow=TRUE)
beta <- matrix(c(0.9, 0.9, 0.9, 0.9), nrow=2, byrow=TRUE)
h <- new("hspec", mu=mu, alpha=alpha, beta=beta)
res <- hsim(h, size=100)




