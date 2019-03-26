###################################################################
# ----------------------------------------------------------------#
# Tests for the derFunc class                                     #
# ----------------------------------------------------------------#
###################################################################

context("Desirability class")

test_that("derFunc returns valid object", {
  tv <- sample(seq(-20, 20, 0.05), 1) 
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for left-sided desirability function
  lsl <- sample(seq(-30, tv - 0.0001, by = 0.05), 1)
  bL <- sample(20, 1)
  
  dLeft <- derFunc(TV = tv, SLs = lsl, b = bL)
  expect_is(dLeft, "desFunc")
  expect_is(dLeft, "derFunc")
  expect_is(dLeft, "derringerLs")
  expect_false(is(dLeft,"derringerRs"))
  expect_false(is(dLeft,"derringerTs"))
  
  # Missing weights
  dLeft <- derFunc(TV = tv, SLs = lsl)
  expect_is(dLeft, "desFunc")
  expect_is(dLeft, "derFunc")
  expect_is(dLeft, "derringerLs")
  expect_false(is(dLeft,"derringerRs"))
  expect_false(is(dLeft,"derringerTs"))
  
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for right-sided desirability function
  usl <- sample(seq(tv + 0.0001, 30, by = 0.05), 1)
  bR <- sample(20, 1)
  
  dRight <- derFunc(TV = tv, SLs = usl, b = bR)
  expect_is(dRight, "desFunc")
  expect_is(dRight, "derFunc")
  expect_is(dRight, "derringerRs")
  expect_false(is(dRight,"derringerLs"))
  expect_false(is(dRight,"derringerTs"))
  
  # Missing weights
  dRight <- derFunc(TV = tv, SLs = usl)
  expect_is(dRight, "desFunc")
  expect_is(dRight, "derFunc")
  expect_is(dRight, "derringerRs")
  expect_false(is(dRight,"derringerLs"))
  expect_false(is(dRight,"derringerTs"))
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for two-sided desirability function
  dLR <- derFunc(TV = tv, c(lsl, usl), b = c(bL, bR))
  expect_is(dLR, "desFunc")
  expect_is(dLR, "derFunc")
  expect_is(dLR, "derringerTs")
  expect_false(is(dLR,"derringerLs"))
  expect_false(is(dLR,"derringerRs"))
  
  # Missing weights
  dLR <- derFunc(TV = tv, c(lsl, usl))
  expect_is(dLR, "desFunc")
  expect_is(dLR, "derFunc")
  expect_is(dLR, "derringerTs")
  expect_false(is(dLR,"derringerLs"))
  expect_false(is(dLR,"derringerRs"))
  
  # lsl and usl are swapped. Should produce no error. Uses the smaller value of SLs
  # for the lower and the bigger bound for the upper bound specification limit
  dLR <- derFunc(TV = tv, c(usl, lsl), b = c(bR, bL))
  expect_equal(dLR@SLs[1], lsl)
  expect_equal(dLR@SLs[2], usl)
  expect_equal(dLR@b[1], bL)
  expect_equal(dLR@b[2], bR)
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  # These tests should produce an error:

  expect_error(derFunc(TV = "blubb", SLs = lsl, b = bL))
  expect_error(derFunc(TV = "blubb", SLs = usl, b = bR))
  expect_error(derFunc(TV = "blubb", SLs = c(lsl, usl), b = c(bL, bR)))
  
  # SLs should be different from TV
  expect_error(derFunc(TV = tv, SLs = tv, b = bL))
  expect_error(derFunc(TV = tv, SLs = tv, b = bR))
  expect_that(derFunc(TV = tv, SLs = c(tv, tv), b = c(bL, bR)), 
              throws_error("Should be smaller or greater than TV"))
  
  # Only one target value possible
  expect_that(derFunc(TV = c(tv, tv) , SLs = c(lsl, usl), b = c(bL, bR)), 
              throws_error("TV has length 2. Should be one."))
  
  # SLs and b have different lengths
  expect_that(derFunc(TV = tv, SLs = c(lsl, usl), b = bL), 
              throws_error("SLs and b have different lengths. Should be equal. "))
  expect_that(derFunc(TV = tv, SLs = usl, b = c(bL, bR)), 
              throws_error("b has length  2. Should be one. "))
  expect_that(derFunc(TV = tv, SLs = lsl, b = c(bL, bR)), 
              throws_error("b has length  2. Should be one. "))

  # Handling NA-values
  expect_error(derFunc(TV = NA, SLs = lsl, b = bL))
  expect_error(derFunc(TV = NA, SLs = usl, b = bL))
  expect_error(derFunc(TV = tv, SLs = NA, b = bL))
  expect_error(derFunc(TV = NA, SLs = c(lsl, usl), b = c(bL, bR)))
  expect_error(derFunc(TV = tv, SLs = c(NA, usl), b = c(bL, bR)))
  expect_error(derFunc(TV = tv, SLs = c(lsl, usl), b = c(NA, bR)))
  expect_error(derFunc(TV = tv, SLs = lsl, b = NA))
  expect_error(derFunc(TV = tv, SLs = usl, b = NA))
  expect_error(derFunc(TV = tv, SLs = c(lsl, usl), b = NA))
  

  # Parameter b should be positive or equal to zero
  bL <- sample(seq(-100, -1), 1)
  bR <- sample(seq(-100, -1), 1)
  expect_that(derFunc(TV = tv, SLs = lsl, b = bL), 
              throws_error("Should be greater or equal than zero."))
  expect_that(derFunc(TV = tv, SLs = usl, b = bR), 
              throws_error("Should be greater or equal than zero."))
  expect_that(derFunc(TV = tv, SLs = c(lsl, usl), b = c(bL, bR)), 
              throws_error("Each element of b should be greater or equal than zero."))
  
  # Too many arguments
  expect_error(derFunc(TV = tv, SLs = lsl, b = bL, 42))
})

