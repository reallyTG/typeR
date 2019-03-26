library(RcppHMM)


### Name: verifyModel
### Title: Model parameter verification
### Aliases: verifyModel
### Keywords: methods

### ** Examples

## Values for a hidden Markov model with categorical observations

n <- c("First","Second")
m <- c("A","T","C","G")
A <- matrix(c(0.378286,0.621714,
              0.830970,0.169030),
            nrow = 2,
            byrow = TRUE)

B <- matrix(c(0.1930795, 0.2753869, 0.3463100, 0.1852237,
              0.2871577, 0.1848870, 0.1614925, 0.3664628),
            nrow = 2,
            byrow = TRUE)

Pi <- c(0.4757797, 0.5242203)


params <- list( "Model" = "HMM",
                "StateNames" = n,
                "ObservationNames" = m,
                "A" = A,
                "B" = B,
                "Pi" = Pi)

verifiedModel <- verifyModel(params)
print(verifiedModel)

## Values for a hidden Markov model with discrete observations

n <- c("Low","Normal","High")

A <- matrix(c(0.5, 0.3,0.2,
              0.2, 0.6, 0.2,
              0.1, 0.3, 0.6),
            ncol=length(n), byrow=TRUE)

B <- c(2600,  # First distribution with mean 2600
       2700,  # Second distribution with mean 2700
       2800)  # Third distribution with mean 2800

Pi <- rep(1/length(n), length(n))

HMM.discrete <- verifyModel(list("Model"="PHMM", "StateNames" = n, "A" = A, "B" = B, "Pi" = Pi))
print(HMM.discrete)

## Values for a hidden Markov model with continuous observations                          
# Number of hidden states = 3
# Univariate gaussian mixture model

N = c("Low","Normal", "High")
A <- matrix(c(0.5, 0.3,0.2,
              0.2, 0.6, 0.2,
              0.1, 0.3, 0.6),
            ncol= length(N), byrow = TRUE)

Mu <- matrix(c(0, 50, 100), ncol = length(N))
Sigma <- array(c(144, 400, 100), dim = c(1,1,length(N)))
Pi <- rep(1/length(N), length(N))

newModel <- verifyModel(list( "Model"="GHMM", 
                              "StateNames" = N,
                              "A" = A, 
                              "Mu" = Mu, 
                              "Sigma" = Sigma, 
                              "Pi" = Pi))


## Values for a hidden Markov model with continuous observations                          
# Number of hidden states = 2
# Multivariate gaussian mixture model
# Observed vector with dimensionality of 3
N = c("X1","X2")
M <- 3

# Same number of dimensions
Sigma <- array(0, dim =c(M,M,length(N)))
Sigma[,,1] <- matrix(c(1.0,0.8,0.8,
                       0.8,1.0,0.8,
                       0.8,0.8,1.0), ncol = M)
Sigma[,,2] <- matrix(c(1.0,0.4,0.6,
                       0.4,1.0,0.8,
                       0.6,0.8,1.0), ncol = M)
Mu <- matrix(c(0, 5, 
               10, 0, 
               5, 10), nrow = M)

A <- matrix(c(0.6,0.3,
              0.4, 0.7), ncol = length(N))
Pi <- c(0.5, 0.5)

newModel <- verifyModel(list( "Model" = "GHMM",
                                "StateNames" = N,
                                "A" = A, 
                                "Mu" = Mu, 
                                "Sigma" = Sigma, 
                                "Pi" = Pi))





