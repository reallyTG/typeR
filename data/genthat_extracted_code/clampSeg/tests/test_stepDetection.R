
context("stepDetection")

library(stepR)

testIncremental <- function(fit, thresholdIncremental) {
  leftEnd <- fit$leftEnd
  rightEnd <- fit$rightEnd
  value <- fit$value
  
  i <- 1
  while (i < length(value)) {
    j <- i
    
    decis <- testdecision(i = i, j = j, leftEnd = leftEnd, value = value, threshold = thresholdIncremental)
    
    while (decis) {
      j <- j + 1
      
      if (j == length(value)) {
        break
      }
      decis <- testdecision(i = i, j = j, leftEnd = leftEnd, value = value, threshold = thresholdIncremental)
    }
    
    if (i != j) {
      restimatedValue <- value[j]
      
      if (j < length(leftEnd)) {
        leftEnd <- c(leftEnd[1:i], leftEnd[(j + 1):length(leftEnd)])
      } else {
        leftEnd <- leftEnd[1:i]
      }
      if (i > 1) {
        rightEnd <- c(rightEnd[1:(i - 1)], rightEnd[j:length(rightEnd)])
      } else {
        rightEnd <- rightEnd[j:length(rightEnd)]
      }
      
      if (i > 1) {
        if (j < length(value)) {
          value <- c(value[1:(i - 1)], restimatedValue, value[(j + 1):length(value)])
        } else {
          value <- c(value[1:(i - 1)], restimatedValue)
        }
      } else {
        if (j < length(value)) {
          value <- c(restimatedValue, value[(j + 1):length(value)])
        } else {
          value <- restimatedValue
        }
      }
    }
    i <- i + 1
  }
  
  stepR::stepblock(value = value, leftEnd = leftEnd, rightEnd = rightEnd, x0 = attr(fit, "x0"))
}

testdecision <- function(i, j, leftEnd, value, threshold) {
  if (i == 1) {
    return(FALSE)
  }
  
  leftEnd[j + 1] - leftEnd[i] < threshold && (value[j + 1] - value[j]) * (value[j] - value[j - 1]) > 0
}

context("postfilter")
test_that("object is identical if no action has to be done", {
  test <- stepblock(value = c(0, 1), leftEnd = c(1, 101), rightEnd = c(100, 200), x0 = NA)
  compare <- stepblock(value = c(0, 1), leftEnd = c(1, 101), rightEnd = c(100, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("single incremental change is removed", {
  test <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 101, 106),
                    rightEnd = c(100, 105, 200), x0 = NA)
  compare <- stepblock(value = c(0, 1), leftEnd = c(1, 101), rightEnd = c(100, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("two incremental changes are removed", {
  test <- stepblock(value = c(0, 0.5, 0.7, 1), leftEnd = c(1, 101, 104, 106),
                    rightEnd = c(100, 103, 105, 200), x0 = NA)
  compare <- stepblock(value = c(0, 1), leftEnd = c(1, 101), rightEnd = c(100, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("distance is taken correctly into account", {
  test <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 101, 109),
                    rightEnd = c(100, 108, 200), x0 = NA)
  compare <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 101, 109),
                       rightEnd = c(100, 108, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
  
  test <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 101, 108),
                    rightEnd = c(100, 107, 200), x0 = NA)
  compare <- stepblock(value = c(0, 1), leftEnd = c(1, 101), rightEnd = c(100, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("different direction is taken into account", {
  test <- stepblock(value = c(0, -0.5, 1), leftEnd = c(1, 101, 106),
                    rightEnd = c(100, 105, 200), x0 = NA)
  compare <- stepblock(value = c(0, -0.5, 1), leftEnd = c(1, 101, 106),
                       rightEnd = c(100, 105, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("first segment is not removed", {
  test <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 7, 106),
                    rightEnd = c(7, 105, 200), x0 = NA)
  compare <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 7, 106),
                       rightEnd = c(7, 105, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("last segment is not removed", {
  test <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 100, 116),
                    rightEnd = c(100, 116, 117), x0 = NA)
  compare <- stepblock(value = c(0, 0.5, 1), leftEnd = c(1, 100, 116),
                       rightEnd = c(100, 116, 117), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})

test_that("incremental changes at a peak are removed", {
  test <- stepblock(value = c(0, 0.5, 0.7, 1, 0.5, 0), leftEnd = c(1, 101, 104, 106, 108, 110),
                    rightEnd = c(100, 103, 105, 107, 109, 200), x0 = NA)
  compare <- stepblock(value = c(0, 1, 0), leftEnd = c(1, 101, 108),
                       rightEnd = c(100, 107, 200), x0 = NA)
  expect_identical(testIncremental(test, thresholdIncremental = 8L), compare)
})


context("stepDetection")

# a simple way to filter data, not very precise, but enough for test purposes
.convolve <- function(data, filter) {
  stats::filter(data, filter$kern, sides = 1)[-c(1:filter$len)] / sqrt(sum(filter$kern^2))
}

test_that("it works if sd and q is given and that data and filter have to be given", {
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 1
  testq <- 1.44
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
    
  expect_error(stepDetection())
  expect_error(stepDetection(data = testdata))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq), 
                   testIncremental(compare, thresholdIncremental = 8L))
})

test_that("output is tested and works", {
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 1
  testq <- 1.44
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = testq, filter = testfilter, sd = testsd)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = 1))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, 
                             output = c("only", "every")))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = "aha"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "only"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every")$fit)
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every"), compare)
})

test_that("more difficult scenarios work", {
  testdata <- c(rnorm(108, 0), rnorm(100, 2), rnorm(100, 0), rnorm(100, 2))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = testq, filter = testfilter, sd = testsd)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = 1))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, 
                             output = c("only", "every")))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = "aha"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "only"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every")$fit)
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every"), compare)
  
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(100, 0))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = testq, filter = testfilter, sd = testsd)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = 1))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, 
                             output = c("only", "every")))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = "aha"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "only"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every")$fit)
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every"), compare)
  
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = testq, filter = testfilter, sd = testsd)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = 1))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, 
                             output = c("only", "every")))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, output = "aha"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "only"))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every")$fit)
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "every"), compare)
})

