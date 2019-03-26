###################################################################
# ----------------------------------------------------------------#
# Tests for the evaluate function                                 #
# ----------------------------------------------------------------#
###################################################################

context("Desirability class")

test_that("evaluate returns valid object", {
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
  DesScore3 <- getDesScores(A3, d1, d1)
  DesScore4 <- getDesScores(A4, d1)
  DesScore5 <- getDesScores(A5, d1, d1, d1)
  DesScore6 <- getDesScores(A2, d1, d2, weights = c(5/6, 1/6))
  DesScore7 <- getDesScores(A2, d1, d1)
  DesScore8 <- getDesScores(A2, d2, d1)
  
  expect_is(evaluate(DesScore, DesScore6), "evaluation")
  expect_is(evaluate(DesScore4), "evaluation")
  expect_warning(evaluate(DesScore, DesScore2))
  expect_warning(evaluate(DesScore2, DesScore7))
  expect_warning(evaluate(DesScore2, DesScore8))
  expect_error(evaluate(DesScore, DesScore3))
  expect_error(evaluate(DesScore, DesScore5))
})

test_that("Arguments in evaluation object are set correctly", {
  issue1 <- corGuess("CS")
  issue2 <- corGuess("DS")
  RAR <- getAllSeq(rarPar(4))
  BSD <- getAllSeq(bsdPar(4, mti = 2))
  A1 <- assess(RAR, issue1, issue2)
  A2 <- assess(BSD, issue1, issue2)
  A3 <- assess(BSD, issue1, issue1)
  
  d1 <- derFunc(TV = 0.1, 0.7, 2)
  d2 <- derFunc(0.5, c(0.3, 0.8), c(1, 1))
  DesScore <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
  DesScore2 <- getDesScores(A2, d1, d2)
  DesScore3 <- getDesScores(A3, d1, d1)
  DesScore4 <- getDesScores(A2, d1, d1)
  
  E1 <- evaluate(DesScore, DesScore2)
  expect_equal(E1$weights, c(5/6, 1/6))
  expect_equal(E1$statistic, "mean")
  E2 <- evaluate(DesScore2, DesScore4, statistic = "max")
  expect_equal(E2$desFuncs, c(getDesFunc(d1), getDesFunc(d2)))
  expect_equal(E2$statistic, "max")
})






