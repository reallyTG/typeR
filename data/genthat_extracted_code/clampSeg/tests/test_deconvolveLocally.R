
context("deconvolveLocally")

getConvolutionJump <- function(leftValue, rightValue, cp, filter, truncated = TRUE) {
  if (truncated) {
    ret <- function(t) {
      leftValue * (1 - filter$truncatedStepfun(t - cp)) + 
        rightValue * filter$truncatedStepfun(t - cp)
    }
  } else {
    ret <- function(t) {
      leftValue * (1 - filter$stepfun(t - cp)) + rightValue * filter$stepfun(t - cp)
    }
  }
  ret
}

getConvolutionPeak <- function(leftValue, rightValue, cp1, cp2, value, filter, truncated = TRUE) {
  if (truncated) {
    ret <-   function(t) {
      leftValue * (1 - filter$truncatedStepfun(t - cp1)) + 
        value * (filter$truncatedStepfun(t - cp1) - filter$truncatedStepfun(t - cp2)) + 
        rightValue * filter$truncatedStepfun(t - cp2)
    }
  } else {
    ret <-   function(t) {
      leftValue * (1 - filter$stepfun(t - cp1)) + 
        value * (filter$stepfun(t - cp1) - filter$stepfun(t - cp2)) + 
        rightValue * filter$stepfun(t - cp2)
    }
  }
  ret
}


testJump <- function(grid, time, data, filter, correlations, leftValue, rightValue) {
  len <- length(data)
  m <- min(len, length(correlations) - 1L)
  
  if (len == 1) {
    A <- matrix(correlations[1], 1, 1)
  } else {
    A <- matrix(0, len, len)
    for (i in 1:(len - 1)) {
      A[i, i] <- correlations[1]
      A[i, i + 1:min(m, len - i)] <- correlations[2:min(m + 1, len - i + 1)]
      A[i + 1:min(m, len - i), i] <- correlations[2:min(m + 1, len - i + 1)]
    }
    A[len, len] <- correlations[1]  
  }
  
  costs <- numeric(length(grid))
  
  for (i in seq(along = grid)) {
    mu <- getConvolutionJump(leftValue, rightValue, grid[i], filter) 
    costs[i] <- sum((data - mu(time)) * solve(A, data - mu(time)))
  }
  
  grid[which.min(costs)]
}

testPeak <- function(gridLeft, gridRight, time, data, filter, correlations, leftValue, rightValue, tol) {
  len <- length(data)
  m <- min(len, length(correlations) - 1L)
  
  if (len == 1) {
    A <- matrix(correlations[1], 1, 1)
  } else {
    A <- matrix(0, len, len)
    for (i in 1:(len - 1)) {
      A[i, i] <- correlations[1]
      A[i, i + 1:min(m, len - i)] <- correlations[2:min(m + 1, len - i + 1)]
      A[i + 1:min(m, len - i), i] <- correlations[2:min(m + 1, len - i + 1)]
    }
    A[len, len] <- correlations[1]  
  }
  
  costs <- numeric(length(gridLeft) * length(gridRight))
  costs <- rep(NA, length(gridLeft) * length(gridRight))
  cp1 <- integer(length(gridLeft) * length(gridRight))
  cp2 <- integer(length(gridLeft) * length(gridRight))
  value <- numeric(length(gridLeft) * length(gridRight))
  index <- 0
  
  for (left in gridLeft) {
    for (right in gridRight[gridRight > left + tol]) {
      index <- index + 1
      cp1[index] <- left
      cp2[index] <- right
      
      Fleft <- filter$truncatedStepfun(time - left)
      Fright <- filter$truncatedStepfun(time - right)
      w <- Fleft - Fright
      
      sol <- solve(A, w)
      
      value[index] <- sum((data - leftValue * (1 - Fleft) - rightValue * Fright) * sol) / sum(w * sol)
      
      convolvedSignal <- getConvolutionPeak(leftValue, rightValue, left, right, value[index], filter)
      costs[index] <- sum((data - convolvedSignal(time)) * solve(A, data - convolvedSignal(time)))
    }
  }
  
  index <- which.min(costs[!is.na(costs)])
  list(left = cp1[index], right = cp2[index], value = value[index])
}

