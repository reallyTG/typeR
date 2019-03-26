context("Checking RunningL2Norm")

RunningL2Norm.CONV <- function(x, y, circular){

  out <- numeric()
  W <- length(y)
  l_x <- length(x)

  out <- sapply(1:(l_x - W + 1), function(i){
    segm <- x[i:(i+W-1)]
    dist(rbind(segm, y), method = "euclidean")
  })

  if (circular) {
    out.tail <- sapply((l_x - W + 2):l_x, function(i){
      segm <- c(x[i:l_x], x[1:(W-l_x+i-1)])
      dist(rbind(segm, y), method = "euclidean")
    })
  } else {
    out.tail <- rep(NA, W-1)
  }

  out <- c(out, out.tail)

  return(out)
}


test_that("Checking RunningL2Norm via FFT returns what is equivalent with conventional computation (with circular = TRUE)", {
  x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
  y <- x[1:100]
  output      <- RunningL2Norm(x, y, circular = TRUE)
  output.conv <- RunningL2Norm.CONV(x, y, circular = TRUE)
  max.diff    <- max(abs(output - output.conv))
  expect_equal(max.diff, 0, tolerance = 1e-8)
})


test_that("Checking RunningL2Norm via FFT returns what is equivalent with conventional computation (with circular = FALSE)", {

  x <- sin(seq(0, 1, length.out = 1000) * 2 * pi * 6)
  y <- x[1:100]

  output      <- RunningL2Norm(x, y, circular = FALSE)
  output.conv <- RunningL2Norm.CONV(x, y, circular = FALSE)

  max.diff    <- max(abs(output - output.conv), na.rm = TRUE)
  expect_equal(max.diff, 0, tolerance = 1e-8)

  expect_true(all(is.na(output) == is.na(output.conv)))
})




test_that("Checking error is thrown when the length of y is larger than the length of x", {
  set.seed(20180618)
  x <- rnorm(10)
  W <- 11
  y <- rnorm(W)
  expect_error(RunningL2Norm(x, y, circular = FALSE))
  expect_error(RunningL2Norm(x, y, circular = TRUE))
})

