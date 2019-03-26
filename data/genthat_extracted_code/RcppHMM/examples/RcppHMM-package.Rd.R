library(RcppHMM)


### Name: RcppHMM-package
### Title: Overview of Package RcppHMM
### Aliases: RcppHMM-package RcppHMM

### ** Examples

# Multinomial case
# Set the model parameters to be estimated
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

# Model parameters validation

HMM <- verifyModel(params)

# Data simulation
# Multiple sequences

set.seed(100)
length <- 100
seqs <- 100
observationSequences<- c()
for(i in 1:seqs){
  Y <- generateObservations(HMM , length)$Y
  observationSequences <- rbind(observationSequences , Y)
}

# New model random initialization

set.seed(1000)
newModel <- initHMM(2,4) 
n = c("X1","X2")
m = c("A","T","C","G")

# Change model names

newModel <- setNames(newModel,
                        list( "StateNames" = n,
                              "ObservationNames" = m) )

# Model parameters estimation

newModel <- learnEM(newModel,
        observationSequences,
        iter=300, 
        delta = 1E-8,
        pseudo = 0,
        print = TRUE)

# New sequence simulation to compare the new model
# Data simulation

# Single sequence
Y <- generateObservations(HMM , length)$Y

# Evaluation

evaluation(newModel, Y, "f")
evaluation(newModel, Y, "b")

# Hidden state decoding

hiddenStatesViterbi <- viterbi(newModel, Y)
hiddenStatesFB <- forwardBackward( newModel, Y)