# a simple way to filter data, not very precise, but enough for test purposes
.convolve <- function(data, filter) {
  stats::filter(data, filter$kern, sides = 1)[-c(1:filter$len)] / sqrt(sum(filter$kern^2))
}

library(stepR)

test_that("single long interval is handled correctly and that fit, filter and data have to be given", {
  testfit <- stepblock(leftEnd = 0, rightEnd = 100, value = 1, x0 = 0)
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = 0, rightEnd = 100, value = median(testdata[8:92]), x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  attr(compare, "noDeconvolution") <- integer(0)
  
  expect_error(deconvolveLocally())
  expect_error(deconvolveLocally(fit = testfit))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter))
  expect_error(deconvolveLocally(fit = testfit, data = testdata))
  expect_error(deconvolveLocally(filter = testfilter, data = testdata))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata), compare)
})

test_that("fit, filter and data are tested", {
  testfit <- stepblock(leftEnd = 0, rightEnd = 100, value = 1, x0 = 0)
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = 0, rightEnd = 100, value = median(testdata[8:92]), x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  attr(compare, "noDeconvolution") <- integer(0)
  
  expect_error(deconvolveLocally(fit = list(leftEnd = 1, rightEnd = 10, value = 1),
                                 filter = testfilter, data = testdata))
  expect_error(deconvolveLocally(fit = testfit, filter = list(test = 1), data = testdata))
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = c(testdata, "s")))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = NULL))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = c(testdata, Inf)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = c(testdata, NA)))
})

test_that("output is tested and works", {
  testfit <- stepblock(leftEnd = 0, rightEnd = 100, value = 1, x0 = 0)
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = 0, rightEnd = 100, value = median(testdata[8:92]), x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compareall, "noDeconvolution") <- integer(0)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = 1))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 output = c("only", "every")))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "aha"))
  
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata),
                   compare)
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "only"))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "every"),
                   compareall)
  
  expect_identical(deconvolveLocally(fit = list(fit = testfit, stepfit = testfit, q = 1,
                                                filter = testfilter, sd = 1),
                                     filter = testfilter, data = testdata),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  
  expect_identical(deconvolveLocally(fit = list(fit = testfit, stepfit = testfit, q = 1,
                                                filter = testfilter, sd = 1),
                                     filter = testfilter, data = testdata, output = "every"),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "every"))
})

test_that("a single short segment is handled correctly", {
  testfit <- stepblock(leftEnd = 0, rightEnd = 5, value = 1, x0 = 0)
  testdata <- rnorm(5)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = 0, rightEnd = 5, value = 1, x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- 1L
  attr(compareall, "noDeconvolution") <- 1L
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
})

