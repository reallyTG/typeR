
context("jules")

# a simple way to filter data, not very precise, but enough for test purposes
.convolve <- function(data, filter) {
  stats::filter(data, filter$kern, sides = 1)[-c(1:filter$len)] / sqrt(sum(filter$kern^2))
}


test_that("it works if sd and q are given and that data and filter have to be given", {
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 1
  testq <- 1.44
  expect_error(jules())
  expect_error(jules(data = testdata))
  expect_error(jules(filter = testfilter))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE))
})

test_that("output is tested and works", {
  testdata <- rnorm(100)
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 1
  testq <- 1.44
  
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq, output = 1))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq, 
                             output = c("only", "every")))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq, output = "aha"))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                                 output = "only", suppressWarningNoDeconvolution = TRUE))
  
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
})

test_that("more difficult scenarios work", {
  testdata <- c(rnorm(108, 0), rnorm(100, 10), rnorm(100, 0), rnorm(100, 10))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter, suppressWarningNoDeconvolution = TRUE))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
  
  
  testdata <- c(rnorm(100, 0), rnorm(5, 10), rnorm(100, 0))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 1
  testq <- 1
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter, suppressWarningNoDeconvolution = TRUE))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
  
  
  testdata <- c(rnorm(100, 0), rnorm(5, 15), rnorm(5, 30), rnorm(5, 45), rnorm(100, 60))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testsd <- 0.5
  testq <- 1
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter, suppressWarningNoDeconvolution = TRUE))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
})

test_that("argument data works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 1
  testq <- 1

  expect_error(jules(data = c(testdata, "s"), filter = testfilter, sd = testsd, q = testq))
  expect_error(jules(data = c(testdata, Inf), filter = testfilter, sd = testsd, q = testq))
  expect_error(jules(data = c(testdata, as.numeric(NA)), filter = testfilter, sd = testsd, 
                             q = testq))
})

test_that("argument startTime works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 20), rnorm(5, 40), rnorm(5, 60), rnorm(100, 80))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  testq <- 1

  expect_identical(jules(data = testdata, startTime = 0, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE))
  expect_error(jules(data = testdata, startTime = "0", filter = testfilter, sd = testsd, q = testq))
  expect_error(jules(data = testdata, startTime = Inf, filter = testfilter, sd = testsd, q = testq))
  expect_error(jules(data = testdata, startTime = as.numeric(NA), filter = testfilter, sd = testsd, q = testq))
  expect_error(jules(data = testdata, startTime = c(0, 0.5), filter = testfilter, sd = testsd, q = testq))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, startTime = -1),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd, startTime = -1),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, startTime = -1))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, startTime = 10),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd, startTime = 10),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, startTime = 10))
})

test_that("argument filter works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 20), rnorm(5, 40), rnorm(5, 60), rnorm(100, 80))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  testq <- 1

  expect_error(jules(data = testdata, filter = list(test = 1), sd = testsd, q = testq))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, startTime = 0),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd, startTime = 0),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, startTime = 0))
  
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.05), sr = 2143, len = 3L,
                              shift = 0.2)
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, startTime = 0),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd, startTime = 0),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, startTime = 0))

  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 5e4, len = 8L,
                              shift = 0.5)
  teststartTime <- 10 / 5e4
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, startTime = teststartTime),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd, startTime = teststartTime),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, startTime = teststartTime))
})

test_that("argument sd works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  testq <- 1

  expect_error(jules(data = testdata, filter = testfilter, sd = "s", q = testq))
  expect_error(jules(data = testdata, filter = testfilter, sd = Inf, q = testq))
  expect_error(jules(data = testdata, filter = testfilter, sd = c(1, 0.5), q = testq))
  expect_error(jules(data = testdata, filter = testfilter, sd = -1, q = testq))
  
  estsd <- stepR::sdrobnorm(testdata, lag = 9L)
  expect_identical(jules(data = testdata, filter = testfilter, q = testq),
                   jules(data = testdata, filter = testfilter, sd = estsd, q = testq))
})

