library(randomizeR)


### Name: desirability
### Title: Desirability functions within the scope of clinical trials
### Aliases: desirability

### ** Examples

# Suppose we would like to perform a comparison of sequences from different 
# randomization procedures with the help of desirability functions:

issue1 <- corGuess("CS")
issue2 <- chronBias(type = "linT", theta = 1/4, method = "exact")
RAR <- getAllSeq(rarPar(4))
BSD <- getAllSeq(bsdPar(4, mti = 2))
A1 <- assess(RAR, issue1, issue2, endp = normEndp(c(0,0), c(1,1)))
A2 <- assess(BSD, issue1, issue2, endp = normEndp(c(0,0), c(1,1)))

d1 <- derFunc(TV = 0.5, 0.75, 2)
d2 <- derFunc(0.05, c(0, 0.1), c(1, 1))

# By applying the \code{getDesScores} function to the assessment output together 
# with the specified desirability functions the behaviour of randomization sequences 
# is evaluated and scaled to [0,1]:
DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
DesScore2 <- getDesScores(A2, d1, d2, weights = c(5/6, 1/6))

# Plotting the desScores objects:
plotDes(DesScore, quantiles = TRUE)
plotDes(DesScore2, quantiles = TRUE)

# Summarizing the results of getDesScore with respect to the statistic "mean":
evaluate(DesScore, DesScore2)

# Plotting the evaluation objects allows a visualized comparison:
plotEv(evaluate(DesScore, DesScore2))

# Which randomzation procedure produces more undesired randomization sequences 
# with respect to certain issues and desirability functions?
probUnDes(DesScore)
probUnDes(DesScore2)




