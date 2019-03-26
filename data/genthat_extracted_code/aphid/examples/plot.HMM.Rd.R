library(aphid)


### Name: plot.HMM
### Title: Plot standard hidden Markov models.
### Aliases: plot.HMM

### ** Examples

  ## the dishonest casino example from Durbin et al (1998)
  states <- c("Begin", "Fair", "Loaded")
  residues = paste(1:6)
  A <- matrix(c(0, 0, 0, 0.99, 0.95, 0.1, 0.01, 0.05, 0.9), nrow = 3)
  dimnames(A) <- list(from = states, to = states)
  E <- matrix(c(rep(1/6, 6), rep(1/10, 5), 1/2), nrow = 2, byrow = TRUE)
  dimnames(E) <- list(states = states[-1], residues = residues)
  x <- structure(list(A = A, E = E), class = "HMM")
  plot(x, main = "Dishonest casino hidden Markov model")



