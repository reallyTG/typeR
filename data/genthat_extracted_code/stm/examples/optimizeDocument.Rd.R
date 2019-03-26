library(stm)


### Name: optimizeDocument
### Title: Optimize Document
### Aliases: optimizeDocument

### ** Examples

# fitting to a nonsense word distribution
V <- length(poliblog5k.voc)
K <- 50
beta <- matrix(rgamma(V*K,shape = .1), nrow=K, ncol=V)
beta <- beta/rowSums(beta)
doc <- poliblog5k.docs[[1]]
mu <- rep(0, K-1)
sigma <- diag(1000, nrow=K-1)
optimizeDocument(doc, eta=rep(0, K-1), mu=mu, beta=beta, sigma=sigma)



