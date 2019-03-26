context("test-qtriangle")

test_that("qtriangle", {
  expect_equal(qtriangle(0, 1, 3, 2), 1)
  expect_equal(qtriangle(0, 0, 3, 2), 0)
  expect_equal(qtriangle(0, -1, 3, 2), -1)
  expect_equal(qtriangle(1, 1, 3, 2), 3)
  expect_equal(qtriangle(1, -3, -1, -2), -1)
  expect_equal(qtriangle(.5, 0, 1, .5), .5)
  expect_equal(qtriangle(0, 0, 0, 0), 0)
  expect_warning(expect_equal(qtriangle(-1, 0, 1, .5), NaN))
  expect_warning(expect_equal(qtriangle(2, 0, 1, .5), NaN))
  expect_warning(expect_equal(qtriangle(.5, 0, 1, 2), NaN))
  expect_warning(expect_equal(qtriangle(.5, 1, 2, .5), NaN))
  expect_equal(qtriangle(.5, NA, 2, .5), NA)
  expect_equal(qtriangle(c(0, 0, 0, 1, 1, .5), c(1, 0, -1, 1, -3, 0),
                               c(3, 3, 3, 3, -1, 1), c(2, 2, 2, 2, -2, .5)),
                     c(1, 0, -1, 3, -1, .5))
  expect_warning(expect_equal(qtriangle(c(.5, -1, NA), c(0, 0, 0), c(1, 1, 1),
                                         c(.5, .5, .5)), c(.5, NaN, NA)))
  expect_equal(qtriangle(c(0, 1, 0), 1, 2, 1.5), c(1, 2, 1))
  expect_error(qtriangle(c(0, 0, 0, 0, 0), c(0, 0), 1, .5))
  expect_equal(qtriangle(.5, NaN, 2, 1), NaN)
  expect_equal(qtriangle(.5, -Inf, 2, 1), NaN)
  expect_equal(qtriangle(.5, 0, Inf, 1), NaN)
  expect_equal(qtriangle(.5, -Inf, Inf, 1), NaN)
  expect_equal(qtriangle(.5, 0, Inf, Inf), NaN)

  # From a Bug Report, Michael.Scroggie@dse.vic.gov.au, Thursday 10/19/06
  expect_true(!all(0 == qtriangle(runif(10), 0, 1, 0)))
  expect_true(!all(5 == qtriangle(runif(10), 2, 5, 5)))
  expect_true(all(1 == qtriangle(runif(10), 1, 1, 1)))
  expect_true(all(-1 == qtriangle(runif(10), -1, -1, -1)))

  expect_equal(qtriangle(ptriangle(.5, 0, 1, 0), 0, 1, 0), 0.5)
  expect_equal(qtriangle(ptriangle(3, 2, 5, 5), 2, 5, 5), 3)
  expect_equal(qtriangle(ptriangle(5, 2, 5, 5), 2, 5, 5), 5)

  expect_equal(5, qtriangle(1, 1, 5, 5))
  expect_equal(5, qtriangle(1, 1, 5 + .Machine$double.eps, 5))
  expect_equal(5, qtriangle(1 - 2 * .Machine$double.eps, 1, 5, 5))

  # these tests both failed until the numeric tolerance was increased to 2*.Machine$double.eps
  expect_true(all(qtriangle(seq(0, 1, by = 0.1), 0, 10, 3) >= 0.0))
  expect_equal(3, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 10, 3))
  # this test failed until the numeric tolerance was increased to 10*.Machine$double.eps
  expect_equal(30, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 100, 30))
  # increased tolerance relative to the base of the triangle
  expect_equal(300, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 1000, 300))
  expect_equal(3000, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 10000, 3000))
  expect_equal(30000, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 100000, 30000))
  expect_equal(300000, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 1000000, 300000))
  expect_equal(3000000, qtriangle(0.0 + 0.1 + 0.1 + 0.1, 0, 10000000, 3000000))
})
