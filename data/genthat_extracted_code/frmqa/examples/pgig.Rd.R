library(frmqa)


### Name: pgig
### Title: Accurate Evaluation of Tail Probabilities of the Generalized
###   Inverse Gaussian Distribution
### Aliases: pgig

### ** Examples

## Accuracy tests
q <- 1
chi <- 3
psi <- 15
lambda <- 5/2
lowerTail <- sapply(lambda, function(w.)
  pgig(q, chi, psi, lambda = w., lower.tail = TRUE, 200))
upperTail <- sapply(lambda, function(w.)
  pgig(q, chi, psi, lambda = w., lower.tail = FALSE, 200))
## sum of two parts equals 1
(lowerTail + upperTail)




