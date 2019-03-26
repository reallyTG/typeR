context("testing internal functions")

test_that("'dqrls_wrap' gives the same as `lm.fit`", {
  set.seed(73640893)
  n <- 1000
  p <- 5
  X <- matrix(nrow = n, ncol = p)
  for(i in 1:p)
    X[, i] <- rnorm(n, sd = sqrt(p - i + 1L))
  y <- rnorm(n) + rowSums(X)
  X <- cbind(X[, 1:3], X[, 3:p])

  lm_res   <- lm.fit                  (X, y)
  wrap_res <- parglm:::dqrls_wrap_test(X, y, glm.control()$epsilon)

  expect_equal(lm_res$qr$qr, wrap_res$qr)
  expect_equal(lm_res$qr$qraux, drop(wrap_res$qraux))
  expect_equal(lm_res$qr$rank, wrap_res$rank)
  expect_equal(lm_res$coefficients[lm_res$qr$pivot],
               drop(wrap_res$coefficients), check.attributes = FALSE)
  expect_equal(lm_res$qr$pivot, drop(wrap_res$pivot))
})
