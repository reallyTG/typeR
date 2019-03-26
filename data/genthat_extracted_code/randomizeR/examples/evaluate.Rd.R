library(randomizeR)


### Name: evaluate
### Title: Evaluation of several randomization procedures with respect to
###   certain desirability functions applied to specified issues.
### Aliases: evaluate evaluate evaluate,missing-method
###   evaluate,character-method

### ** Examples

# Compare Random Allocation Rule to Big Stick Design with respect to different issues
# and their corresponding desirability functions
issue1 <- corGuess("CS")
issue2 <- corGuess("DS")
RAR <- getAllSeq(rarPar(4))
BSD <- getAllSeq(bsdPar(4, mti = 2))
A1 <- assess(RAR, issue1, issue2)
A2 <- assess(BSD, issue1, issue2)

d1 <- derFunc(TV = 0.1, 0.7, 2)
d2 <- derFunc(0.5, c(0.3, 0.8), c(1, 1))
DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
DesScore2 <- getDesScores(A2, d1, d2, weights = c(5/6, 1/6))

evaluate(DesScore, DesScore2)
evaluate(DesScore, DesScore2, statistic = "max")





