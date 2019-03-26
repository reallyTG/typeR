## ----eval=F--------------------------------------------------------------
#  derFunc
#  getDesScores
#  evaluate
#  probUnDes
#  plotDes
#  plotEv

## ----message=F-----------------------------------------------------------
library(randomizeR)

## ----sequences-----------------------------------------------------------
sequences <- getAllSeq(rarPar(4))
issue1 <- corGuess("CS")
issue2 <- chronBias("linT", 0.25, "exact")
endp <- normEndp(mu = c(0,0), sigma = c(1,1))
A <- assess(sequences, issue1, issue2, endp = endp)
A

## ----derFunctions--------------------------------------------------------
d1 <- derFunc(0.5, 0.75, 1)
d1
d2 <- derFunc(0.05, 0.1, 1)
d2

## ----getDesScores1-------------------------------------------------------
D1 <- getDesScores(A, d1, d2)
print(D1$D, digits = 3)

## ------------------------------------------------------------------------
getDesScores(A, d1, d2, weights = c(5/6, 1/6))

## ----summary1------------------------------------------------------------
summary(D1)

## ------------------------------------------------------------------------
plotDes(D1, quantiles = TRUE)

## ------------------------------------------------------------------------
issue1 <- corGuess("CS")
issue2 <- chronBias(type = "linT", theta = 1/4, method = "exact")
RAR <- getAllSeq(rarPar(4))
BSD <- getAllSeq(bsdPar(4, mti = 2))
A1 <- assess(RAR, issue1, issue2, endp = normEndp(c(0,0), c(1,1)))
A2 <- assess(BSD, issue1, issue2, endp = normEndp(c(0,0), c(1,1)))

d1 <- derFunc(TV = 0.5, 0.75, 2)
d2 <- derFunc(0.05, c(0, 0.1), c(1, 1))
DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
DesScore2 <- getDesScores(A2, d1, d2, weights = c(5/6, 1/6))

evaluate(DesScore, DesScore2)

## ------------------------------------------------------------------------
print(DesScore$D, digits = 3)
print(DesScore2$D, digits = 3)

## ------------------------------------------------------------------------
probUnDes(DesScore)
probUnDes(DesScore2)

## ------------------------------------------------------------------------
plotEv(evaluate(DesScore, DesScore2))

