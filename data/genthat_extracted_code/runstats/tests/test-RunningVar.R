context("Checking RunningVar")

test_that("Checking mean of RunningVar hasn't changed  (with circular = TRUE)" , {
  set.seed(20180618)
  x <- rnorm(1000)
  output <- RunningVar(x, 100, circular = TRUE)
  expect_equal(mean(output), 0.987951966793899)
})

test_that("Checking mean of RunningVar hasn't changed  (with circular = FALSE)", {
  set.seed(20180618)
  x <- rnorm(1000)
  output <- RunningVar(x, 100, circular = FALSE)
  expect_equal(mean(output, na.rm = TRUE), 0.978883021627162)
})



RunningVar.CONV <- function(x, W, circular){

  out <- numeric()
  l_x <- length(x)

  out <- sapply(1:(l_x - W + 1), function(i){
    segm <- x[i:(i+W-1)]
    var(segm)
  })

  if (circular) {
    out.tail <- sapply((l_x - W + 2):l_x, function(i){
      segm <- c(x[i:l_x], x[1:(W-l_x+i-1)])
      var(segm)
    })
  } else {
    out.tail <- rep(NA, W-1)
  }
  out <- c(out, out.tail)

  return(out)
}


test_that("Checking RunningVar via FFT returns what is equivalent with conventional computation (with circular = TRUE)", {
  set.seed(20180618)
  x <- rnorm(1000)
  output      <- RunningVar(x, 100, circular = TRUE)
  output.conv <- RunningVar.CONV(x, 100, circular = TRUE)
  max.diff    <- max(abs(output - output.conv))
  expect_equal(max.diff, 0, tolerance = 1e-8)
})


test_that("Checking RunningVar via FFT returns what is equivalent with conventional computation (with circular = FALSE)", {

  set.seed(20180618)
  x <- rnorm(1000)
  output      <- RunningVar(x, 100, circular = FALSE)
  output.conv <- RunningVar.CONV(x, 100, circular = FALSE)

  expect_true(all(is.na(output) == is.na(output.conv)))

  max.diff  <- max(abs(output - output.conv), na.rm = TRUE)
  expect_equal(max.diff, 0, tolerance = 1e-8)

})


test_that("Checking error is thrown when W is larger than the length of x", {
  set.seed(20180618)
  x <- rnorm(10)
  W <- 11
  expect_error(RunningVar(x, W, circular = FALSE))
  expect_error(RunningVar(x, W, circular = TRUE))
})
