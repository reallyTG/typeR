library(episode)


### Name: print.rlk
### Title: Print 'rlk' object
### Aliases: print.rlk

### ** Examples

# Rational law kinetics
A <- matrix(
c(1, 0, 0, 0,
  0, 1, 2, 0,
  0, 0, 0, 1), ncol = 4, byrow = TRUE)
r <- rlk(A, A[c(2, 1, 3), ])
r



