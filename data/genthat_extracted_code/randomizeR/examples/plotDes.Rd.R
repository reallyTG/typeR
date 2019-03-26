library(randomizeR)


### Name: plotDes
### Title: desScore plotting
### Aliases: plotDes

### ** Examples

# Compute the desirability scores of the full set of PBR(4)
sequences <- getAllSeq(rarPar(4))
issue1 <- corGuess("CS")
issue2 <- chronBias("linT", 1/4, "exact")
endp <- normEndp(mu = c(0,0), sigma = c(1,1))
A <- assess(sequences, issue1, issue2, endp = endp)
d1 <- derFunc(0.5, 0.75, 1)
d2 <- derFunc(0.05, 0.1, 1)

D <- getDesScores(A, d1, d2)
summary(D)
plotDes(D)
plotDes(D, quantiles = TRUE)




