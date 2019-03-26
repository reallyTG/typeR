context("test-strider.R")

test_that("row_sums are correct", {
  x = matrix(1:9, 3)
  expect_equal(row_sums(x), rowSums(x))
})

test_that("col_sums are correct", {
  x = matrix(1:9, 3)
  expect_equal(col_sums(x), colSums(x))
})

test_that("convolve2 is correct", {
  rconv2 = function(a, b)
  {
    ab = matrix(nrow = nrow(a) + nrow(b) - 1,
                ncol = ncol(a) + ncol(b) - 1,
                data = 0)
    for (i in 1:ncol(a) - 1)
      for (j in 1:ncol(b) - 1)
        for (k in 1:nrow(a) - 1)
          for (l in 1:nrow(b) - 1)
            ab[k + l + 1, i + j + 1] =
              ab[k + l + 1, i + j + 1] +
              a[k + 1, i + 1] * b[l + 1, j + 1]
    return(ab)
  }
  a = matrix(c(1, 2, 1,
               1, 1, 1), 2, 3, byrow = TRUE)
  b = matrix(c(0, 0, 0,
               0, 0, 0,
               0, 1, 0,
               0, 0, 0), 4, 3, byrow = TRUE)
  expect_identical(rconv2(a, b), convolve2(a, b))
  expect_identical(t(convolve2(a, b)), convolve2(t(a), t(b)))
})
