library(randomizeR)


### Name: getDesScores
### Title: Applying desirability functions on issues of individual
###   randomization sequences
### Aliases: getDesScores getDesScores
###   getDesScores,assessment,missing-method
###   getDesScores,assessment,numeric-method

### ** Examples

# Compute the desire-function for the full set of Random Allocation Rule for N=4 patients
sequences <- getAllSeq(rarPar(4))
issue1 <- corGuess("CS")
issue2 <- chronBias("linT", 0.25, "exact")
endp <- normEndp(mu = c(0,0), sigma = c(1,1))
A <- assess(sequences, issue1, issue2, endp = endp)
d1 <- derFunc(0.5, 0.75, 1)
d2 <- derFunc(0.05, 0.1, 1)

D1 <- getDesScores(A, d1, d2)
summary(D1)

D2 <- getDesScores(A, d1, d2, weights = c(3/4, 1/4))
summary(D2)




