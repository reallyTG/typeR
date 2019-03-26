library(RcppHMM)


### Name: learnEM
### Title: Expectation-Maximization algorithm to estimate the model
###   parameters
### Aliases: learnEM
### Keywords: optimize

### ** Examples

## Values for a hidden Markov model with categorical observations
# Set the model parameters
n <- c("First","Second")
m <- c("A","T","C","G")
A <- matrix(c(0.8,0.2,
              0.1,0.9),
            nrow = 2,
            byrow = TRUE)

B <- matrix(c(0.2, 0.2, 0.3, 0.3,
              0.4, 0.4, 0.1, 0.1),
            nrow = 2,
            byrow = TRUE)

Pi <- c(0.5, 0.5)

params <- list( "Model" = "HMM",
                "StateNames" = n,
                "ObservationNames" = m,
                "A" = A,
                "B" = B,
                "Pi" = Pi)

HMM <- verifyModel(params)

# Data simulation
set.seed(100)
length <- 100
seqs <- 10

# Multiple sequences to be used as training set
observationSequences<- c()
for(i in 1:seqs){
  Y <- generateObservations(HMM , length)$Y
  observationSequences <- rbind(observationSequences , Y)
}

# New model random initialization
# Model to be trained
set.seed(1000)
newModel <- initHMM(2,4) 
n = c("X1","X2")
m = c("A","T","C","G")
newModel <- setNames(newModel,
                     list( "StateNames" = n,
                           "ObservationNames" = m) )

## No test: 
  newModel <- learnEM(newModel,
                      observationSequences,
                      iter= 50, 
                      delta = 1E-5,
                      pseudo = 3,
                      print = TRUE)
## End(No test)

print(newModel)   

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

# Data simulation
set.seed(100)
length <- 100
seqs <- 50

# Multiple sequences to be evaluated
observationSequences<- c()
for(i in 1:seqs){
  Y <- generateObservations(HMM.discrete , length)$Y
  observationSequences <- rbind(observationSequences , Y)
}

dim(observationSequences)
# New model random initialization
# Model to be trained
set.seed(1000)
newModel <- initPHMM(3) 
## No test: 
  newModel <- learnEM(newModel,
                      observationSequences,
                      iter= 50, 
                      delta = 1E-5,
                      print = FALSE)
## End(No test)

print(newModel)   


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

HMM.cont.univariate <- verifyModel(list( "Model"="GHMM", 
                              "StateNames" = N,
                              "A" = A, 
                              "Mu" = Mu, 
                              "Sigma" = Sigma, 
                              "Pi" = Pi))

# Data simulation
set.seed(100)
length <- 100
seqs <- 50

# Multiple sequences to be evaluated
observationSequences<- array(0, dim = c(1, length, seqs) )
for(i in 1:seqs){
  Y <- generateObservations(HMM.cont.univariate , length)$Y
  observationSequences[,,i] <- Y
}

dim(observationSequences)

# New model random initialization
# Model to be trained
set.seed(1000)
newModel <- initGHMM(3) 
## No test: 
  newModel <- learnEM(newModel,
                      observationSequences,
                      iter= 50, 
                      delta = 1E-5,
                      print = FALSE)
## End(No test)

print(newModel)   


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
            ncol = length(N),
            byrow = TRUE)
Pi <- c(0.5, 0.5)

HMM.cont.multi <- verifyModel(list( "Model" = "GHMM",
                              "StateNames" = N,
                              "A" = A, 
                              "Mu" = Mu, 
                              "Sigma" = Sigma, 
                              "Pi" = Pi))

# Data simulation
set.seed(100)
length <- 100
seqs <- 50

# Multiple sequences to be evaluated
observationSequences<- array(0, dim = c(M, length, seqs) )
for(i in 1:seqs){
  Y <- generateObservations(HMM.cont.multi , length)$Y
  observationSequences[,,i] <- Y
}

dim(observationSequences)

# New model random initialization
# Model to be trained
set.seed(1000)
newModel <- initGHMM(2, M) 
## No test: 
  newModel <- learnEM(newModel,
                      observationSequences,
                      iter= 50, 
                      delta = 1E-5,
                      print = FALSE)
## End(No test)

print(newModel)   



