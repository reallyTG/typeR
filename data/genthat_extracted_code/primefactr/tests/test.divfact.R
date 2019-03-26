context("COMPUTE_DIV_FACT")

test_that("Check some equalities", {
  expect_equal(ComputeDivFact(100, c(20, 80)), choose(100, 20))
  expect_equal(ComputeDivFact(100, c(20, 80), out.log = TRUE),
               lchoose(100, 20))
  expect_equal(ComputeDivFact(100), factorial(100))
  expect_equal(ComputeDivFact(100, out.log = TRUE),
               lfactorial(100))
})

test_that("Check some equalities with wikipedia", {
  test <- function(k, N, K, n) {
    ComputeDivFact(c(K, (N-K), n, (N-n)),
                   c(k, (K-k), (n-k), (N-K-n+k), N))
  }

  expect_equal(test(4, 50, 5, 10), 0.003964583)
  expect_equal(test(5, 50, 5, 10), 0.0001189375)
})




