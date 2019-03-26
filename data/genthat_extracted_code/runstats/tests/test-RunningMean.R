context("Checking RunningMean")

test_that("Checking mean of RunningMean hasn't changed  (with circular = TRUE)" , {
  set.seed(20180618)
  x <- rnorm(1000)
  output <- RunningMean(x, 100, circular = TRUE)
  expect_equal(mean(output), -0.00740616601618133)
})

test_that("Checking mean of RunningMean hasn't changed  (with circular = FALSE)", {
  set.seed(20180618)
  x <- rnorm(1000)
  output <- RunningMean(x, 100, circular = FALSE)
  expect_equal(mean(output, na.rm = TRUE), -0.00971309884119209)
})



RunningMean.CONV <- function(x, W, circular){

  out <- numeric()
  l_x <- length(x)

  out <- sapply(1:(l_x - W + 1), function(i){
    segm <- x[i:(i+W-1)]
    mean(segm)
  })

  if (circular) {
    out.tail <- sapply((l_x - W + 2):l_x, function(i){
      segm <- c(x[i:l_x], x[1:(W-l_x+i-1)])
      mean(segm)
    })
  } else {
    out.tail <- rep(NA, W-1)
  }
  out <- c(out, out.tail)

  return(out)
}


test_that("Checking RunningMean via FFT returns what is equivalent with conventional computation (with circular = TRUE)", {

  set.seed(20180618)

  x <- rnorm(1000)
  output      <- RunningMean(x, 100, circular = TRUE)
  output.conv <- RunningMean.CONV(x, 100, circular = TRUE)
  max.diff    <- max(abs(output - output.conv))

  expect_equal(max.diff, 0, tolerance = 1e-8)
})


test_that("Checking RunningMean via FFT returns what is equivalent with conventional computation (with circular = FALSE)", {

  set.seed(20180618)

  x <- rnorm(1000)
  output      <- RunningMean(x, 100, circular = FALSE)
  output.conv <- RunningMean.CONV(x, 100, circular = FALSE)

  expect_true(all(is.na(output) == is.na(output.conv)))

  max.diff  <- max(abs(output - output.conv), na.rm = TRUE)
  expect_equal(max.diff, 0, tolerance = 1e-8)
})



test_that("Checking error is thrown when W is larger than the length of x", {
  set.seed(20180618)
  x <- rnorm(10)
  W <- 11
  expect_error(RunningMean(x, W, circular = FALSE))
  expect_error(RunningMean(x, W, circular = TRUE))
})