test_that("argument data works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_error(stepDetection(data = c(testdata, "s"), filter = testfilter, sd = testsd, q = testq))
  expect_error(stepDetection(data = c(testdata, Inf), filter = testfilter, sd = testsd, q = testq))
  expect_error(stepDetection(data = c(testdata, as.numeric(NA)), filter = testfilter, sd = testsd, 
                             q = testq))
})

test_that("argument startTime works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_identical(stepDetection(data = testdata, startTime = 0, filter = testfilter, sd = testsd,
                             q = testq), testIncremental(compare, thresholdIncremental = 8L))
  expect_error(stepDetection(data = testdata, startTime = "0", filter = testfilter, sd = testsd,
                             q = testq))
  expect_error(stepDetection(data = testdata, startTime = Inf, filter = testfilter, sd = testsd,
                             q = testq))
  expect_error(stepDetection(data = testdata, startTime = as.numeric(NA), filter = testfilter, sd = testsd,
                             q = testq))
  expect_error(stepDetection(data = testdata, startTime = c(0, 0.5), filter = testfilter, sd = testsd,
                             q = testq))
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testdata <- .convolve(testdata, testfilter)
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = -1,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value,
                       leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]) - 1,
                       rightEnd = compare$rightEnd - 1, x0 = -1)
  expect_identical(stepDetection(data = testdata, startTime = -1, filter = testfilter,
                             sd = testsd, q = testq), testIncremental(compare, thresholdIncremental = 8L))
})

test_that("argument filter works and is tested", {
  testdata <- c(rnorm(105, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 5L, cutoff = 0.01), sr = 1, len = 5L,
                              shift = 0)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_error(stepDetection(data = testdata, filter = list(test = 1), sd = testsd, q = testq))
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
               testIncremental(compare, thresholdIncremental = 5L))
  
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 10, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value,
                       leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   testIncremental(compare,
                                   thresholdIncremental = (testfilter$len - 1e-6)  / testfilter$sr))
  
  testdata <- c(rnorm(105, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 5L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  testtime <- 1 + 1:215 / 1e4
  compare <- stepR::stepFit(y = testdata, x = testtime, x0 = 1,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value,
                       leftEnd = c(1, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 1)
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq, startTime = 1),
                   testIncremental(compare,
                                   thresholdIncremental = (testfilter$len - 1e-6)  / testfilter$sr))
})

test_that("argument sd works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  testq <- 1
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   testIncremental(compare, thresholdIncremental = 8L))
  
  testdata <- c(rnorm(108, 0, 0.5), rnorm(5, 10, 0.5), rnorm(5, 20, 0.5), rnorm(5, 30, 0.5),
                rnorm(100, 40, 0.5))
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             covariances = testsd^2 * testfilter$acf)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, sd = testsd, q = testq),
                   testIncremental(compare, thresholdIncremental = 8L))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = "s", q = testq))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = c(1, 0.5), q = testq))
  expect_error(stepDetection(data = testdata, filter = testfilter, sd = -1, q = testq))
  
  estsd <- sdrobnorm(testdata, lag = 9)
  expect_identical(stepDetection(data = testdata, filter = testfilter, q = testq),
                   stepDetection(data = testdata, filter = testfilter, sd = estsd, q = testq))
})

