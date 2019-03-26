###################################################################
# ----------------------------------------------------------------#
# Tests for the getDesScores function                             #
# ----------------------------------------------------------------#
###################################################################

context("Desirability class")

test_that("getDesScore returns valid object", {
  RAR <- getAllSeq(rarPar(4))
  issue1 <- corGuess("CS")
  issue2 <- corGuess("DS")
  A1 <- assess(RAR, issue1, issue2)
  d1 <- derFunc(TV = 0.1, 0.7, 2)
  d2 <- derFunc(0.5, c(0.3, 0.8))
  DesScore1 <- getDesScores(A1, d1, d2, weights = c(5/6, 1/6))
  expect_is(DesScore1, "desScores")
  
  seqs <- getAllSeq(pbrPar(bc = c(2, 2, 2)))
  type <- sample(c("CS", "DS"), 1)
  i1 <- corGuess(type)
  A3 <- assess(seqs, i1)
  DesScore3 <- getDesScores(A3, d1)
  expect_is(DesScore3, "desScores")
  
  # Expect error if there are too few arguments and if signature does not fit
  expect_error(getDesScores(A1))
  expect_error(getDesScores(A1, d1))
  expect_error(getDesScores(A1, "blubb", "blibb"))
  expect_error(getDesScores(A1, 42, 34))
  expect_error(getDesScores(A1$D, d1, d2))
  # Expect error if sum of weights do not sum to 1
  expect_error(getDesScores(A1, d1, d2, weights = c(1/2, 1/3)))
  expect_error(getDesScores(A1, d1, d2, weights = c(1/2, 2/3)))
})

test_that("Arguments in desScores object are set correctly", {
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
  
  expect_equal(DesScore$weights, c(5/6, 1/6))
  expect_equal(DesScore2$weights, c(1/2, 1/2))
  expect_equal(DesScore3$weights, c(1/2, 1/2))
  expect_equal(DesScore4$weights, c(1/2, 1/2))
  expect_equal(DesScore$desFuncs, c(getDesFunc(d1), getDesFunc(d2)))
  expect_equal(DesScore2$desFuncs, c(getDesFunc(d1), getDesFunc(d2)))
  expect_equal(DesScore3$desFuncs, c(getDesFunc(d1), getDesFunc(d1)))
  expect_equal(DesScore4$desFuncs, c(getDesFunc(d1), getDesFunc(d1)))
})



