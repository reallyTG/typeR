library(lavaSearch2)


### Name: calcType1postSelection
### Title: Compute the Type 1 Error After Selection
### Aliases: calcType1postSelection

### ** Examples

library(mvtnorm)
n <- 350

#### only 2 tests
Sigma <- rbind(c(1,0,0),c(0,1,1),c(0,1,1))
z2 <- qmvnorm(0.95, mean = rep(0,2), sigma = Sigma[1:2,1:2], tail = "both.tails")$quantile

## no selection since strong effect
mu <- c(10,0,0)
calcType1postSelection(0.95, quantile.previous = z2, distribution = "gaussian",
                        mu = mu, Sigma = Sigma, correct = TRUE)

## strong selection
## Not run: 
##D mu <- c(0,0,0)
##D levelC <- calcType1postSelection(0.95, quantile.previous = z2, distribution = "gaussian",
##D                         mu = mu, Sigma = Sigma)
##D print(levelC) # more liberal than without selection
##D calcType1postSelection(levelC, quantile.previous = z2, distribution = "gaussian",
##D                         mu = mu, Sigma = Sigma, correct = FALSE)
## End(Not run)

#### 3 tests
Sigma <- diag(1,5,5)
Sigma[4,2] <- 1
Sigma[2,4] <- 1
Sigma[5,3] <- 1
Sigma[3,5] <- 1

z2 <- qmvnorm(0.95, mean = mu[1:3], sigma = Sigma[1:3,1:3], tails = "both.tails")$quantile

## no selection since strong effect
## Not run: 
##D mu <- c(10,0,0,0,0)
##D calcType1postSelection(0.95, quantile.previous = z2, distribution = "gaussian",
##D                         mu = mu, Sigma = Sigma, correct = TRUE)
##D 
##D ## strong selection
##D mu <- c(0,0,0,0,0)
##D levelC <- calcType1postSelection(0.95, quantile.previous = z2,
##D                         mu = mu, Sigma = Sigma, distribution = "gaussian")
##D calcType1postSelection(levelC, quantile.previous = z2, distribution = "gaussian",
##D                         mu = mu, Sigma = Sigma, correct = FALSE)
## End(Not run)