test_that("a single jump is deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100), rightEnd = c(100, 200), value = c(0, 1), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[8:92])
  rightValue <- median(testdata[108:192])
  cor <- testfilter$acf
  cor[1] <- 2
  cp <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare1 <- stepblock(leftEnd = c(0, cp), rightEnd = c(cp, 200), value = c(leftValue, rightValue),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp <- testJump(seq(cp - 1, cp + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare2 <- stepblock(leftEnd = c(0, cp), rightEnd = c(cp, 200), value = c(leftValue, rightValue),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp <- testJump(seq(cp - 0.1, cp + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor,
                 leftValue, rightValue)
  compare3 <- stepblock(leftEnd = c(0, cp), rightEnd = c(cp, 200), value = c(leftValue, rightValue),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a single peak is deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 103), rightEnd = c(100, 103, 200), value = c(0, 1, 0), x0 = 0)
  testdata <- c(rnorm(108), rnorm(3, 1), rnorm(97))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[8:92])
  rightValue <- median(testdata[111:192])
  cor <- testfilter$acf
  cor[1] <- 2
  ret <- testPeak(92:100, 95:103, 93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("segments that cannot be deconvolved are detected and handled correctly", {
  testfit <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 104), value = c(0, 1), x0 = 0)
  testdata <- rnorm(104)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 104), value = c(0, median(testdata[12:96])),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- 1L
  attr(compareall, "noDeconvolution") <- 1L
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
  
  
  testfit <- stepblock(leftEnd = c(0, 100), rightEnd = c(100, 104), value = c(0, 1), x0 = 0)
  testdata <- rnorm(104)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 100), rightEnd = c(100, 104), value = c(median(testdata[8:92]), 1),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- 2L
  attr(compareall, "noDeconvolution") <- 2L
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
  
  
  testfit <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 8), value = c(0, 1), x0 = 0)
  testdata <- rnorm(8)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 8), value = c(0, 1),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- c(1L, 2L)
  attr(compareall, "noDeconvolution") <- c(1L, 2L)
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
  
  
  testfit <- stepblock(leftEnd = c(0, 4, 100), rightEnd = c(4, 100, 104), value = c(0, 1, 0), x0 = 0)
  testdata <- rnorm(104)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 4, 100), rightEnd = c(4, 100, 104),
                       value = c(0, median(testdata[12:92]), 0),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- c(1L, 3L)
  attr(compareall, "noDeconvolution") <- c(1L, 3L)
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
  
  
  testfit <- stepblock(leftEnd = c(0, 100, 104), rightEnd = c(100, 104, 108), value = c(0, 1, 0), x0 = 0)
  testdata <- rnorm(108)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 100, 104), rightEnd = c(100, 104, 108),
                       value = c(median(testdata[8:92]), 1, 0),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- c(2L, 3L)
  attr(compareall, "noDeconvolution") <- c(2L, 3L)
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
  
  
  testfit <- stepblock(leftEnd = c(0, 100, 104, 108), rightEnd = c(100, 104, 108, 208),
                       value = c(0, 1, 0, 1), x0 = 0)
  testdata <- rnorm(208)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 100, 104, 108), rightEnd = c(100, 104, 108, 208),
                       value = c(median(testdata[8:92]), 1, 0, median(testdata[116:200])),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  compareall <- list(compare, compare, compare)
  attr(compare, "noDeconvolution") <- c(2L, 3L)
  attr(compareall, "noDeconvolution") <- c(2L, 3L)
  
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata))
  expect_identical(ret, compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          output = "every"))
  expect_identical(ret, compareall)
})

test_that("noDeconvolution warning can be suppressed and that suppressWarningNoDeconvolution is tested", {
  testfit <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 104), value = c(0, 1), x0 = 0)
  testdata <- rnorm(104)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  compare <- stepblock(leftEnd = c(0, 4), rightEnd = c(4, 104), value = c(0, median(testdata[12:96])),
                       x0 = 0)
  class(compare) <- c("localDeconvolution", class(compare))
  attr(compare, "noDeconvolution") <- 1L

  
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     suppressWarningNoDeconvolution = TRUE), compare)
  expect_warning(ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                          suppressWarningNoDeconvolution = FALSE))
  expect_identical(ret, compare)
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 suppressWarningNoDeconvolution = c(TRUE, TRUE)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 suppressWarningNoDeconvolution = 1))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 suppressWarningNoDeconvolution = NA))
})

