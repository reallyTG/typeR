context("internal statistical functions return expected values")
library(tbrf)


test_that("mean_ci returns expected results", {
  x <- rnorm(10, 1)

  x1 <- tbrf::mean_ci(x)
  x2 <- mean(x)

  expect_equal(unname(x1[1]), x2)

  #randomly choose 2 indices to replace
  ind <- which(x %in% sample(x, 2))
  x[ind] <- NA

  x1 <- tbrf::mean_ci(x, na.rm = TRUE)
  x2 <- mean(x, na.rm = TRUE)
  expect_equal(unname(x1[1]), x2)
  })

test_that("median_ci returns expected results", {
  x <- rnorm(10, 1)

  x1 <- tbrf::median_ci(x)
  x2 <- tbrf::median_ci(x)
  x3 <- median(x)

  expect_equal(unname(x1[1]), x3)
  expect_equal(unname(x2[1]), x3)

  #randomly choose 2 indices to replace
  ind <- which(x %in% sample(x, 2))
  x[ind] <- NA

  x1 <- tbrf::median_ci(x, na.rm = TRUE)
  x2 <- tbrf::median_ci(x, na.rm = TRUE)
  x3 <- median(x, na.rm = TRUE)

  expect_equal(unname(x1[1]), x3)
  expect_equal(unname(x2[1]), x3)
})


test_that("binom_ci returns expected results", {
  x <- rbinom(20, 1, 0.25)
  n <- as.numeric(length(x))
  x <- as.numeric(sum(x))

  x1 <- tbrf::binom_ci(x, n, alpha = 0.05, method = "exact")
  x2 <- binom.test(x, n)

  expect_equal(unname(x1[1]), unname(x2$estimate))
  expect_equal(unname(x1[2]), x2$conf.int[1])
  expect_equal(unname(x1[3]), x2$conf.int[2])

  x1 <- tbrf::binom_ci(x, n, alpha = 0.05, method = "wilson")
  expect_equal(unname(x1[1]), unname(x2$estimate))

  x1 <- tbrf::binom_ci(x, n, alpha = 0.05, method = "asymptotic")
  expect_equal(unname(x1[1]), unname(x2$estimate))

})
