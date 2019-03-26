library(RJaCGH)


### Name: simulateRJaCGH
### Title: Simulate observations form a hidden Markov model with
###   non-homogeneous transition probabilities.
### Aliases: simulateRJaCGH
### Keywords: models

### ** Examples

beta <- matrix(c(0, 5, 1, 1,  0, 1, 3, 5, 0), 3)
obs <- simulateRJaCGH(n=200, x=rexp(199), mu=c(-3, 0, 3), sigma.2=c(1,1,1),
beta=beta, start=2)
plot(obs$y, col=obs$states)



