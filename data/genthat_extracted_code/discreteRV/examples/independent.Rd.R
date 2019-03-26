library(discreteRV)


### Name: independent
### Title: Tests whether the random variables X and Y are independent
### Aliases: independent

### ** Examples

AandB <- jointRV(outcomes = list(1:3, 0:2), probs = 1:9 / sum(1:9))
A <- marginal(AandB, 1)
B <- marginal(AandB, 2)
independent(A, B) # FALSE
CandD <- jointRV(outcomes = list(1:3, 0:2))
C <- marginal(CandD, 1)
D <- marginal(CandD, 2)
independent(C, D) # FALSE



