context("lowpassFilter")

testBessel <- function(test, testparam, testsr, testlen, testshift) {
  expect_true(is.list(test))
  expect_true(is(test, "lowpassFilter"))
  expect_identical(names(test), c("type", "param", "sr", "len", "kernfun", "stepfun", "acfun",            
                                  "truncatedKernfun", "truncatedStepfun", "truncatedAcfun", "kern", "step", "acf"))
  expect_identical(test$type, "bessel")
  expect_identical(names(test$param), c("pole", "cutoff"))
  expect_identical(test$param$pole, testparam$pole)
  expect_identical(test$param$cutoff, testparam$cutoff)
  expect_identical(test$sr, testsr)
  expect_identical(test$len, testlen)
  
  arg <- c(seq(-10, -1, 1), seq(0.01, 0.001, -0.001), seq(-1, -0.1, 0.1),
           seq(10, 0, -1), seq(1, 0.1, -0.1), seq(0.1, 0.01, -0.01)) / testsr

  ret <- test$kernfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  arg2 <- -rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$kernfun(arg2), rep(0, 99))
  
  expect_equal(integrate(test$kernfun, lower = 0, upper = max(testlen, 30L) / testsr,
                         subdivisions = 1000L, rel.tol = 1e-12)$value +
                 integrate(test$kernfun, lower = max(testlen, 30L) / testsr, upper = 0.01,
                           subdivisions = 1000L, rel.tol = 1e-12)$value + 
                 integrate(test$kernfun, lower = 0.01, upper = Inf,
                           subdivisions = 1000L, rel.tol = 1e-12)$value, 1, tolerance = 1e-12)
  
  ret <- test$stepfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  arg2 <- -rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$stepfun(arg2), rep(0, 99))
  
  arg2 <- seq(0, testlen / testsr, 0.025 * testlen / testsr)
  for (i in seq(along = arg2)) {
      expect_true(abs(integrate(test$kernfun, lower = 0, upper = arg2[i], rel.tol = 1e-12)$value - 
                        test$stepfun(arg2[i])) < 1e-12, info = i)
  }
  
  arg2 <- testlen / testsr + rep(1:9, time = 7) * rep(10^(-5:1), each = 9) / testsr
  val <- integrate(test$kernfun, lower = 0, upper = testlen / testsr, rel.tol = 1e-12)$value
  for (i in seq(along = arg2)) {
    expect_true(abs(val + integrate(test$kernfun, lower = testlen / testsr, upper = arg2[i],
                                    rel.tol = 1e-12)$value - test$stepfun(arg2[i])) < 1e-12, info = i)
  }
  
  ret <- test$acfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  arg2 <- rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$acfun(-arg2), test$acfun(arg2))
  expect_equal(test$acfun(0), 1, tol = 1e-12)
  
  testsr1 <- lowpassFilter(type = "bessel", param = testparam, len = testlen, sr = 1, shift = testshift)
  var <- integrate(function(s) sapply(s, function(t) testsr1$kernfun(t)^2), lower = 0, upper = Inf,
                   subdivisions = 1000L, rel.tol = 1e-12)$value
  
  arg2 <- seq(0, testlen / testsr, 0.025 * testlen / testsr)[-1]
  for (i in seq(along = arg2)) {
    expect_true(abs(integrate(function(t) sapply(t, function(s)
      testsr1$kernfun(s) * testsr1$kernfun(s + arg2[i] * testsr)),
      lower = 0, upper = Inf, subdivisions = 1000L,
      rel.tol = 1e-12)$value / var - test$acfun(arg2[i])) < 1e-12, info = i)
  }
  
  
  ret <- test$truncatedKernfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  
  arg2 <- -rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedKernfun(arg2), rep(0, 99))
  arg2 <- testlen / testsr + rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedKernfun(arg2), rep(0, 99))
  arg2 <- seq(0, testlen / testsr, 0.1 / testsr)
  expect_equal(test$truncatedKernfun(arg2),
               test$kernfun(arg2) / test$stepfun(testlen / testsr), tolerance = 1e-12)

  expect_equal(integrate(test$truncatedKernfun, lower = 0, upper = testlen / testsr,
                         subdivisions = 1000L, rel.tol = 1e-12)$value, 1, tolerance = 1e-12)
  
  ret <- test$truncatedStepfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  
  arg2 <- -rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedStepfun(arg2), rep(0, 99))
  arg2 <- testlen / testsr + rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedStepfun(arg2), rep(1, 99))
  arg2 <- seq(0, testlen / testsr, 0.1 / testsr)
  expect_equal(test$truncatedStepfun(arg2),
               test$stepfun(arg2) / test$stepfun(testlen / testsr), tolerance = 1e-12)
  
  arg2 <- seq(0, testlen / testsr, 0.025 * testlen / testsr)
  for (i in seq(along = arg2)) {
    expect_true(abs(integrate(test$truncatedKernfun, lower = 0, upper = arg2[i],
                              rel.tol = 1e-12)$value - test$truncatedStepfun(arg2[i])) < 1e-12,
                info = i)
  }

  ret <- test$truncatedAcfun(arg)
  expect_true(is.numeric(ret) && length(ret) == length(arg) && all(is.finite(ret)))
  arg2 <- rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedAcfun(-arg2), test$truncatedAcfun(arg2))
  
  arg2 <- - testlen / testsr - rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedAcfun(arg2), rep(0, 99))
  arg2 <- testlen / testsr + rep(1:9, time = 11) * rep(10^(-5:5), each = 9) / testsr
  expect_identical(test$truncatedAcfun(arg2), rep(0, 99))
  expect_equal(test$truncatedAcfun(0), 1, tol = 1e-12)
  
  if (testlen > 3) {
    variance2 <- integrate(function(t) sapply(t, function(s) test$truncatedKernfun(s)^2),
                           lower = 0, upper = testlen / testsr,
                           subdivisions = 1000L, rel.tol = 1e-12)$value
    
    arg2 <- seq(0, testlen / testsr, 0.025 * testlen / testsr)[-1]
    for (i in seq(along = arg2)) {
      expect_true(abs(integrate(function(t) sapply(t, function(s)
        test$truncatedKernfun(s) * test$truncatedKernfun(s - arg2[i])),
                                lower = arg2[i], upper = testlen / testsr, subdivisions = 1000L,
                                rel.tol = 1e-12)$value / 
                        variance2 - test$truncatedAcfun(arg2[i])) < 1e-12, info = i)
    }
  }

  expect_true(is.numeric(test$kern) && length(test$kern) == testlen + 1L)
  testArg <- (0:testlen + testshift) / testsr
  expect_identical(test$kern, test$kernfun(testArg) / sum(test$kernfun(testArg)))
  expect_true(is.numeric(test$step) && length(test$step) == testlen + 1L)
  expect_identical(test$step, test$stepfun(testArg))
  expect_true(is.numeric(test$acf) && length(test$acf) == testlen + 1L && 
                all(is.finite(test$acf)) && test$acf[testlen + 1L] != 0)
  expect_identical(test$acf, test$acfun(0:testlen / testsr))
}

