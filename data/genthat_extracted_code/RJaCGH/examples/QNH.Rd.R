library(RJaCGH)


### Name: QNH
### Title: Transition Matrix for non-homogeneous Hidden Markov Model
### Aliases: QNH
### Keywords: models

### ** Examples

## Model with two hidden states
## Note that RJaCGH normalizes distances to be between 0 and 1
beta <- matrix(c(0, 1, 3, 0), 2, 2)
QNH(beta=beta, x=0.4)



