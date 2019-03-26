library(aphid)


### Name: backward
### Title: The backward algorithm.
### Aliases: backward backward.PHMM backward.HMM

### ** Examples

  ## Backward algorithm for standard HMMs:
  ## The dishonest casino example from Durbin et al (1998) chapter 3.2
  states <- c("Begin", "Fair", "Loaded")
  residues <- paste(1:6)
  ### Define the transition probability matrix
  A <- matrix(c(0, 0, 0, 0.99, 0.95, 0.1, 0.01, 0.05, 0.9), nrow = 3)
  dimnames(A) <- list(from = states, to = states)
  ### Define the emission probability matrix
  E <- matrix(c(rep(1/6, 6), rep(1/10, 5), 1/2), nrow = 2, byrow = TRUE)
  dimnames(E) <- list(states = states[-1], residues = residues)
  ### Build and plot the HMM object
  x <- structure(list(A = A, E = E), class = "HMM")
  plot(x, main = "Dishonest casino HMM")
  data(casino)
  backward(x, casino)
  ##
  ## Backward algorithm for profile HMMs:
  ## Small globin alignment data from Durbin et al (1998) Figure 5.3
  data(globins)
  ### Derive a profile hidden Markov model from the alignment
  globins.PHMM <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
  plot(globins.PHMM, main = "Profile hidden Markov model for globins")
  ### Simulate a random sequence from the model
  set.seed(999)
  simulation <- generate(globins.PHMM, size = 20)
  simulation ## "F" "S" "A" "N" "N" "D" "W" "E"
  ### Calculate the full (log) probability of the sequence given the model
  x <- backward(globins.PHMM, simulation, odds = FALSE)
  x # -23.0586
  ### Show dynammic programming array
  x$array