test_that("everything works for default arguments", {
  ret <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1))
  expect_true(identical(ret, lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1,
                                      len = 11L, shift = 0.5),
              ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  testBessel(ret, testparam = list(pole = 4L, cutoff = 0.1), testsr = 1, testlen = 11L, testshift = 0.5)
})

test_that("type is tested and works", {
  expect_error(lowpassFilter(type = "test", param = list(pole = 4L, cutoff = 0.1)))
  expect_error(lowpassFilter(type = c("bessel", "bessel"), param = list(pole = 4L, cutoff = 0.1)))
  
  expect_true(identical(lowpassFilter(type = "be", param = list(pole = 4L, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
})

test_that("param is tested and works for type 'bessel'", {
  expect_error(lowpassFilter())
  expect_error(lowpassFilter(type = "bessel"))
  expect_error(lowpassFilter(type = "bessel", param = list()))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L)))
  expect_error(lowpassFilter(type = "bessel", param = list(cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1, test = 1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1, len = 10L)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1, sr = 2)))

  expect_error(lowpassFilter(type = "bessel", param = list(pole = NULL, cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = NA, cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = "s", cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = as.numeric(NA), cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = Inf, cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = c(2L, 4L), cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 0L, cutoff = 0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = -2L, cutoff = 0.1)))
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "be", param = list(pole = 4.5, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = "s")))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = NA)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = as.numeric(NA))))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = Inf)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = c(0.1, 0.2))))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = -0.1)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 1.1)))

  testBessel(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 30L),
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 1, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.5), len = 30L),
             testparam = list(pole = 3L, cutoff = 0.5), testsr = 1, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 2L, cutoff = 0.2), len = 30L),
             testparam = list(pole = 2L, cutoff = 0.2), testsr = 1, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 8L, cutoff = 0.241242), len = 30L),
             testparam = list(pole = 8L, cutoff = 0.241242), testsr = 1, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 8L, cutoff = 0.1), len = 30L),
             testparam = list(pole = 8L, cutoff = 0.1), testsr = 1, testlen = 30L, testshift = 0.5)
})