test_that("argument q works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testq <- -1
  
  expect_error(stepDetection(data = testdata, filter = testfilter, q = "s"))
  expect_error(stepDetection(data = testdata, filter = testfilter, q = as.numeric(NA)))
  expect_error(stepDetection(data = testdata, filter = testfilter, q = Inf))
  expect_error(stepDetection(data = testdata, filter = testfilter, q = c(1, 2)))
  
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = testq,
                             filter = testfilter)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, q = testq),
                   testIncremental(compare, thresholdIncremental = 8L))
})

test_that("argument alpha works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  teststat <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS", filter = testfilter)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = "s", stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = NULL, stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = as.numeric(NA), stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = Inf, stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = c(0.1, 0.05), stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = 0, stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = 1, stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = -0.05, stat = teststat))
  expect_error(stepDetection(data = testdata, filter = testfilter, alpha = 1.01, stat = teststat))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, stat = teststat),
                   stepDetection(data = testdata, filter = testfilter, stat = teststat, alpha = 0.05))
  
  compareq <- getCritVal(n = length(testdata), stat = teststat, filter = testfilter)
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = compareq,
                             filter = testfilter)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  expect_identical(stepDetection(data = testdata, filter = testfilter, stat = teststat),
                   testIncremental(compare, thresholdIncremental = 8L))
  
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = compareq, filter = testfilter, sd = sdrobnorm(testdata, lag = 9L))
  expect_identical(stepDetection(data = testdata, filter = testfilter, stat = teststat,
                                 output = "every"), compare)

  compareq <- getCritVal(n = length(testdata), stat = teststat, alpha = 0.135, filter = testfilter)
  compare <- stepR::stepFit(y = testdata, x = seq(along = testdata) / testfilter$sr, x0 = 0,
                             family = "mDependentPS", intervalSystem = "dyaLen", q = compareq,
                             filter = testfilter)
  compare <- stepblock(value = compare$value, leftEnd = c(0, compare$rightEnd[-length(compare$rightEnd)]),
                       rightEnd = compare$rightEnd, x0 = 0)
  expect_identical(stepDetection(data = testdata, filter = testfilter, stat = teststat, alpha = 0.135),
                   testIncremental(compare, thresholdIncremental = 8L))
  
  compare <- list(fit = testIncremental(compare, thresholdIncremental = 8L), stepfit = compare,
                  q = compareq, filter = testfilter, sd = sdrobnorm(testdata, lag = 9L))
  expect_identical(stepDetection(data = testdata, filter = testfilter, stat = teststat, alpha = 0.135,
                                 output = "every"), compare)
})

