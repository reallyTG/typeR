library(binaryGP)


### Name: summary.binaryGP
### Title: Summary of Fitting a Binary Gaussian Process
### Aliases: summary.binaryGP

### ** Examples


library(binaryGP)

#####      Testing function: cos(x1 + x2) * exp(x1*x2) with TT sequences      #####
#####   Thanks to Sonja Surjanovic and Derek Bingham, Simon Fraser University #####
test_function <- function(X, TT)
{
  x1 <- X[,1]
  x2 <- X[,2]

  eta_1 <- cos(x1 + x2) * exp(x1*x2)

  p_1 <- exp(eta_1)/(1+exp(eta_1))
  y_1 <- rep(NA, length(p_1))
  for(i in 1:length(p_1)) y_1[i] <- rbinom(1,1,p_1[i])
  Y <- y_1
  P <- p_1
  if(TT > 1){
    for(tt in 2:TT){
      eta_2 <- 0.3 * y_1 + eta_1
      p_2 <- exp(eta_2)/(1+exp(eta_2))
      y_2 <- rep(NA, length(p_2))
      for(i in 1:length(p_2)) y_2[i] <- rbinom(1,1,p_2[i])
      Y <- cbind(Y, y_2)
      P <- cbind(P, p_2)
      y_1 <- y_2
    }
  }

  return(list(Y = Y, P = P))
}

set.seed(1)
n <- 30
n.test <- 10
d <- 2
X <- matrix(runif(d * n), ncol = d)

##### without time-series #####
Y <- test_function(X, 1)$Y  ## Y is a vector

binaryGP.model <- binaryGP_fit(X = X, Y = Y)
print(binaryGP.model)   # print estimation results
summary(binaryGP.model) # significance results
## No test: 
##### with time-series, lag 1 #####
Y <- test_function(X, 10)$Y  ## Y is a matrix with 10 columns

binaryGP.model <- binaryGP_fit(X = X, Y = Y, R = 1)
print(binaryGP.model)   # print estimation results
summary(binaryGP.model) # significance results
## End(No test)