test_that("two jumps are deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 200), rightEnd = c(100, 200, 300), value = c(0, 1, 0), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(100))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[208:292])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(192:200, 193:207, testdata[193:207], testfilter, cor, value2, value3)
  compare1 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 300),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 1, cp2 + 1, 0.1), 193:207, testdata[193:207], testfilter, cor, value2, value3)
  compare2 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 300),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.1, cp2 + 0.1, 0.01), 193:207, testdata[193:207],
                  testfilter, cor, value2, value3)
  compare3 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 300),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a jump and a peak are deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203), rightEnd = c(100, 200, 203, 300),
                       value = c(0, 1, 0, 1), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3), rnorm(97, 1))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret$left, ret$right),
                        rightEnd = c(cp1, ret$left, ret$right, 300),
                        value = c(value1, value2, ret$value, value3), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret$left, ret$right),
                        rightEnd = c(cp1, ret$left, ret$right, 300),
                        value = c(value1, value2, ret$value, value3), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret$left, ret$right),
                        rightEnd = c(cp1, ret$left, ret$right, 300),
                        value = c(value1, value2, ret$value, value3), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("two peaks are deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 103, 200, 203), rightEnd = c(100, 103, 200, 203, 300),
                       value = c(0, 1, 0, 1, 0), x0 = 0)
  testdata <- c(rnorm(108), rnorm(3, 1), rnorm(97), rnorm(3, 1), rnorm(97))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[111:192])
  value3 <- median(testdata[211:292])
  cor <- testfilter$acf
  cor[1] <- 2
  ret1 <- testPeak(92:100, 95:103, 93:110, testdata[93:110], testfilter, cor, value1, value2,
                  1e-6 / testfilter$sr)
  ret2 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, ret1$left, ret1$right, ret2$left, ret2$right),
                        rightEnd = c(ret1$left, ret1$right, ret2$left, ret2$right, 300),
                        value = c(value1, ret1$value, value2, ret2$value, value3), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                  93:110, testdata[93:110], testfilter, cor, value1, value2,
                  1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, ret1$left, ret1$right, ret2$left, ret2$right),
                        rightEnd = c(ret1$left, ret1$right, ret2$left, ret2$right, 300),
                        value = c(value1, ret1$value, value2, ret2$value, value3), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   93:110, testdata[93:110], testfilter, cor, value1, value2,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, ret1$left, ret1$right, ret2$left, ret2$right),
                        rightEnd = c(ret1$left, ret1$right, ret2$left, ret2$right, 300),
                        value = c(value1, ret1$value, value2, ret2$value, value3), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a single jump and a non deconvolvable segment are handled correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 197), rightEnd = c(100, 197, 200), value = c(0, 1, 2), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[8:92])
  rightValue <- median(testdata[108:189])
  cor <- testfilter$acf
  cor[1] <- 2
  cp <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare1 <- stepblock(leftEnd = c(0, cp, 197), rightEnd = c(cp, 197, 200),
                        value = c(leftValue, rightValue, 2), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp <- testJump(seq(cp - 1, cp + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare2 <- stepblock(leftEnd = c(0, cp, 197), rightEnd = c(cp, 197, 200),
                        value = c(leftValue, rightValue, 2), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp <- testJump(seq(cp - 0.1, cp + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor,
                 leftValue, rightValue)
  compare3 <- stepblock(leftEnd = c(0, cp, 197), rightEnd = c(cp, 197, 200),
                        value = c(leftValue, rightValue, 2), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- 3L
  attr(compare3, "noDeconvolution") <- 3L
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- 3L
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a single peak and a non deconvolvable segment are handled correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 103, 197), rightEnd = c(100, 103, 197, 200),
                       value = c(0, 1, 0, 3), x0 = 0)
  testdata <- c(rnorm(108), rnorm(3, 1), rnorm(97))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[8:92])
  rightValue <- median(testdata[111:189])
  cor <- testfilter$acf
  cor[1] <- 2
  ret <- testPeak(92:100, 95:103, 93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, ret$left, ret$right, 197),
                        rightEnd = c(ret$left, ret$right, 197, 200),
                        value = c(leftValue, ret$value, rightValue, 3), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, ret$left, ret$right, 197),
                        rightEnd = c(ret$left, ret$right, 197, 200),
                        value = c(leftValue, ret$value, rightValue, 3), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, ret$left, ret$right, 197),
                        rightEnd = c(ret$left, ret$right, 197, 200),
                        value = c(leftValue, ret$value, rightValue, 3), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- 4L
  attr(compare3, "noDeconvolution") <- 4L
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- 4L
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a non deconvolvable segment and a single jump are handled correctly", {
  testfit <- stepblock(leftEnd = c(0, 3, 100), rightEnd = c(3, 100, 200), value = c(0, 0, 1), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[11:92])
  rightValue <- median(testdata[108:192])
  cor <- testfilter$acf
  cor[1] <- 2
  cp <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare1 <- stepblock(leftEnd = c(0, 3, cp), rightEnd = c(3, cp, 200), value = c(0, leftValue, rightValue),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp <- testJump(seq(cp - 1, cp + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, leftValue, rightValue)
  compare2 <- stepblock(leftEnd = c(0, 3, cp), rightEnd = c(3, cp, 200), value = c(0, leftValue, rightValue),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp <- testJump(seq(cp - 0.1, cp + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor,
                 leftValue, rightValue)
  compare3 <- stepblock(leftEnd = c(0, 3, cp), rightEnd = c(3, cp, 200), value = c(0, leftValue, rightValue),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- 1L
  attr(compare3, "noDeconvolution") <- 1L
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- 1L
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a non deconvolvable segment and a single peak are handled correctly", {
  testfit <- stepblock(leftEnd = c(0, 3, 100, 103), rightEnd = c(3, 100, 103, 200),
                       value = c(7, 0, 1, 0), x0 = 0)
  testdata <- c(rnorm(108), rnorm(3, 1), rnorm(97))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  leftValue <- median(testdata[11:92])
  rightValue <- median(testdata[111:192])
  cor <- testfilter$acf
  cor[1] <- 2
  ret <- testPeak(92:100, 95:103, 93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, 3, ret$left, ret$right), rightEnd = c(3, ret$left, ret$right, 200),
                        value = c(7, leftValue, ret$value, rightValue), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, 3, ret$left, ret$right), rightEnd = c(3, ret$left, ret$right, 200),
                        value = c(7, leftValue, ret$value, rightValue), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  93:110, testdata[93:110], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, 3, ret$left, ret$right), rightEnd = c(3, ret$left, ret$right, 200),
                        value = c(7, leftValue, ret$value, rightValue), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- 1L
  attr(compare3, "noDeconvolution") <- 1L
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid")
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- 1L
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a complicated scenario is deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[16:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[314:392])
  value5 <- median(testdata[408:483])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(392:400, 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 1, cp2 + 1, 0.1), 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.1, cp2 + 0.1, 0.01), 393:407, testdata[393:407],
                  testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  attr(compare3, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("a complicated scenario is deconvolved correctly", {
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[315:392])
  value5 <- median(testdata[411:492])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(392:400, 395:403, 393:410, testdata[393:410], testfilter, cor, value4, value5,
                   1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(5L, 6L, 7L)
  attr(compare3, "noDeconvolution") <- c(5L, 6L, 7L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(5L, 6L, 7L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("argument startTime is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, startTime = "s"))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, startTime = c(0, 1)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, startTime = Inf))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 startTime = as.numeric(NA)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, startTime = NULL))
  
  testfit <- stepblock(leftEnd = 23.5465 + c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = 23.5465 + c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 23.5465)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[16:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[314:392])
  value5 <- median(testdata[408:483])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(392:400, 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = 23.5465 + c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                              cp2, 491, 496),
                        rightEnd = 23.5465 + c(3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                               cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 23.5465)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 1, cp2 + 1, 0.1), 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = 23.5465 + c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                              cp2, 491, 496),
                        rightEnd = 23.5465 + c(3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                               cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 23.5465)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.1, cp2 + 0.1, 0.01), 393:407, testdata[393:407],
                  testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = 23.5465 + c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                              cp2, 491, 496),
                        rightEnd = 23.5465 + c(3, 8, cp1, ret$left, ret$right, 300, 303, 306,
                                               cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 23.5465)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  attr(compare3, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, startTime = 23.5465)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, startTime = 23.5465)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("argument regularization is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, regularization = "s"))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, regularization = Inf))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = as.numeric(NA)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, regularization = NULL))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = c(1, "s", 0.2)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = c(2, Inf, 0.1)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = c(as.numeric(NA), 1, 0.4)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = list(c(1, 0.6, 0.1), c(1, 0.5))))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = list(c(1, "s", 0.1), c(1, 0.5), 3)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = list(c(1, 0.5), c(1, Inf, 0.1), 2)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = list(1, 2, as.numeric(NA))))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 regularization = c(2, 1.5, 1.25), suppressWarningNoDeconvolution = TRUE))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     regularization = 1))
  
  # regularization <- 2
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[315:392])
  value5 <- median(testdata[411:492])
  cor <- testfilter$acf
  cor[1] <- 3
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(392:400, 395:403, 393:410, testdata[393:410], testfilter, cor, value4, value5,
                   1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(5L, 6L, 7L)
  attr(compare3, "noDeconvolution") <- c(5L, 6L, 7L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, regularization = 2)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, regularization = 2)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(5L, 6L, 7L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
  
  # regularization <- c(1, 0.5, 0.25)
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[315:392])
  value5 <- median(testdata[411:492])
  cor <- testfilter$acf
  cor[1:3] <- cor[1:3] + c(1, 0.5, 0.25)
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(392:400, 395:403, 393:410, testdata[393:410], testfilter, cor, value4, value5,
                   1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(5L, 6L, 7L)
  attr(compare3, "noDeconvolution") <- c(5L, 6L, 7L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, regularization = c(1, 0.5, 0.25))
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, regularization = c(1, 0.5, 0.25))
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(5L, 6L, 7L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
  
  # regularization <- list(c(3), c(2, 1), c(2, 1, 0.5))
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[315:392])
  value5 <- median(testdata[411:492])
  cor <- testfilter$acf
  cor[1] <- 4
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(392:400, 395:403, 393:410, testdata[393:410], testfilter, cor, value4, value5,
                   1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cor <- testfilter$acf
  cor[1:2] <- cor[1:2] + c(2, 1)
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cor <- testfilter$acf
  cor[1:3] <- cor[1:3] + c(2, 1, 0.5)
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(5L, 6L, 7L)
  attr(compare3, "noDeconvolution") <- c(5L, 6L, 7L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE,
                           regularization = list(c(3), c(2, 1), c(2, 1, 0.5)))
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE,
                              regularization = list(c(3), c(2, 1), c(2, 1, 0.5)))
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(5L, 6L, 7L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("thresholdLongSegment is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdShorSegment = "s"))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdShorSegment = c(10, 20)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdLongSegment = Inf))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdLongSegment = as.numeric(NA)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdLongSegment = 0L))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 thresholdLongSegment = -1L))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, 
                                     suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     thresholdLongSegment = 10L, suppressWarningNoDeconvolution = TRUE))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     thresholdLongSegment = 12, suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     thresholdLongSegment = 12L, suppressWarningNoDeconvolution = TRUE))
  expect_identical(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     thresholdLongSegment = 8.5, suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     thresholdLongSegment = 8L, suppressWarningNoDeconvolution = TRUE))
  
  testfit <- stepblock(leftEnd = c(0, 100, 125), rightEnd = c(100, 125, 200), value = c(0, 1, 2), x0 = 0)
  testdata <- c(rnorm(108), rnorm(25, 1), rnorm(75))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  leftValue <- median(testdata[8:92])
  rightValue <- median(testdata[133:192])
  cor <- testfilter$acf
  cor[1] <- 2
  ret <- testPeak(92:100, 117:125, 93:132, testdata[93:132], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.1), seq(ret$right - 1, ret$right + 1, 0.1),
                  93:132, testdata[93:132], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  93:132, testdata[93:132], testfilter, cor, leftValue, rightValue,
                  1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, ret$left, ret$right), rightEnd = c(ret$left, ret$right, 200),
                        value = c(leftValue, ret$value, rightValue), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, thresholdLongSegment = 11L)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              thresholdLongSegment = 11L)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
  
  value1 <- median(testdata[8:92])
  value2 <- median(testdata[108:117])
  value3 <- median(testdata[133:192])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(117:125, 118:132, testdata[118:132], testfilter, cor, value2, value3)
  compare1 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 200),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 1, cp2 + 1, 0.1), 118:132, testdata[118:132], testfilter, cor, value2, value3)
  compare2 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 200),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01),
                  93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.1, cp2 + 0.1, 0.01),
                  118:132, testdata[118:132], testfilter, cor, value2, value3)
  compare3 <- stepblock(leftEnd = c(0, cp1, cp2), rightEnd = c(cp1, cp2, 200),
                        value = c(value1, value2, value3), x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- integer(0)
  attr(compare3, "noDeconvolution") <- integer(0)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, thresholdLongSegment = 10L)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              thresholdLongSegment = 10L)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- integer(0)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("argument localEstimate is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 100, 200, 203, 300, 303, 306, 307, 400, 403),
                       rightEnd = c(100, 200, 203, 300, 303, 306, 307, 400, 403, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 2), rnorm(3), rnorm(97, 4), rnorm(100, 5), rnorm(3), rnorm(97, 6))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.2), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = 1))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function() {1}))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function(x) {Inf}))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function(x) {as.numeric(NA)}))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function(x) {c(1, 2)}))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function(x) {NULL}))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 localEstimate = function(x) {"NULL"}))
  
  value1 <- mean(testdata[8:92])
  value2 <- mean(testdata[108:192])
  value3 <- mean(testdata[211:292])
  value4 <- mean(testdata[315:392])
  value5 <- mean(testdata[411:492])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(392:400, 395:403, 393:410, testdata[393:410], testfilter, cor, value4, value5,
                   1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 1, ret1$left + 1, 0.1), seq(ret1$right - 1, ret1$right + 1, 0.1),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 1, ret2$left + 1, 0.1), seq(ret2$right - 1, ret2$right + 1, 0.1),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  ret1 <- testPeak(seq(ret1$left - 0.1, ret1$left + 0.1, 0.01),
                   seq(ret1$right - 0.1, ret1$right + 0.1, 0.01),
                   193:210, testdata[193:210], testfilter, cor, value2, value3,
                   1e-6 / testfilter$sr)
  ret2 <- testPeak(seq(ret2$left - 0.1, ret2$left + 0.1, 0.01),
                   seq(ret2$right - 0.1, ret2$right + 0.1, 0.01),
                   393:410, testdata[393:410], testfilter, cor, value4, value5, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                    ret2$left, ret2$right),
                        rightEnd = c(cp1, ret1$left, ret1$right, 300, 303, 306, 307,
                                     ret2$left, ret2$right, 500),
                        value = c(value1, value2, ret1$value, value3, 4, 5, 6, value4, ret2$value, value5),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(5L, 6L, 7L)
  attr(compare3, "noDeconvolution") <- c(5L, 6L, 7L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, localEstimate = mean)
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, localEstimate = mean)
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(5L, 6L, 7L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("argument gridSize is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 6L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 gridSize = c(1, "s", 0.01)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 gridSize = c(1, Inf, 0.01)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 gridSize = c(1, as.numeric(NA), 0.01)))
  
  value1 <- median(testdata[16:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[314:392])
  value5 <- median(testdata[408:483])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(392:400, 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 1, cp1 + 1, 0.5), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 1, cp2 + 1, 0.5), 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 1, ret$left + 1, 0.5), seq(ret$right - 1, ret$right + 1, 0.5),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.5, cp1 + 0.5, 0.1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.5, cp2 + 0.5, 0.1), 393:407, testdata[393:407],
                  testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 0.5, ret$left + 0.5, 0.1), seq(ret$right - 0.5, ret$right + 0.5, 0.1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  attr(compare3, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, gridSize = c(1, 0.5, 0.1))
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, gridSize = c(1, 0.5, 0.1))
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
  
  
  value1 <- median(testdata[16:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[314:392])
  value5 <- median(testdata[408:483])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(seq(92, 100, 2), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(392, 400, 2), 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(192, 200, 2), seq(195, 203, 2), 193:210, testdata[193:210],
                  testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 2, cp1 + 2, 1), 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 2, cp2 + 2, 1), 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 2, ret$left + 2, 1), seq(ret$right - 2, ret$right + 2, 1),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  compare <- list(compare1, compare2)
  attr(compare, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  attr(compare2, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, gridSize = c(2, 1))
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, gridSize = c(2, 1))
  
  test <- retall[[2]]
  attr(test, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  expect_identical(ret, test)
  expect_equal(ret, compare2)
  expect_equal(retall, compare)
})

