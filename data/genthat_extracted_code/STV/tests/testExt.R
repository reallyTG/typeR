context("Basic extractions")

test_that("Toy example", {
  
  # Added March 7 to force use of legacy random number generation
  # so the tests should pass both in current and devel versions of R.
  suppressWarnings(RNGversion("3.5.0"))
  
  set.seed(1)
  data(ballots)
  cballots <- cleanBallots(ballots)
  result <- stv(cballots, seats = 4)
  ans <- result$elected
  
  expect_that(ans, equals(c("ATL_19", "ATL_10", "ATL_2", "ATL_54")))

  # Random results possible (different from above)
  set.seed(4)
  result2 <- stv(cballots, seats = 4)
  an2 <- result2$elected
  
  expect_that(an2, equals(c("ATL_19", "ATL_10", "ATL_2", "ATL_27")))
  
  result3 <- stv(cballots, seats = 4, surplusMethod = "Fractional")
  ans3 <- result3$elected
  
  expect_that(ans3, equals(c("ATL_19", "ATL_10", "ATL_2", "ATL_54")))
  
  # The following is interesting: same people elected but in a
  # very different order!
  result4 <- stv(cballots, seats = 4, surplusMethod = "Fractional",
                 quotaMethod = "Hare")
  ans4 <- result4$elected
  
  expect_that(ans4, equals(c("ATL_19", "ATL_54", "ATL_10", "ATL_2")))
  
  result5 <- stv(cballots, seats = 4, surplusMethod = "Cambridge",
                 quotaMethod = "Hare")
  ans5 <- result5$elected
  
  expect_that(ans5, equals(c("ATL_19", "ATL_27", "ATL_10", "ATL_2")))
  
})
