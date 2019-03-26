library(mixggm)


### Name: control-parameters
### Title: Set control parameters for various purposes
### Aliases: ctrlICF ctrlSTEP ctrlGA ctrlEM ctrlREG

### ** Examples


## Not run: 
##D 
##D # ga search with increased mutation probability
##D data(banknote, package = "mclust")
##D mod1 <- searchGGM(banknote[,-1], model = "concentration", search = "ga",
##D                   ctrlGa = ctrlGA(pmutation = 0.3))
##D 
##D 
##D # regularization
##D library(MASS)
##D V <- 10
##D N <- 20
##D mu <- rep(0, V)
##D sigma <- matrix(0.9, V,V)
##D diag(sigma) <- 1
##D x <- cbind( MASS::mvrnorm(N, mu, sigma),
##D             MASS::mvrnorm(N, mu, sigma),
##D             MASS::mvrnorm(N, mu, sigma))  # high-dimensional data V = 30, N = 20
##D #
##D hyperPar <- ctrlREG(x, K = 1, scaleType = "diag")
##D mod2 <- searchGGM(x, model = "covariance", penalty = "ebic")   # throws an error
##D mod2 <- searchGGM(x, model = "covariance", penalty = "ebic",   # regularization
##D                   regularize = TRUE, regHyperPar = hyperPar)
##D plot(mod2, "adjacency")
##D 
##D 
##D # occam's window
##D library(MASS)
##D V <- 20
##D N <- 500
##D mu <- rep(0, V)
##D sigma <- matrix(0.9, V,V)
##D diag(sigma) <- 1
##D edges <- rbinom(choose(V,2), 1, 0.3)
##D A <- matrix(0, V,V)
##D A[lower.tri(A)] <- edges
##D A <- A + t(A)
##D fit <- fitGGM(S = sigma, N = N, graph = A, model = "concentration",
##D               ctrlIcf = ctrlICF(tol = 1e-06))
##D sigma <- fit$sigma
##D #
##D x <- MASS:::mvrnorm(N, mu, sigma)
##D #
##D mod3 <- searchGGM(x, model = "concentration", search = "step-back",
##D                   ctrlStep = ctrlSTEP(occamAdd = 5, occamRem = 5))
##D par(mfrow = c(1,2))
##D plot(fit, what = "adjacency")
##D plot(mod3, what = "adjacency")
##D 
## End(Not run)