test_that("argument ... works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  teststat <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS", filter = testfilter)
  
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, family = "gauss"))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, intervalSystem = "all"))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, neuv = "1"))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, n = 215))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = rnorm(100)))
  expect_error(stepDetection(data = testdata, stat = teststat,
                             filter = lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 10)))
  expect_error(stepDetection(data = testdata, stat = teststat,
                             filter = lowpassFilter(param = list(pole = 4L, cutoff = 0.2), len = 11)))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, r = "s", options = list(load = list())))
  expect_error(stepDetection(data = testdata, filter = testfilter, r = 0, options = list(load = list())))
  expect_error(stepDetection(data = testdata, filter = testfilter, r = c(100L, 200L),
                             options = list(load = list())))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, r = 100.5,
                                 options = list(load = list()), output = "every"),
                   stepDetection(data = testdata, filter = testfilter, r = 100L,
                                 options = list(load = list()), output = "every"))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = "215"))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = c(1L, 2L)))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = as.integer(NA)))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = Inf))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = NULL))
  expect_error(stepDetection(data = testdata, filter = testfilter, stat = teststat, nq = 214L))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list())),
                   stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list()), nq = 215L))
  expect_identical(stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list()), nq = 300),
                   stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list()), nq = 300L))
  expect_identical(stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list()), nq = 300.5),
                   stepDetection(data = testdata, filter = testfilter, r = 100, output = "every",
                                 options = list(load = list()), nq = 300L))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, options = "vector"))
  expect_error(stepDetection(data = testdata, filter = testfilter, options = list(a = "vector")))
  expect_error(stepDetection(data = testdata, filter = testfilter,
                             options = list(simulation = c("vector", "matrix"), save = list(), load = list())))
  expect_error(stepDetection(data = testdata, filter = testfilter,
                             options = list(save = list(workspace = "vecto"))))
  
  expect_error(stepDetection(data = testdata, filter = testfilter, messages = "s"))
  expect_error(stepDetection(data = testdata, filter = testfilter, messages = "s"))
  expect_error(stepDetection(data = testdata, filter = testfilter, messages = "s"))
  
  expect_identical(suppressMessages(stepDetection(data = testdata, filter = testfilter, r = 100L, messages = 10L,
                                                  options = list(load = list()), output = "every")),
                   stepDetection(data = testdata, filter = testfilter, r = 100L,
                                 options = list(load = list()), output = "every"))
  
  expect_identical(suppressMessages(stepDetection(data = testdata, filter = testfilter, r = 100L, messages = 10.5,
                                                  options = list(load = list()), output = "every")),
                   stepDetection(data = testdata, filter = testfilter, r = 100L,
                                 options = list(load = list()), output = "every"))
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  testvariable <- "test"
  testStepR <- new.env()

  testfilter1 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 8)
  teststat1 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter1, output = "maximum")
  expect_identical(stepDetection(data = testdata, filter = testfilter1, r = 100L, output = "every",
                              options = list(save = list(RDSfile = testfile, variable = testvariable,
                                                         workspace = c("vector", "vectorIncreased")),
                                             load = list(), envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat1, filter = testfilter1, output = "every",
                                 options = list(save = list())))
  expect_identical(readRDS(testfile), teststat1)
  expect_identical(get("test", envir = testStepR), teststat1)
  remove(test, envir = testStepR)
  
  testfilter2 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.2), len = 8)
  teststat2 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter2, output = "maximum")
  expect_identical(stepDetection(data = testdata, filter = testfilter2, r = 100L, output = "every",
                                 options = list(envir = testStepR, dirs = "testStepR", 
                                                save = list(fileSystem = "vector", workspace = "vector"))),
                   stepDetection(data = testdata, stat = teststat2, filter = testfilter2, output = "every",
                                 options = list(save = list())))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter1, r = 200L,
                                 options = list(load = list(RDSfile = testfile), save = list(fileSystem = "vector"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat1, filter = testfilter1,
                                 options = list(save = list())))
  unlink(testfile)
  
  testfilter3 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat3 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter3, output = "maximum")
  expect_identical(getCritVal(n = 200L, filter = testfilter3, r = 100L, nq = 215L,
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 200L, stat = teststat3, filter = testfilter3, options = list(save = list())))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter3, r = 50L, nq = 320L, output = "every",
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat3, filter = testfilter3, output = "every",
                                 options = list(save = list())))
  
  teststat4 <- monteCarloSimulation(n = 320, r = 100, family = "mDependentPS", lengths = 2^(0:7),
                                    filter = testfilter3, output = "maximum")
  expect_identical(stepDetection(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             load = list(workspace = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat4, filter = testfilter3, output = "every",
                                 options = list(save = list())))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                              options = list(simulation = "vector",
                                             save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             load = list(workspace = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat3, filter = testfilter3, output = "every",
                                 options = list(save = list())))
  
  teststat5 <- monteCarloSimulation(n = 320, r = 200, family = "mDependentPS", lengths = 2^(0:7),
                                    filter = testfilter3, output = "maximum")
  expect_identical(stepDetection(data = testdata, filter = testfilter3, r = 200L, nq = 320L, output = "every",
                              options = list(save = list(workspace = "vectorIncreased",
                                                         fileSystem = "vector"),
                                             load = list(workspace = "vectorIncreased",
                                                         fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat5, filter = testfilter3, output = "every",
                                 options = list(save = list())))
  
  expect_identical(stepDetection(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                              options = list(save = list(workspace = "vectorIncreased",
                                                         fileSystem = "vector"),
                                             load = list(workspace = "vectorIncreased",
                                                         fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   stepDetection(data = testdata, stat = teststat5, filter = testfilter3, output = "every",
                                 options = list(save = list())))
  
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 4L)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat1)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[2]], teststat2)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[3]], teststat3)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[4]], teststat5)
  
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 4L)
  expect_identical(R.cache::loadCache(attr(teststat2, "keyList"), dirs = "testStepR"), teststat2)
  expect_identical(R.cache::loadCache(attr(teststat1, "keyList"), dirs = "testStepR"), teststat1)
  expect_identical(R.cache::loadCache(attr(teststat3, "keyList"), dirs = "testStepR"), teststat3)
  expect_identical(R.cache::loadCache(attr(teststat4, "keyList"), dirs = "testStepR"), teststat4)
  
  remove(critValStepRTab, envir = testStepR)
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
})
