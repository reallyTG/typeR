library(aphid)


### Name: Viterbi
### Title: The Viterbi algorithm.
### Aliases: Viterbi Viterbi.PHMM Viterbi.HMM Viterbi.default

### ** Examples

  ## Viterbi algorithm for standard HMMs:
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
  ### Find optimal path of sequence
  data(casino)
  casino.DPA <- Viterbi(x, casino)
  casino.DPA$score # full (log) prob of sequence given model = -538.8109
  ### Show optinal path path as indices
  casino.DPA$path
  ### Show optimal path as character strings
  rownames(x$E)[casino.DPA$path + 1]
  ##
  ## Needleman-Wunch pairwise sequence alignment:
  ## Pairwise protein alignment example from Durbin et al (1998) chapter 2.3
  x <- c("H", "E", "A", "G", "A", "W", "G", "H", "E", "E")
  y <- c("P", "A", "W", "H", "E", "A", "E")
  Viterbi(x, y,  d = 8, e = 2, type = "global")
  ###
  ## Viterbi algorithm for profile HMMs:
  ## Small globin alignment data from Durbin et al (1998) Figure 5.3
  data(globins)
  ### Derive a profile hidden Markov model from the alignment
  globins.PHMM <- derivePHMM(globins, residues = "AMINO", seqweights = NULL)
  plot(globins.PHMM, main = "Profile hidden Markov model for globins")
  ### Simulate a random sequence from the model
  set.seed(999)
  simulation <- generate(globins.PHMM, size = 20)
  simulation ## "F" "S" "A" "N" "N" "D" "W" "E"
  ### Calculate the odds of the optimal path of the sequence given the model
  x <- Viterbi(globins.PHMM, simulation, odds = FALSE)
  x # -23.07173
  ### Show dynammic programming array
  x$array
  ### Show the optimal path as an integer vector
  x$path
  ### Show the optimal path as either delete states, matches or insert states
  c("D", "M", "I")[x$path + 1]
  ### Correctly predicted the actual path:
  names(simulation)



