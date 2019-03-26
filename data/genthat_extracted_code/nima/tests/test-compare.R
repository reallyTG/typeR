library(nima)
context("Checking whether comparisons work")

test_that("compFun finds differences in vectors", {
  expect_equal(
    compFun(
      c(5, 8, 9, NA, 3, NA), c(5, 2, 9, 4, NA, NA)
    ),
    c(TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
  )
})

test_that("compFun works to differentiate random matrices", {
  expect_equal(
    sum(compFun(
      matrix(rnorm(1000), ncol = 20),
      matrix(rbinom(1000, 1, 0.6), ncol = 20)
    )),
    0
  )
})

test_that("compFun works on all elements over list structures", {
  expect_equal(
    compFun(
      as.list(c(1, 2, 3, 4, 5, NA)),
      as.list(c(1, NA, 2, 3, 5, 4))
    ),
    as.list(c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE))
  )
})


test_that("compFun works on all elements in data frames", {
  expect_equal(
    compFun(
      data.frame(cbind(c(2, 3, 4), c(4, 5, 6))),
      data.frame(cbind(c(5, 3, 6), c(4, 5, 6)))
    ),
    as.matrix(data.frame(cbind(
      c(FALSE, TRUE, FALSE),
      c(TRUE, TRUE, TRUE)
    )))
  )
})
