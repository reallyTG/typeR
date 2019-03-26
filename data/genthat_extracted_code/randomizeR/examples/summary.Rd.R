library(randomizeR)


### Name: summary
### Title: Summary of assessments of a randomization procedure
### Aliases: summary summary summary,assessment-method summary summary
###   summary,desScores-method

### ** Examples

# assess the full set of PBR(4)
seq <- getAllSeq(pbrPar(4))
issue <- corGuess("CS")
A <- assess(seq, issue)
summary(A)

# Compute the desirability scores of the full set of PBR(4)
seq <- getAllSeq(pbrPar(4))
issue1 <- corGuess("CS")
issue2 <- corGuess("DS")
A <- assess(seq, issue1, issue2)
d1 <- derFunc(0.5, c(0.1, 0.8), c(1, 1))
d2 <- derFunc(0.1, 0.7, 2)
D <- getDesScores(A, d1, d2, weights = c(5/6, 1/6))
summary(D)