test_that("argument q works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testq <- -1
  testsd <- 0.5
  
  expect_error(jules(data = testdata, filter = testfilter, q = "s"))
  expect_error(jules(data = testdata, filter = testfilter, q = as.numeric(NA)))
  expect_error(jules(data = testdata, filter = testfilter, q = Inf))
  expect_error(jules(data = testdata, filter = testfilter, q = c(1, 2)))

  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE))
})

test_that("argument alpha works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  teststat <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS", filter = testfilter)
  testsd <- 0.5
  
  expect_error(jules(data = testdata, filter = testfilter, alpha = "s", stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = NULL, stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = as.numeric(NA), stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = Inf, stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = c(0.1, 0.05), stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = 0, stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = 1, stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = -0.05, stat = teststat))
  expect_error(jules(data = testdata, filter = testfilter, alpha = 1.01, stat = teststat))
  
  expect_identical(jules(data = testdata, filter = testfilter, stat = teststat),
                   jules(data = testdata, filter = testfilter, stat = teststat, alpha = 0.05))
  expect_identical(jules(data = testdata, filter = testfilter, stat = teststat, output = "each"),
                   jules(data = testdata, filter = testfilter, stat = teststat, alpha = 0.05, output = "each"))
  expect_identical(jules(data = testdata, filter = testfilter, stat = teststat, output = "every"),
                   jules(data = testdata, filter = testfilter, stat = teststat, alpha = 0.05, output = "every"))
  
  testq <- getCritVal(n = length(testdata), stat = teststat, filter = testfilter)
  expect_identical(jules(data = testdata, filter = testfilter, stat = teststat, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter, suppressWarningNoDeconvolution = TRUE))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
  
  
  testq <- getCritVal(n = length(testdata), stat = teststat, alpha = 0.09, filter = testfilter)
  expect_identical(jules(data = testdata, filter = testfilter, stat = teststat, alpha = 0.09, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter, suppressWarningNoDeconvolution = TRUE))
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                         suppressWarningNoDeconvolution = TRUE),
                   jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                         output = "each", suppressWarningNoDeconvolution = TRUE)$idealization)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd)
  compare <- list(idealization = deconvolveLocally(fit = compare, data = testdata, filter = testfilter,
                                                   suppressWarningNoDeconvolution = TRUE),
                  fit = compare, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                         output = "each", suppressWarningNoDeconvolution = TRUE), compare)
  
  compare <- jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                   output = "every", suppressWarningNoDeconvolution = TRUE)$idealization
  compare2 <- compare[[3]]
  attr(compare2, "noDeconvolution") <- attr(compare, "noDeconvolution")
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                         suppressWarningNoDeconvolution = TRUE), compare2)
  compare <- stepDetection(data = testdata, filter = testfilter, q = testq, sd = testsd, output = "every")
  compare <- list(idealization = deconvolveLocally(fit = compare$fit, data = testdata, filter = testfilter,
                                                   output = "every", suppressWarningNoDeconvolution = TRUE),
                  fit = compare$fit, stepfit = compare$stepfit, q = testq, filter= testfilter, sd = testsd)
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, stat = teststat, alpha = 0.09,
                         output = "every", suppressWarningNoDeconvolution = TRUE), compare)
})

