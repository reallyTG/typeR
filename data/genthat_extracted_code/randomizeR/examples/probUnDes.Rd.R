library(randomizeR)


### Name: probUnDes
### Title: Computing the probability of having desirabilty scores of zero
### Aliases: probUnDes probUnDes probUnDes,desScores-method

### ** Examples

# Compare Random Allocation Rule to Big Stick Design with respect to different issues
# and their corresponding desirability functions
RAR <- getAllSeq(rarPar(4))
issue1 <- corGuess("CS")
issue2 <- corGuess("DS")
A1 <- assess(RAR, issue1, issue2)

d1 <- derFunc(TV = 0.1, 0.7, 2)
d2 <- derFunc(0.5, c(0.3, 0.8), c(1, 1))
DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))

probUnDes(DesScore)