test_that("argument windowFactorRefinement is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(108), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = "s"))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = Inf))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = as.numeric(NA)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = NULL))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = c(1, 1, 1)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = c(1, "s")))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = c(1, Inf)))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 windowFactorRefinement = c(1, as.numeric(NA))))
  
  value1 <- median(testdata[16:92])
  value2 <- median(testdata[108:192])
  value3 <- median(testdata[211:292])
  value4 <- median(testdata[314:392])
  value5 <- median(testdata[408:483])
  cor <- testfilter$acf
  cor[1] <- 2
  cp1 <- testJump(92:100, 93:107, testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(392:400, 393:407, testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(192:200, 195:203, 193:210, testdata[193:210], testfilter, cor, value2, value3,
                  1e-6 / testfilter$sr)
  compare1 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare1) <- c("localDeconvolution", class(compare1))
  cp1 <- testJump(seq(cp1 - 0.1, cp1 + 0.1, 0.01), 93:107,
                  testdata[93:107], testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.1, cp2 + 0.1, 0.01), 393:407,
                  testdata[393:407], testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 0.1, ret$left + 0.1, 0.01), seq(ret$right - 0.1, ret$right + 0.1, 0.01),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare2 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare2) <- c("localDeconvolution", class(compare2))
  cp1 <- testJump(seq(cp1 - 0.01, cp1 + 0.01, 0.001), 93:107, testdata[93:107],
                  testfilter, cor, value1, value2)
  cp2 <- testJump(seq(cp2 - 0.01, cp2 + 0.01, 0.001), 393:407, testdata[393:407],
                  testfilter, cor, value4, value5)
  ret <- testPeak(seq(ret$left - 0.01, ret$left + 0.01, 0.001),
                  seq(ret$right - 0.01, ret$right + 0.01, 0.001),
                  193:210, testdata[193:210], testfilter, cor, value2, value3, 1e-6 / testfilter$sr)
  compare3 <- stepblock(leftEnd = c(0, 3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496),
                        rightEnd = c(3, 8, cp1, ret$left, ret$right, 300, 303, 306, cp2, 491, 496, 500),
                        value = c(0, 1, value1, value2, ret$value, value3, 6, 7, value4, value5, 10, 11),
                        x0 = 0)
  class(compare3) <- c("localDeconvolution", class(compare3))
  compare <- list(compare1, compare2, compare3)
  attr(compare, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  attr(compare3, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  
  ret <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                           suppressWarningNoDeconvolution = TRUE, gridSize = c(1, 0.01, 0.001),
                           windowFactorRefinement = c(0.1, 1))
  retall <- deconvolveLocally(fit = testfit, filter = testfilter, data = testdata, output = "everyGrid",
                              suppressWarningNoDeconvolution = TRUE, gridSize = c(1, 0.01, 0.001),
                              windowFactorRefinement = c(0.1, 1))
  
  test <- retall[[3]]
  attr(test, "noDeconvolution") <- c(1L, 2L, 7L, 8L, 11L, 12L)
  expect_identical(ret, test)
  expect_equal(ret, compare3)
  expect_equal(retall, compare)
})

test_that("argument report is tested and works", {
  testfit <- stepblock(leftEnd = c(0, 3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496),
                       rightEnd = c(3, 8, 100, 200, 203, 300, 303, 306, 400, 491, 496, 500),
                       value = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11), x0 = 0)
  testdata <- c(rnorm(111), rnorm(100, 1), rnorm(3, 0), rnorm(97, 2), rnorm(100, 3), rnorm(100, 4))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 11L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 report = "s"))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 report = 1))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 report = NULL))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 report = NA))
  expect_error(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                 report = c(TRUE, FALSE)))
  
  expect_identical(suppressMessages(deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                                      report = TRUE, suppressWarningNoDeconvolution = TRUE)),
                   deconvolveLocally(fit = testfit, filter = testfilter, data = testdata,
                                     suppressWarningNoDeconvolution = TRUE))
})