test_that("argument ... works and is tested", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  teststat <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS", filter = testfilter)
  
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, family = "gauss"))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, intervalSystem = "all"))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, neuv = "1"))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, n = 215))
  
  expect_error(jules(data = testdata, filter = testfilter, stat = rnorm(100)))
  expect_error(jules(data = testdata, stat = teststat,
                     filter = lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 10)))
  expect_error(jules(data = testdata, stat = teststat,
                     filter = lowpassFilter(param = list(pole = 4L, cutoff = 0.2), len = 11)))
  
  expect_error(jules(data = testdata, filter = testfilter, r = "s", options = list(load = list())))
  expect_error(jules(data = testdata, filter = testfilter, r = 0, options = list(load = list())))
  expect_error(jules(data = testdata, filter = testfilter, r = c(100L, 200L),
                     options = list(load = list())))
  
  expect_identical(jules(data = testdata, filter = testfilter, r = 100.5,
                         options = list(load = list()), output = "every"),
                   jules(data = testdata, filter = testfilter, r = 100L,
                         options = list(load = list()), output = "every"))
  
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = "215"))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = c(1L, 2L)))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = as.integer(NA)))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = Inf))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = NULL))
  expect_error(jules(data = testdata, filter = testfilter, stat = teststat, nq = 214L))
  
  expect_identical(jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list())),
                   jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list()), nq = 215L))
  expect_identical(jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list()), nq = 300),
                   jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list()), nq = 300L))
  expect_identical(jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list()), nq = 300.5),
                   jules(data = testdata, filter = testfilter, r = 100, output = "every",
                         options = list(load = list()), nq = 300L))
  
  expect_error(jules(data = testdata, filter = testfilter, options = "vector"))
  expect_error(jules(data = testdata, filter = testfilter, options = list(a = "vector")))
  expect_error(jules(data = testdata, filter = testfilter,
                     options = list(simulation = c("vector", "matrix"), save = list(), load = list())))
  expect_error(jules(data = testdata, filter = testfilter,
                     options = list(save = list(workspace = "vecto"))))
  
  expect_error(jules(data = testdata, filter = testfilter, messages = "s"))
  expect_error(jules(data = testdata, filter = testfilter, messages = "s"))
  expect_error(jules(data = testdata, filter = testfilter, messages = "s"))
  
  expect_identical(suppressMessages(jules(data = testdata, filter = testfilter, r = 100L, messages = 10L,
                                          options = list(load = list()), output = "every")),
                   jules(data = testdata, filter = testfilter, r = 100L,
                         options = list(load = list()), output = "every"))
  
  expect_identical(suppressMessages(jules(data = testdata, filter = testfilter, r = 100L, messages = 10.5,
                                          options = list(load = list()), output = "every")),
                   jules(data = testdata, filter = testfilter, r = 100L,
                         options = list(load = list()), output = "every"))
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  testvariable <- "test"
  testStepR <- new.env()
  
  testfilter1 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 8)
  teststat1 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter1, output = "maximum")
  expect_identical(jules(data = testdata, filter = testfilter1, r = 100L, output = "every",
                         options = list(save = list(RDSfile = testfile, variable = testvariable,
                                                    workspace = c("vector", "vectorIncreased")),
                                        load = list(), envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat1, filter = testfilter1, output = "every",
                         options = list(save = list())))
  expect_identical(readRDS(testfile), teststat1)
  expect_identical(get("test", envir = testStepR), teststat1)
  remove(test, envir = testStepR)
  
  testfilter2 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.2), len = 8)
  teststat2 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter2, output = "maximum")
  expect_identical(jules(data = testdata, filter = testfilter2, r = 100L, output = "every",
                         options = list(envir = testStepR, dirs = "testStepR", 
                                        save = list(fileSystem = "vector", workspace = "vector"))),
                   jules(data = testdata, stat = teststat2, filter = testfilter2, output = "every",
                         options = list(save = list())))
  
  expect_identical(jules(data = testdata, filter = testfilter1, r = 200L,
                         options = list(load = list(RDSfile = testfile), save = list(fileSystem = "vector"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat1, filter = testfilter1,
                         options = list(save = list())))
  unlink(testfile)
  
  testfilter3 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat3 <- monteCarloSimulation(n = 215, r = 100, family = "mDependentPS",
                                    filter = testfilter3, output = "maximum")
  expect_identical(getCritVal(n = 200L, filter = testfilter3, r = 100L, nq = 215L,
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 200L, stat = teststat3, filter = testfilter3, options = list(save = list())))
  
  expect_identical(jules(data = testdata, filter = testfilter3, r = 50L, nq = 320L, output = "every",
                         options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat3, filter = testfilter3, output = "every",
                         options = list(save = list())))
  
  teststat4 <- monteCarloSimulation(n = 320, r = 100, family = "mDependentPS", lengths = 2^(0:7),
                                    filter = testfilter3, output = "maximum")
  expect_identical(jules(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                         options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                        load = list(workspace = "vectorIncreased"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat4, filter = testfilter3, output = "every",
                         options = list(save = list())))
  
  expect_identical(jules(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                         options = list(simulation = "vector",
                                        save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                        load = list(workspace = "vectorIncreased"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat3, filter = testfilter3, output = "every",
                         options = list(save = list())))
  
  teststat5 <- monteCarloSimulation(n = 320, r = 200, family = "mDependentPS", lengths = 2^(0:7),
                                    filter = testfilter3, output = "maximum")
  expect_identical(jules(data = testdata, filter = testfilter3, r = 200L, nq = 320L, output = "every",
                         options = list(save = list(workspace = "vectorIncreased",
                                                    fileSystem = "vector"),
                                        load = list(workspace = "vectorIncreased",
                                                    fileSystem = "vectorIncreased"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat5, filter = testfilter3, output = "every",
                         options = list(save = list())))
  
  expect_identical(jules(data = testdata, filter = testfilter3, r = 100L, nq = 320L, output = "every",
                         options = list(save = list(workspace = "vectorIncreased",
                                                    fileSystem = "vector"),
                                        load = list(workspace = "vectorIncreased",
                                                    fileSystem = "vectorIncreased"),
                                        envir = testStepR, dirs = "testStepR")),
                   jules(data = testdata, stat = teststat5, filter = testfilter3, output = "every",
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

test_that("additional arguments for deconvolveLocally", {
  testdata <- c(rnorm(108, 0), rnorm(5, 10), rnorm(5, 20), rnorm(5, 30), rnorm(100, 40))
  testfilter <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1, len = 8L,
                              shift = 0.5)
  testdata <- .convolve(testdata, testfilter)
  testsd <- 0.5
  testq <- 1
  
  expect_identical(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE, regularization = 1,
                         thresholdLongSegment = 10L, localEstimate = stats::median,
                         gridSize = c(1, 1 / 10, 1 / 100),
                         windowFactorRefinement = 1, report = FALSE),
                   jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                         suppressWarningNoDeconvolution = TRUE))
  
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, regularization = NA))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, regularization = c(2, 1)),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, regularization = c(2, 1)))
  
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, regularisation = 1))
  
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, regularization = list(c(1, 0.6, 0.1), c(1, 0.5))))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, thresholdLongSegment = 0L))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, localEstimate = function(x) {c(1, 2)}))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, gridSize = c(1, "s", 0.01)))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, windowFactorRefinement = c(1, 1, 1)))
  expect_error(jules(data = testdata, filter = testfilter, sd = testsd, q = testq,
                     suppressWarningNoDeconvolution = TRUE, report = 1))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE, regularization = 0.5,
                         thresholdLongSegment = 8.5, localEstimate = mean, gridSize = c(1, 0.5, 0.1),
                         windowFactorRefinement = c(0.1, 1), report = FALSE),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, regularization = 0.5,
                                     thresholdLongSegment = 8.5, localEstimate = mean, gridSize = c(1, 0.5, 0.1),
                                     windowFactorRefinement = c(0.1, 1), report = FALSE))
  
  expect_identical(suppressMessages(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                                          suppressWarningNoDeconvolution = TRUE,
                                          regularization = c(3, 1.1, 1.01),
                                          thresholdLongSegment = 5L, localEstimate = function(x) {1},
                                          gridSize = c(2, 0.5, 1),
                                          windowFactorRefinement = c(0.1, 1), report = TRUE)),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE, regularization = c(3, 1.1, 1.01),
                                     thresholdLongSegment = 5L, localEstimate = function(x) {1},
                                     gridSize = c(2, 0.5, 1), windowFactorRefinement = c(0.1, 1)))
  
  expect_identical(jules(data = testdata, filter = testfilter, q = testq, sd = testsd,
                         suppressWarningNoDeconvolution = TRUE,
                         regularization = list(c(1), c(2, 0.25)),
                         thresholdLongSegment = 12, localEstimate = median, gridSize = c(1, 0.5),
                         windowFactorRefinement = c(0.1)),
                   deconvolveLocally(fit = stepDetection(data = testdata, filter = testfilter, q = testq,
                                                         sd = testsd),
                                     data = testdata, filter = testfilter,
                                     suppressWarningNoDeconvolution = TRUE,
                                     regularization = list(c(1), c(2, 0.25)),
                                     thresholdLongSegment = 12, localEstimate = median, gridSize = c(1, 0.5),
                                     windowFactorRefinement = c(0.1)))
})