test_that("sr is tested and works", {
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = "s"))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = NA))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = as.numeric(NA)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = Inf))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = NULL))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = c(0.1, 0.2)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = -1))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 0))
  
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 30L),
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 1e4, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.5), len = 30L, sr = 1242.424),
             testparam = list(pole = 3L, cutoff = 0.5), testsr = 1242.424, testlen = 30L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 2L, cutoff = 0.2), len = 30L, sr = 0.1),
             testparam = list(pole = 2L, cutoff = 0.2), testsr = 0.1, testlen = 30L, testshift = 0.5)
})

test_that("len is tested and works", {
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = "s"))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = NA))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = as.numeric(NA)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = Inf))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = c(10L, 5L)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = -1L))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 0L))
  
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 10),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 10L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 10.5),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 10L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical

  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 11L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 11L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 2L, cutoff = 0.1), sr = 8e4),
                        lowpassFilter(type = "bessel", param = list(pole = 2L, cutoff = 0.1), sr = 8e4, len = 11L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.01), sr = 100),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.01),
                                      sr = 100, len = 108L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 6L, cutoff = 0.25), sr = 1e4),
                        lowpassFilter(type = "bessel", param = list(pole = 6L, cutoff = 0.25), sr = 1e4, len = 3L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 5L, cutoff = 0.05), sr = 1e4),
                        lowpassFilter(type = "bessel", param = list(pole = 5L, cutoff = 0.05), sr = 1e4, len = 21L),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  
  ret <- lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 1L)
  testBessel(ret,
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 1e4, testlen = 1L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.5), sr = 1242.424, len = 75L),
             testparam = list(pole = 3L, cutoff = 0.5), testsr = 1242.424, testlen = 75L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 2L, cutoff = 0.2), sr = 0.1, len = 2L),
             testparam = list(pole = 2L, cutoff = 0.2), testsr = 0.1, testlen = 2L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 1e4, len = 8L),
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 1e4, testlen = 8L, testshift = 0.5)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), sr = 5e4, len = 11L),
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 5e4, testlen = 11L, testshift = 0.5)
})

test_that("shift is tested and works", {
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = "s"))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = NA))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = as.numeric(NA)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = Inf))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = NULL))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = c(0.1, 0.2)))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = 1.0001))
  expect_error(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = -0.001))
  
  expect_true(identical(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1)),
                        lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), shift = 0.5),
                        ignore.environment = TRUE)) # ignore.environment cannot be passed to expect_identical
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 4L, cutoff = 0.1), len = 30L,
                           sr = 1e4, shift = 0),
             testparam = list(pole = 4L, cutoff = 0.1), testsr = 1e4, testlen = 30L, testshift = 0)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.5), len = 30L,
                           sr = 5e4, shift = 1),
             testparam = list(pole = 3L, cutoff = 0.5), testsr = 5e4, testlen = 30L, testshift = 1)
  testBessel(lowpassFilter(type = "bessel", param = list(pole = 3L, cutoff = 0.5), len = 30L,
                           sr = 5e4, shift = 0.2345),
             testparam = list(pole = 3L, cutoff = 0.5), testsr = 5e4, testlen = 30L, testshift = 0.2345)
})
