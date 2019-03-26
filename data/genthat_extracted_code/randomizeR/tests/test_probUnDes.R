###################################################################
# ----------------------------------------------------------------#
# Tests for the probUnDes function                                 #
# ----------------------------------------------------------------#
###################################################################

context("Desirability class")

test_that("probUnDes returns valid object", {
  issue1 <- corGuess("CS")
  issue2 <- corGuess("DS")
  RAR <- getAllSeq(rarPar(4))
  BSD <- getAllSeq(bsdPar(4, mti = 2))
  A1 <- assess(RAR, issue1, issue2)
  A2 <- assess(BSD, issue1, issue2)
  A3 <- assess(BSD, issue1, issue1)
  A4 <- assess(BSD, issue1)
  A5 <- assess(BSD, issue1, issue1, issue1)
  
  d1 <- derFunc(TV = 0.1, 0.7, 2)
  d2 <- derFunc(0.5, c(0.3, 0.8), c(1, 1))
  DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
  DesScore2 <- getDesScores(A2, d1, d2)

  
  expect_is(probUnDes(DesScore), "probUnDesirable")
  expect_is(probUnDes(DesScore2), "probUnDesirable")
})