context("test-dtriangle")

test_that("dtriangle", {
  expect_equal(dtriangle(1, 1, 3, 2), 0)
  expect_equal(dtriangle(3, 0, 3, 2), 0)
  expect_equal(dtriangle(-1, -1, 3, 2), 0)
  expect_equal(dtriangle(.5, 0, 1, .5), 2)
  expect_warning(expect_equal(dtriangle(0, 0, 0, 0), NaN))
  expect_warning(expect_equal(dtriangle(.5, 0, 1, 2), NaN))
  expect_warning(expect_equal(dtriangle(.5, 1, 2, .5), NaN))
  expect_equal(dtriangle(c(1, 3, -1, .5), c(1, 0, -1, 0), c(3, 3, 3, 1),
                               c(2, 2, 2, .5)), c(0, 0, 0, 2))
  expect_warning(expect_equal(dtriangle(c(.5, .6), c(0, 0), c(1, 1),
                                         c(.5, 1.5)), c(2, NaN)))
  # regression test
  expect_true(all(!is.nan(dtriangle(0:10, a = 2, b = 5, c = 2))))
  expect_warning(expect_true(is.nan(dtriangle(.5, 1, 1, 1))))

  # more case testing
  expect_equal(dtriangle(0, 1, 3, 2), 0)
  expect_equal(dtriangle(1, 1, 3, 2), 0)
  expect_equal(dtriangle(1.5, 1, 3, 2), 0.5)
  expect_equal(dtriangle(2, 1, 3, 2), 1)
  expect_equal(dtriangle(2.5, 1, 3, 2), 0.5)
  expect_equal(dtriangle(3, 1, 3, 2), 0)
  expect_equal(dtriangle(4, 1, 3, 2), 0)

  expect_equal(dtriangle(0, 1, 3, 1), 0)
  expect_equal(dtriangle(1, 1, 3, 1), 1)
  expect_equal(dtriangle(2, 1, 3, 1), 0.5)
  expect_equal(dtriangle(3, 1, 3, 1), 0)
  expect_equal(dtriangle(4, 1, 3, 1), 0)

  expect_equal(dtriangle(0, 1, 3, 3), 0)
  expect_equal(dtriangle(1, 1, 3, 3), 0)
  expect_equal(dtriangle(2, 1, 3, 3), 0.5)
  expect_equal(dtriangle(3, 1, 3, 3), 1)
  expect_equal(dtriangle(4, 1, 3, 3), 0)

  expect_true(is.na(dtriangle(.5, 0, NA, 3)))
  expect_true(is.nan(dtriangle(.5, 0, 5, NaN)))
  expect_true(is.nan(dtriangle(.5, 0, Inf, 3)))

  expect_error(dtriangle(c(1,2,3), c(1,2,3), c(4,5), c(1,2,3)))
})
