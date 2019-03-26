library(mdpeer)


### Name: vrPEER
### Title: Graph-constrained regression with variable-reduction procedure
###   to handle the non-invertibility of a graph-originated penalty matrix
### Aliases: vrPEER

### ** Examples

set.seed(1234)
n <- 200
p1 <- 10
p2 <- 90
p <- p1 + p2
# Define graph adjacency matrix
A <- matrix(rep(0, p*p), nrow = p, ncol = p)
A[1:p1, 1:p1] <- 1
A[(p1+1):p, (p1+1):p] <- 1
L <- Adj2Lap(A)
# Define Q penalty matrix as graph Laplacian matrix normalized)
Q <- L2L.normalized(L)
# Define Z,X design matrices and aoutcome y
Z <- matrix(rnorm(n*p), nrow = n, ncol = p)
b.true <- c(rep(1, p1), rep(0, p2))
X <- matrix(rnorm(n*3), nrow = n, ncol = 3)
beta.true <- runif(3)
intercept <- 0
eta <- intercept + Z %*% b.true + X %*% beta.true
R2 <- 0.5
sd.eps <- sqrt(var(eta) * (1 - R2) / R2)
error <- rnorm(n, sd = sd.eps)
y <- eta + error

## Not run: 
##D # run vrPEER 
##D vrPEER.out <- vrPEER(Q, y, Z, X)
##D plt.df <- data.frame(x = 1:p, 
##D                      y = vrPEER.out$b.est)
##D ggplot(plt.df, aes(x = x, y = y, group = 1)) + geom_line()
## End(Not run)

## Not run: 
##D # run vrPEER with 0.95 confidence intrvals 
##D vrPEER.out <- vrPEER(Q, y, Z, X, compute.boot.CI = TRUE, boot.R = 500)
##D plt.df <- data.frame(x = 1:p, 
##D                      y = vrPEER.out$b.est, 
##D                      lo = vrPEER.out$boot.CI[,1], 
##D                      up =  vrPEER.out$boot.CI[,2])
##D ggplot(plt.df, aes(x = x, y = y, group = 1)) + geom_line() +  
##D   geom_ribbon(aes(ymin=lo, ymax=up), alpha = 0.3)
## End(Not run)




