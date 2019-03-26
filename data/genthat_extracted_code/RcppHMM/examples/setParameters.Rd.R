library(RcppHMM)


### Name: setParameters
### Title: Set the model parameters
### Aliases: setParameters
### Keywords: methods

### ** Examples

## Values for a hidden Markov model with categorical observations

set.seed(1000)
newModel <- initHMM(2,4)

A <- matrix(c(0.378286,0.621714,
              0.830970,0.169030),
            nrow = 2,
            byrow = TRUE)

B <- matrix(c(0.1930795, 0.2753869, 0.3463100, 0.1852237,
              0.2871577, 0.1848870, 0.1614925, 0.3664628),
            nrow = 2,
            byrow = TRUE)

Pi <- c(0.4757797, 0.5242203)

newModel <- setParameters(newModel,
                          list( "A" = A,
                                "B" = B,
                                "Pi" = Pi) )

## Values for a hidden Markov model with discrete observations

set.seed(1000)
n <- 3
newModel <- initPHMM(n) 

A <- matrix(c(0.5, 0.3,0.2,
              0.2, 0.6, 0.2,
              0.1, 0.3, 0.6),
            ncol=n, byrow=TRUE)

B <- c(2600,  # First distribution with mean 2600
       2700,  # Second distribution with mean 2700
       2800)  # Third distribution with mean 2800

Pi <- rep(1/n , n)


newModel <- setParameters(newModel,
                          list( "A" = A,
                                "B" = B,
                                "Pi" = Pi) )

## Values for a hidden Markov model with continuous observations                          
# Number of hidden states = 3
# Univariate gaussian mixture model
N <- 3
newModel <- initGHMM(N)

A <- matrix(c(0.5, 0.3,0.2,
              0.2, 0.6, 0.2,
              0.1, 0.3, 0.6),
            ncol= N, byrow = TRUE)

Mu <- matrix(c(0, 50, 100), ncol = N)
Sigma <- array(c(144, 400, 100), dim = c(1,1,N))
Pi <- rep(1/N, N)

newModel <- setParameters(newModel,
                          list( "A" = A, 
                                "Mu" = Mu, 
                                "Sigma" = Sigma, 
                                "Pi" = Pi))


## Values for a hidden Markov model with continuous observations                          
# Number of hidden states = 2
# Multivariate gaussian mixture model
# Observed vector with dimensionality of 3
N <- 2
M <- 3
set.seed(100)
newModel <- initGHMM(N,M)

# Same number of dimensions
Sigma <- array(0, dim =c(M,M,N))
Sigma[,,1] <- matrix(c(1.0,0.8,0.8,
                       0.8,1.0,0.8,
                       0.8,0.8,1.0), ncol = M,  
                     byrow = TRUE)
Sigma[,,2] <- matrix(c(1.0,0.4,0.6,
                       0.4,1.0,0.8,
                       0.6,0.8,1.0), ncol = M,
                     byrow = TRUE)
Mu <- matrix(c(0, 5, 
               10, 0, 
               5, 10), 
             nrow = M, 
             byrow = TRUE)

A <- matrix(c(0.6,0.4,
              0.3, 0.7), 
            ncol = N,
            byrow = TRUE)
Pi <- c(0.5, 0.5)

newModel <- setParameters(newModel, 
                          list( "A" = A, 
                                "Mu" = Mu, 
                                "Sigma" = Sigma, 
                                "Pi" = Pi))


                                



