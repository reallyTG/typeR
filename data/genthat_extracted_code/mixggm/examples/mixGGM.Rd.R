library(mixggm)


### Name: mixGGM
### Title: Mixture of Gaussian graphical models
### Aliases: mixGGM print.mixGGM

### ** Examples


# fit a mixture of concentration graph models
data(iris)
mod1 <- mixGGM(iris[,-5], model = "concentration")
plot(mod1, what = "graph")
plot(mod1, what = "classification")


## Not run: 
##D 
##D # a simple simulated data example
##D library(MASS)
##D N <- 200
##D tau <- c(0.3, 0.7)
##D Nk <- rowSums( rmultinom(N, 1, tau) )
##D class <- rep(1:2, Nk)
##D sigma1 <- diag(2)                          # independent variables
##D sigma2 <- matrix( c(1,0.9,0.9,1), 2,2 )    # correlated variables
##D mu1 <- c(0, 0)
##D mu2 <- c(2, 3)
##D x <- rbind( MASS::mvrnorm(Nk[1], mu1, sigma1),
##D             MASS::mvrnorm(Nk[2], mu2, sigma2)
##D )
##D mod2 <- mixGGM(x)
##D plot(mod2)
##D plot(mod2, what = "classification")
##D 
##D # fit a mixture of covariance graph models
##D data(wine, package = "gclus")
##D mod3 <- mixGGM(wine[,-1], K = 1:4, model = "covariance",
##D                penalty = "erdos", beta = 0.01)
##D plot(mod3, what = "graph")
##D plot(mod3, what = "classification", dimens = 1:4)
##D 
##D 
##D # complex simulated data example
##D N <- 500
##D V <- 20
##D tau <- c(0.3, 0.7)
##D Nk <- rowSums( rmultinom(N, 1, tau) )
##D class <- rep(1:2, Nk)
##D sigma1 <- rWishart(1, V+1, diag(V))[,,1]
##D mu1 <- rep(0, V)
##D mu2 <- rnorm(V, 0.5, 2)
##D x1 <- MASS::mvrnorm(Nk[1], mu1, sigma1)
##D x2 <- matrix(NA, Nk[2], V)
##D x2[,1] <- rnorm(Nk[2])
##D for ( j in 2:V ) x2[,j] <- x2[,j-1] + rnorm(Nk[2], mu2[j], sd = 0.5)
##D x <- rbind(x1, x2)
##D #
##D mod4 <- mixGGM(x, K = 1:4, model = "concentration",
##D                penalty = "ebic", beta = 0.5)
##D plot(mod4, what = "classification", dimens = c(1,5,10,15,20) )
##D plot(mod4, what = "graph")
##D plot(mod4, what = "adjacency")
##D table(class, mod4$classification)
##D #
##D mc <- mclust::Mclust(x, G = 1:4)
##D mc$bic
##D mod4$bic
##D 
## End(Not run)




