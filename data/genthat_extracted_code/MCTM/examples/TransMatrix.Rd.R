library(MCTM)


### Name: TransMatrix
### Title: Transition Matrix Estimation
### Aliases: TransMatrix
### Keywords: chain markov matrix transition

### ** Examples

seq <- sample(c(1,2,3,4), size = 1000, replace = TRUE)
TransMatrix(seq, order = 1, probs = TRUE)
TransMatrix(seq, order = 2, probs = FALSE)
mc <- TransMatrix(seq, order = 4, probs = TRUE)
mc[[1]][[2]][[3]] # through nested lists you can access to the estimated transition matrices



