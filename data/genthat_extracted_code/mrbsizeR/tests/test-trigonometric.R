context("trigonometric")

test_that("discrete Fourier transform matrix is correct", {
  set.seed(987)
  testMatrix <- matrix(sample(1:10, size = 25, replace = TRUE), nrow = 5)
  D <- dftMatrix(5)
  fftTrans <- D %*% testMatrix
  
  expect_equal(fftTrans, apply(testMatrix, MARGIN = 2, FUN = fft))
  }
)