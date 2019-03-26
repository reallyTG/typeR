library(PCRedux)

context("decision_modus")

test_that("decision_modus gives the correct dimensions and properties", {
  library(qpcR)

  res_decision_modus_freq <- decision_modus(c("a", "a", "y", "n", "b"), max_freq = TRUE)
  res_decision_modus_table <- decision_modus(c("a", "a", "y", "n", "b"), max_freq = FALSE)

  expect_that(res_decision_modus_freq, is_a("factor"))
  expect_that(res_decision_modus_table, is_a("data.frame"))
  expect_that(res_decision_modus_freq == "a", is_true())
  expect_that(res_decision_modus_table[1, 2] == 2, is_true())
})
