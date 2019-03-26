context("test check.stopping")

test_that("test check.stopping",{

  X <- c(2.7668157, 1.8931580, 1.8859049, 1.0575971, 1.0329016, 0.9095669,
         0.6395215, 0.5073142, 0.3205904, 0.3125665)

  expected_vec <- c(0.379450739, 0.003838584, 0.578408288, 0.023627539,
                    0.127158683, 0.352248264, 0.231589695, 0.458966294,
                    0.025346914)

  res <- check.stopping(X, 0.6)

  expect_length(res,4)
  expect_type(res, "list")
  expect_equal(res$status, 1)
  expect_equal(res$eigen.value, X)
  expect_equal(round(res$eigen.fit,5), round(0.578408288,5))
  expect_equal(res$threshold, 0.6)

  res <- check.stopping(X, 0.3)

  expect_length(res,5)
  expect_type(res, "list")
  expect_equal(res$status, 0)
  expect_equal(res$eigen.value, X)
  expect_equal(round(res$eigen.fit,5), round(0.578408288,5))
  expect_equal(res$threshold, 0.3)
  expect_equal(res$no.significant.PC, 3)

})
