library(aphid)


### Name: train
### Title: Iterative model refinement.
### Aliases: train train.PHMM train.HMM

### ** Examples

  ## Baum Welch training for standard HMMs:
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
  op <- par(no.readonly = TRUE)
  par(mfrow = c(2, 1))
  plot(x, main = "Dishonest casino HMM before training")
  data(casino)
  x <- train(x, list(casino), method = "BaumWelch", deltaLL = 0.001)
  plot(x, main = "Dishonest casino HMM after training")
  par(op)



