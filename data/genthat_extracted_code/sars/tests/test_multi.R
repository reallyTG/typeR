context("sar_average")

test_that("sar_average returns correct results", {

  fit3 <- sar_average(data = galap, normaTest = "none", homoTest = "none",
                    neg_check = FALSE)
  expect_equal(round(sum(fit3$mmi), 1), 1640.9)
  expect_output(str(fit3), "List of 2")
  expect_is(fit3, "multi")
  expect_match(fit3$details$homo_test, "none")
  expect_match(fit3$details$norm_test, "none")
  expect_match(fit3$details$ic, "AICc")
  expect_error(sar_multi(5), "argument is of length zero")
})


test_that("sar_average using fit_collection object works", {
  ff <- sar_multi(data = galap, obj = c("power", "p1", "loga", "monod",
                                        "linear"))
  expect_warning(sar_average(obj = ff, data = galap, normaTest = "none",
                    neg_check = FALSE))
  fit3 <- sar_average(obj = ff, data = galap, neg_check = FALSE)
  expect_equal(round(sum(fit3$mmi), 1), 1662.1)
  expect_output(str(fit3), "List of 2")
  expect_is(fit3, "multi")
  expect_match(fit3$details$homo_test, "cor.fitted")
  expect_match(fit3$details$ic, "AICc")
  expect_error(sar_multi(5), "argument is of length zero")
})



test_that("confidence intervals are correct", {
  skip_on_cran()
  fit3 <- sar_average(data = galap, normaTest = "none", homoTest = "none",
                    neg_check = FALSE, confInt = TRUE, ciN = 20)
  ci <- fit3$details$confInt
  expect_equal(nrow(ci), nrow(galap))
  expect_output(str(ci), "data.frame")
  expect_true(all(ci[ ,1] < ci[ ,2]))
})
