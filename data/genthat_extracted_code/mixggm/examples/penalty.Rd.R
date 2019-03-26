library(mixggm)


### Name: penalty
### Title: Penalty functions for graph structure search
### Aliases: penalty

### ** Examples


# fit concentration graph model with power law penalty
data(ability.cov)
N <- ability.cov$n.obs
mod1 <- searchGGM(S = ability.cov$cov, N = ability.cov$n.obs,
                  model = "concentration", penalty = "power", beta = 2*log(N))
mod1
plot(mod1)


## Not run: 
##D 
##D # two disconnected blocks of correlated variables
##D library(MASS)
##D V <- 10
##D N <- 500
##D mu <- rep(0, V)
##D sigma <- matrix(0.9, V,V)
##D diag(sigma) <- 1
##D x <- cbind( MASS::mvrnorm(N, mu, sigma),
##D             MASS::mvrnorm(N, mu, sigma) )
##D #
##D # fit a covariance graph with erdos penalty
##D mod2 <- searchGGM(x, model = "covariance",
##D                   penalty = "erdos")
##D plot(mod2, "adjacency")
##D 
##D 
##D # user defined penalty function
##D data(iris)
##D x <- iris[,-5]
##D N <- nrow(x)
##D V <- ncol(x)
##D ref <- matrix(0, V, V)
##D #
##D # penalize graphs different from a reference graph structure
##D myPenalty <- function(graph, beta)
##D {
##D   beta * sum( abs(graph - ref) )
##D }
##D #
##D mod3 <- mixGGM(x, K = 3, model = "covariance",
##D               penalty = myPenalty, beta = 2*V*log(N))
##D plot(mod3)
##D 
## End(Not run)