test_that("Arguments in derFunc are set correctly", {
  tv <- sample(seq(-20, 20, by = 0.05), 1) 
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for left-sided desirability function
  lsl <- sample(seq(-30, tv-0.0001, by = 0.05), 1)
  bL <- sample(20, 1)
  
  dLeft <- derFunc(TV = tv, SLs = lsl, b = bL)
  expect_equal(dLeft@TV, tv)
  expect_equal(dLeft@SLs, lsl)
  expect_equal(dLeft@b, bL)
  
  dLeft <- derFunc(TV = tv, SLs = lsl)
  expect_equal(dLeft@b, 1)
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for right-sided desirability function
  usl <- sample(seq(tv + 0.0001, 30, by = 0.05), 1)
  bR <- sample(20, 1)
  
  dRight <- derFunc(TV = tv, SLs = usl, b = bR)
  expect_equal(dRight@TV, tv)
  expect_equal(dRight@SLs, usl)
  expect_equal(dRight@b, bR)
  
  dRight <- derFunc(TV = tv, SLs = usl)
  expect_equal(dRight@b, 1)
  
  # # # # # # # # # # # # # # # # # # # # # # # # # # # #
  # Test for two-sided desirability function
  dLR <- derFunc(TV = tv, c(lsl, usl), b = c(bL, bR))
  expect_equal(dLR@TV, tv)
  expect_equal(dLR@SLs, c(lsl, usl))
  expect_equal(dLR@b, c(bL, bR))
  
  dLR <- derFunc(TV = tv, c(usl, lsl), b = c(bR, bL))
  expect_equal(dLR@TV, tv)
  expect_equal(dLR@SLs, c(lsl, usl))
  expect_equal(dLR@b, c(bL, bR))
  
  dLR <- derFunc(TV = tv, c(usl, lsl))
  expect_equal(dLR@b, c(1, 1))
})


