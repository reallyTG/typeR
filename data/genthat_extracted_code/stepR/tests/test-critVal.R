context("critVal")

source(system.file("tests/comparisons/penalisation.R", package = "stepR"))

testComputeLevel <- function(q, stat) {
  M <- ncol(stat)
  d <- nrow(stat)
  
  if (length(q) != d) {
    stop("dimensions from q and stat are not the same")
  }
  
  rejected <- matrix(FALSE, M, d)
  alpha <- numeric(M)
  
  for (i in 1:d) {  
    rejected[, i] <- stat[i, ] > q[i] + 1e-12
  }
  
  for (i in 1:M) {
    alpha[i] <- max(rejected[i, ])
  }
  alpha <- sum(alpha)
  
  ret <- list(alpha = alpha)
  
  beta <- numeric(d)
  for (i in 1:d) {
    beta[i] <- sum(rejected[, i])
  }
  ret$beta <- beta
  
  ret
}

testVector <- function(testq = NULL, testalpha = NULL, testn,
                       testnq = 2L^(as.integer(ceiling(log2(testn)) + 1e-12)), testweights = NULL,
                       testfamily = NULL, testintervalsystem = NULL, testlengths = NULL, teststat = NULL,
                       testr = 1e4, defaultPenalty, compareStat = teststat, compareLengths = testlengths,
                       compareWeights = testweights, tolerance = 1e-12, nstat = testn, ...) {
  # sqrt
  ret <- critVal(penalty = "sqrt", output = "vector", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths,
                 stat = teststat, r = testr, ...)
  
  expect_true(is.integer(attr(ret, "n")))
  expect_identical(attr(ret, "n"), nstat)

  compare <- testComputeLevel(q = ret, stat = compareStat)$alpha
  expect_true(compare <= as.integer(ncol(compareStat) * testalpha + tolerance), info = "sqrt")
  expect_true(compare > as.integer(ncol(compareStat) * testalpha + tolerance) - 1L, info = "sqrt")

  for (i in 1:length(ret)) {
    ret[i] <- penalisationSqrt(ret[i], nstat, compareLengths[i])
  }
  expect_equal(ret, rep(ret[1], length(ret)), check.attributes = FALSE, tolerance = tolerance, info = "sqrt")

  # log
  ret <- critVal(penalty = "log", output = "vector", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths,
                 stat = teststat, r = testr, ...)
  
  expect_true(is.integer(attr(ret, "n")))
  expect_identical(attr(ret, "n"), nstat)

  compare <- testComputeLevel(q = ret, stat = compareStat)$alpha
  expect_true(compare <= as.integer(ncol(compareStat) * testalpha + tolerance), info = "log")
  expect_true(compare > as.integer(ncol(compareStat) * testalpha + tolerance) - 1L, info = "log")

  for (i in 1:length(ret)) {
    ret[i] <- penalisationLog(ret[i], nstat, compareLengths[i])
  }
  expect_equal(ret, rep(ret[1], length(ret)), check.attributes = FALSE, tolerance = tolerance, info = "log")

  # none
  ret <- critVal(penalty = "none", output = "vector", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths,
                 stat = teststat, r = testr, ...)
  
  expect_true(is.integer(attr(ret, "n")))
  expect_identical(attr(ret, "n"), nstat)

  compare <- testComputeLevel(q = ret, stat = compareStat)$alpha
  expect_true(compare <= as.integer(ncol(compareStat) * testalpha + tolerance), info = "none")
  expect_true(compare > as.integer(ncol(compareStat) * testalpha + tolerance) - 1L, info = "none")

  expect_equal(ret, rep(ret[1], length(ret)), check.attributes = FALSE, tolerance = tolerance, info = "none")


  # weights
  ret <- critVal(penalty = "weights", weights = testweights, output = "vector", q = testq, alpha = testalpha,
                 n = testn, nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                 lengths = testlengths, stat = teststat, r = testr, ...)
  
  expect_true(is.integer(attr(ret, "n")))
  expect_identical(attr(ret, "n"), nstat)

  compare <- testComputeLevel(q = ret, stat = compareStat)
  expect_true(compare$alpha <= as.integer(ncol(compareStat) * testalpha + tolerance), info = "weights")
  expect_true(compare$alpha > as.integer(ncol(compareStat) * testalpha + tolerance) - 1L, info = "weights")

  expect_true(max(compare$beta / compareWeights) - min((compare$beta + 1) / compareWeights) <= 0.5,
              info = "weights")

  # default
  expect_identical(critVal(penalty = defaultPenalty, output = "vector", q = testq, alpha = testalpha,
                           n = testn, nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...),
                   critVal(output = "vector", q = testq, alpha = testalpha, n = testn, nq = testnq,
                           family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths, 
                           stat = teststat, r = testr, ...))
}

testValue <- function(testq = NULL, testalpha = NULL, testn, testnq = testn, testweights = NULL,
                      testfamily = NULL, testintervalsystem = NULL, testlengths = NULL, teststat = NULL,
                      testr = 1e4, defaultPenalty, tolerance = 1e-12, ...) {
  # sqrt
  ret <- critVal(penalty = "sqrt", output = "value", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths, 
                 stat = teststat, r = testr, ...)
  
  expect_identical(critVal(penalty = "sqrt", output = "vector", q = ret, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...),
                   critVal(penalty = "sqrt", output = "vector", q = testq, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...), info = "sqrt")
  
  # log
  ret <- critVal(penalty = "log", output = "value", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths, 
                 stat = teststat, r = testr, ...)
  
  expect_identical(critVal(penalty = "log", output = "vector", q = ret, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...),
                   critVal(penalty = "log", output = "vector", q = testq, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...), info = "log")
  
  # none
  ret <- critVal(penalty = "none", output = "value", q = testq, alpha = testalpha, n = testn, nq = testnq,
                 family = testfamily, intervalSystem = testintervalsystem, lengths = testlengths, 
                 stat = teststat, r = testr, ...)
  
  expect_identical(critVal(penalty = "none", output = "vector", q = ret, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...),
                   critVal(penalty = "none", output = "vector", q = testq, alpha = testalpha, n = testn,
                           nq = testnq, family = testfamily, intervalSystem = testintervalsystem,
                           lengths = testlengths, stat = teststat, r = testr, ...), info = "none")
  
  # default
  if (defaultPenalty != "weights") {
    expect_identical(critVal(output = "value", q = testq, alpha = testalpha, n = testn, nq = testnq,
                             family = testfamily, intervalSystem = testintervalsystem,
                             lengths = testlengths, stat = teststat, r = testr, ...),
                     critVal(penalty = defaultPenalty, output = "value", q = testq, alpha = testalpha,
                             n = testn, nq = testnq, family = testfamily,
                             intervalSystem = testintervalsystem, lengths = testlengths, stat = teststat,
                             r = testr, ...))
  }
}


test_that("function critVal works for given random generated statistics and default values", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(stat = teststat))
  expect_warning(ret <- critVal(n = testn, stat = teststat))
  expect_identical(ret, critVal(alpha = 0.5, n = testn, stat = teststat, nq = testn, family = "gauss",
                                intervalSystem = "all", lengths = 1:testn, penalty = "sqrt", output = "vector"))
  
  testVector(teststat = teststat, testn = testn, testlengths = 1:testn,
             testalpha = 0.1, testweights = rep(0.2, 5), defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testlengths = 1:testn,
            testalpha = 0.1, testweights = rep(0.2, 5), defaultPenalty = "sqrt")
})

test_that("output is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, output = c("v")))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, output = "mu"))

  expect_identical(critVal(alpha = 0.1, n = testn, stat = teststat),
                   critVal(alpha = 0.1, n = testn, stat = teststat, output = "vector"))
})

test_that("q is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(q = "s", alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = Inf, alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = c(rep(1, 4), "s"), alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = c(rep(1, 4), Inf), alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = rep(1, 7), alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = rep(1, 4), alpha = 0.1, n = testn, stat = teststat))
  expect_error(critVal(q = rep(1, 5), alpha = 0.1, n = testn, stat = teststat, output = "value"))

  compare <- 1
  attr(compare, "n") <- testn
  expect_identical(critVal(q = 1, n = testn, stat = teststat, output = "value"), compare)
  
  compare <- rep(1, 5)
  attr(compare, "n") <- testn
  expect_identical(critVal(q = rep(1, 5), n = testn, stat = teststat), compare)
  
  testq <- 1
  attr(testq, "n") <- 10L
  compare <- 1
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, stat = teststat, output = "value"), compare)
  
  testq <- rep(1, 5)
  attr(testq, "n") <- 10L
  compare <- rep(1, 5)
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, stat = teststat), compare)
  
  testq <- 1:10
  attr(testq, "n") <- 10L
  compare <- 1:5
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, stat = teststat), compare)
})

test_that("alpha is tested and works", {
  testn <- 30L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(alpha = "s", n = testn, stat = teststat))
  expect_error(critVal(alpha = NA, n = testn, stat = teststat))
  expect_error(critVal(alpha = Inf, n = testn, stat = teststat))
  expect_error(critVal(alpha = c(0.1, 0.05), n = testn, stat = teststat))
  expect_error(critVal(alpha = 0, n = testn, stat = teststat))
  expect_error(critVal(alpha = 1, n = testn, stat = teststat))
  expect_error(critVal(alpha = -0.05, n = testn, stat = teststat))
  expect_error(critVal(alpha = 1.1, n = testn, stat = teststat))
  
  testVector(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
             testalpha = 0.123, testweights = rep(1 / testn, testn), defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
            testalpha = 0.123, testweights = rep(1 / testn, testn), defaultPenalty = "sqrt")
  
  testVector(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
             testalpha = 0.01, testweights = rep(1 / testn, testn), defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
            testalpha = 0.01, testweights = rep(1 / testn, testn), defaultPenalty = "sqrt")
})

test_that("n is tested and works", {
  testn <- 30L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = "s", alpha = 0.1, stat = teststat))
  expect_error(critVal(n = c(1L, 2L), alpha = 0.1, stat = teststat))
  expect_error(critVal(n = NA, alpha = 0.1, stat = teststat))
  expect_error(critVal(n = NULL, alpha = 0.1, stat = teststat))
  expect_error(critVal(n = Inf, alpha = 0.1, stat = teststat))
  expect_error(critVal(n = 0L, alpha = 0.1, stat = teststat))
  expect_error(critVal(n = -1L, alpha = 0.1, stat = teststat))
  
  expect_identical(critVal(n = 30, alpha = 0.1, stat = teststat),
                   critVal(n = 30L, alpha = 0.1, stat = teststat))
  expect_identical(critVal(n = 30.5, alpha = 0.1, stat = teststat),
                   critVal(n = 30L, alpha = 0.1, stat = teststat))
})

test_that("nq is tested and works", {
  testn <- 10L

  expect_error(critVal(n = testn, nq = "s", alpha = 0.1, q = 1))
  expect_error(critVal(n = testn, nq = c(1L, 2L), alpha = 0.1, q = 1))
  expect_error(critVal(n = testn, nq = NA, alpha = 0.1, q = 1))
  expect_error(critVal(n = testn, nq = Inf, alpha = 0.1, q = 1))
  expect_error(critVal(n = testn, nq = NULL, alpha = 0.1, q = 1))
  expect_error(critVal(n = testn, nq = 8L, alpha = 0.1, q = 1))
})

test_that("attribute n of q is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  testq <- 1
  attr(testq, "n") <- "s"
  expect_error(critVal(q = testq, n = testn, stat = teststat, output = "value"))
  
  attr(testq, "n") <- c(1L, 2L)
  expect_error(critVal(q = testq, n = testn, stat = teststat, output = "value"))
  
  attr(testq, "n") <- 4L
  expect_error(critVal(q = testq, n = testn, stat = teststat, output = "value"))
  
  attr(testq, "n") <- Inf
  expect_error(critVal(q = testq, n = testn, stat = teststat, output = "value"))
  
  attr(testq, "n") <- NA
  expect_error(critVal(q = testq, n = testn, stat = teststat, output = "value"))
  
  attr(testq, "n") <- 5
  expect_identical(critVal(q = testq, n = testn, output = "value"),
                   critVal(q = 1, n = testn, output = "value"))
  attr(testq, "n") <- 5.5
  expect_identical(critVal(q = testq, n = testn, output = "value"),
                   critVal(q = 1, n = testn, output = "value"))
  
  attr(testq, "n") <- 10
  compare <- 1
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, output = "value"), compare)
  
  testq <- rep(1, 5)
  attr(testq, "n") <- "s"
  expect_error(critVal(q = testq, n = testn, stat = teststat))
  
  attr(testq, "n") <- c(1L, 2L)
  expect_error(critVal(q = testq, n = testn, stat = teststat))
  
  attr(testq, "n") <- 4L
  expect_error(critVal(q = testq, n = testn, stat = teststat))
  
  attr(testq, "n") <- Inf
  expect_error(critVal(q = testq, n = testn, stat = teststat))
  
  attr(testq, "n") <- NA
  expect_error(critVal(q = testq, n = testn, stat = teststat))
  
  attr(testq, "n") <- 5
  expect_identical(critVal(q = testq, n = testn),
                   critVal(q = rep(1, 5), n = testn))
  attr(testq, "n") <- 5.5
  expect_identical(critVal(q = testq, n = testn),
                   critVal(q = rep(1, 5), n = testn))
  
  attr(testq, "n") <- 10
  compare <- rep(1, 5)
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn), compare)
  
  testq <- rep(1, 10)
  attr(testq, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn), compare)  
})

test_that("family is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, family = ""))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, family = 1))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, family = c("gauss", "hsmuce")))
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat),
                   critVal(n = testn, alpha = 0.1, stat = teststat, family = "gauss"))
})

test_that("intervalSystem is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = ""))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dya"))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyalen"))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyapar"))
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat),
                   critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "all"))
  
  testq <- as.numeric(2^(0:5))
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaLen"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaLen"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar"), compare) 
  
  testq <- as.numeric(1:64)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar"), compare)   
  
  testq <- as.numeric(2^(0:6))
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar"), compare)   
  
  testn <- 32L
  teststat <- monteCarloSimulation(n = testn, r = 100L, intervalSystem = "dyaLen")
  testVector(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaLen")
  testValue(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaLen")
  testn <- 32L
  teststat <- monteCarloSimulation(n = testn, r = 100L, intervalSystem = "dyaPar")
  testVector(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaPar")
  testValue(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaPar")
})

test_that("lengths is tested and works", {
  testn <- 6L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = "s"))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:5, NA)))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:5, Inf)))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = 0:5))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = -1L))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1L, 46L)))
  
  expect_warning(ret <- critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:6, 6)))
  expect_identical(ret, critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:6)))
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(6:1)),
                   critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:6)))
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:6 + 0.5)),
                   critVal(n = testn, alpha = 0.1, stat = teststat, lengths = c(1:6)))
  
  testn <- 32L
  teststat <- monteCarloSimulation(n = testn, r = 100L, intervalSystem = "dyaLen")
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen", lengths = 3L))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen", lengths = 64L))
  
  testn <- 32L
  teststat <- monteCarloSimulation(n = testn, r = 100L, intervalSystem = "dyaPar")
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyaPar", lengths = 3L))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, intervalSystem = "dyaPar", lengths = 64L))

  testq <- as.numeric(1:8)
  compare <- as.numeric(1:5)
  attr(compare, "n") <- 8L
  expect_identical(critVal(q = testq, n = 8L, lengths = 1:5), compare)
  
  testq <- as.numeric(3:7)
  attr(testq, "n") <- 12L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 12L
  expect_identical(critVal(q = testq, n = 8L, lengths = 3:7), compare)  
  
  testq <- as.numeric(1:8)
  attr(testq, "n") <- 12L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 12L
  expect_identical(critVal(q = testq, n = 8L, lengths = 3:7), compare)  
  
  testq <- as.numeric(1:12)
  attr(testq, "n") <- 12L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 12L
  expect_identical(critVal(q = testq, n = 8L, lengths = 3:7), compare)
  
  testq <- as.numeric(1:5)
  attr(testq, "n") <- 32L
  compare <- as.numeric(1:5)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(0:4), intervalSystem = "dyaPar"), compare)
  
  testq <- as.numeric(1:6)
  attr(testq, "n") <- 32L
  compare <- as.numeric(1:5)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(0:4), intervalSystem = "dyaPar"), compare)
  
  testq <- as.numeric(1:5)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2:4)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(1:3), intervalSystem = "dyaPar"), compare)
  
  testq <- as.numeric(1:6)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2:4)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(1:3), intervalSystem = "dyaLen"), compare)

  teststat <- monteCarloSimulation(n = 16L, r = 100L)
  testVector(teststat = teststat, testn = 16L, testlengths = 2^(0:4), compareStat = teststat[2^(0:4), ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 5, 5),
             testintervalsystem = "all")
  teststat <- monteCarloSimulation(n = 18L, r = 100L)
  testValue(teststat = teststat, testn = 18L, testlengths = 2^(0:4),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "all")
  teststat <- monteCarloSimulation(n = 65L, r = 100L, intervalSystem = "dyaLen")
  testVector(teststat = teststat, testn = 65L, testlengths = c(2L, 8L, 16L, 32L, 64L),
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 5, 5),
             testintervalsystem = "dyaLen", compareStat = teststat[c(2, 4, 5, 6, 7), ])
  testValue(teststat = teststat, testn = 65L, testlengths = c(2L, 8L, 16L, 32L, 64L),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaLen")
  teststat <- monteCarloSimulation(n = 120L, r = 100L, intervalSystem = "dyaPar")
  testVector(teststat = teststat, testn = 120L, testlengths = c(1L, 2L, 8L, 32L, 64L),
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 5, 5),
             testintervalsystem = "dyaPar", compareStat = teststat[c(1, 2, 4, 6, 7), ])
  testValue(teststat = teststat, testn = 120L, testlengths = c(1L, 2L, 8L, 32L, 64L),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaPar")
})

test_that("penalty is tested and works", {
  testn <- 10L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, penalty = "", alpha = 0.1, stat = teststat))
  expect_error(critVal(n = testn, penalty = c("gauss"), alpha = 0.1, stat = teststat))
  
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat),
                   critVal(n = testn, penalty = "sqrt", alpha = 0.1, stat = teststat))
})

test_that("weights is tested and works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4), "s"), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4), NA), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4), Inf), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4)), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4), 0), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = c(rep(1 / 4, 4), -0.1), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = rep(1 / 8, 8), alpha = 0.1,
                       stat = teststat))
  expect_error(critVal(n = testn, penalty = "weights", weights = rep(1 / 5, 5), lengths = 1:4, alpha = 0.1,
                       stat = teststat))
  
  expect_identical(critVal(n = testn, alpha = 0.1, penalty = "weights", stat = teststat),
                   critVal(n = testn, alpha = 0.1, penalty = "weights", 
                           weights = rep(1 / testn, testn), stat = teststat))
  expect_identical(critVal(n = testn, penalty = "weights", weights = rep(1, testn), alpha = 0.1,
                           stat = teststat),
                   critVal(n = testn, penalty = "weights", weights = rep(1 / testn, testn), alpha = 0.1,
                           stat = teststat))
  
  expect_warning(ret <- critVal(n = testn, weights = rep(1 / testn, testn), alpha = 0.1, stat = teststat))
  expect_identical(ret, critVal(n = testn, alpha = 0.1, stat = teststat))
  
  testVector(teststat = teststat, testn = testn, testnq = 20L, testlengths = 1:testn,
             testalpha = 0.01, compareWeights = rep(1 / testn, testn), defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = 20L, testlengths = 1:testn,
            testalpha = 0.01, defaultPenalty = "sqrt")
  
  testVector(teststat = teststat, testn = testn, testnq = 20L, testlengths = 1:testn,
             testalpha = 0.01, testweights = 5:1 / sum(5:1), defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = 20L, testlengths = 1:testn,
            testalpha = 0.01, testweights = 5:1 / sum(5:1), defaultPenalty = "sqrt")
  
  testVector(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
             testalpha = 0.01, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
            testalpha = 0.01, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "sqrt")
  
  testVector(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
             testalpha = 1e-6, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
            testalpha = 1e-6, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "sqrt")
  
  testVector(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
             testalpha = 1 - 1e-6, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "sqrt")
  testValue(teststat = teststat, testn = testn, testnq = testn, testlengths = 1:testn,
            testalpha = 1- 1e-6, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "sqrt")
})

test_that("stat is tested and works if it is a matrix", {
  testn <- 6L
  teststat <- matrix(abs(rnorm(1e4 * testn)), testn, 1e4)
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaLen")
  attr(teststat, "n") <- 11L
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen"))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, penalty = "weights"))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaPar")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen"))
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L)
  testVector(teststat = teststat, testn = 6L, testlengths = 1:6, compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "all", nstat = 10L)
  testValue(teststat = teststat, testn = 6L, testlengths = 1:6,
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "all")
  teststat <- monteCarloSimulation(n = 40L, r = 100L, intervalSystem = "dyaLen")
  testVector(teststat = teststat, testn = 32L, testlengths = 2^(0:5), compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaLen", nstat = 40L)
  testValue(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaLen")
  teststat <- monteCarloSimulation(n = 64L, r = 100L, intervalSystem = "dyaPar")
  testVector(teststat = teststat, testn = 32L, testlengths = 2^(0:5), compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaPar", nstat = 64L)
  testValue(teststat = teststat, testn = 32L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaPar")
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L)
  testVector(teststat = teststat, testn = 8L, testlengths = 1:6, compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "all", nstat = 10L)
  testValue(teststat = teststat, testn = 8L, testlengths = 1:6,
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "all")
  teststat <- monteCarloSimulation(n = 40L, r = 100L, intervalSystem = "dyaLen")
  testVector(teststat = teststat, testn = 40L, testlengths = 2^(0:5), compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaLen", nstat = 40L)
  testValue(teststat = teststat, testn = 40L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaLen")
  teststat <- monteCarloSimulation(n = 127L, r = 100L, intervalSystem = "dyaPar")
  testVector(teststat = teststat, testn = 65L, testlengths = 2^(0:5), compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaPar", nstat = 127L)
  testValue(teststat = teststat, testn = 65L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaPar")
})

test_that("output is tested", {
  testn <- 6L
  teststat <- monteCarloSimulation(n = testn, r = 100L)
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, output = 1))
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, output = "mu"))
  expect_identical(critVal(n = testn, alpha = 0.1, stat = teststat),
                   critVal(n = testn, alpha = 0.1, stat = teststat, output = "ve"))
})

test_that("stat is tested and works if it is a vector", {
  teststat <- 1 + rnorm(1e4)
  expect_error(critVal(n = 32L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaLen", output = "maximum")
  attr(teststat, "n") <- 11L
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen"))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce", output = "maximum")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaPar", output = "maximum")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen"))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, lengths = 3:5, output = "maximum")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, lengths = 4:6))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, penalty = "log", output = "maximum")
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat))

  teststat <- monteCarloSimulation(n = 10L, r = 100L, output = "maximum")
  expect_error(critVal(n = 10L, alpha = 0.1, penalty = "weights", stat = teststat))
  
  teststatmatrix <- monteCarloSimulation(n = 6L, r = 100L)
  teststatvector <- monteCarloSimulation(n = 6L, r = 100L, output = "maximum")
  expect_identical(critVal(n = 6L, alpha = 0.1, stat = teststatmatrix),
                   critVal(n = 6L, alpha = 0.1, stat = teststatvector))
  
  teststatmatrix <- monteCarloSimulation(n = 15L, r = 100L)
  teststatvector <- monteCarloSimulation(n = 15L, r = 100L, output = "maximum", penalty = "log", lengths = 1:12)
  expect_identical(critVal(n = 12L, alpha = 0.1, stat = teststatmatrix, penalty = "log"),
                   critVal(n = 12L, alpha = 0.1, stat = teststatvector, penalty = "log"))
  
  teststatmatrix <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaLen")
  teststatvector <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaLen", 
                                         output = "maximum", penalty = "none", lengths = 2^(0:3))
  expect_identical(critVal(n = 8L, alpha = 0.1, stat = teststatmatrix, penalty = "none",
                           intervalSystem = "dyaLen"),
                   critVal(n = 8L, alpha = 0.1, stat = teststatvector, penalty = "none",
                           intervalSystem = "dyaLen"))

  teststatmatrix <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaLen")
  teststatvector <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaLen", 
                                         output = "maximum", penalty = "sqrt", lengths = c(1, 2, 8, 16))
  expect_identical(critVal(n = 32L, alpha = 0.1, stat = teststatmatrix, penalty = "sqrt",
                           lengths = c(1, 2, 8, 16), intervalSystem = "dyaLen"),
                   critVal(n = 32L, alpha = 0.1, stat = teststatvector, penalty = "sqrt",
                           lengths = c(1, 2, 8, 16), intervalSystem = "dyaLen"))

  teststatmatrix <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaPar")
  teststatvector <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaPar", 
                                         output = "maximum", penalty = "log", lengths = c(2, 4, 8, 16))
  expect_identical(critVal(n = 32L, alpha = 0.1, stat = teststatmatrix, penalty = "log",
                           lengths = c(2, 4, 8, 16), intervalSystem = "dyaPar"),
                   critVal(n = 32L, alpha = 0.1, stat = teststatvector, penalty = "log",
                           lengths = c(2, 4, 8, 16), intervalSystem = "dyaPar"))
  
  teststatmatrix <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaPar")
  teststatvector <- monteCarloSimulation(n = 32L, r = 100L, intervalSystem = "dyaPar", 
                                         output = "maximum", penalty = "none", lengths = 8)
  expect_identical(critVal(n = 32L, alpha = 0.1, stat = teststatmatrix, penalty = "none",
                           lengths = 8, intervalSystem = "dyaPar"),
                   critVal(n = 32L, alpha = 0.1, stat = teststatvector, penalty = "none",
                           lengths = 8, intervalSystem = "dyaPar"))
})

test_that("r is tested and works", {
  expect_error(critVal(100L, alpha = 0.1, r = "s", options = list(load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 0, options = list(load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = c(100, 200), options = list(load = list())))
  
  expect_identical(critVal(10L, alpha = 0.1, r = 100.5, options = list(load = list())),
                   critVal(10L, alpha = 0.1, r = 100L, options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 3L)
  expect_identical(critVal(3, alpha = 0.1, options = list(load = list())),
                   critVal(3, alpha = 0.1, stat = teststat))
})

test_that("stat works if it has to be simulated", {
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulat = "vector", save = list(), load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, options = "vector"))
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vecto", save = list(), load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = c("vector", "matrix"), save = list(), load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, penalty = "weights",
                       options = list(simulation = c("vector"), save = list(), load = list())))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(150L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, nq = 150L,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  teststat <- monteCarloSimulation(118L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", nq = 118L,
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                   lengths = c(2, 4, 8), penalty = "log")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log",
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log"))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 2:30)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30))
  
  teststat <- monteCarloSimulation(120L, r = 100L, output = "maximum", lengths = 2:30)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30, nq = 120L,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, lengths = c(2, 7:8, 100),
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, lengths = c(2, 7:8, 100)))
  
  teststat <- monteCarloSimulation(127L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64),
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64)))  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                   lengths = c(2, 4, 8), penalty = "log")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log",
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log"))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 2:30)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30))
  
  teststat <- monteCarloSimulation(120L, r = 100L, output = "maximum", lengths = 2:30)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30, nq = 120L,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, lengths = c(2, 7:8, 100),
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, lengths = c(2, 7:8, 100)))
  
  teststat <- monteCarloSimulation(127L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64),
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64)))
})

test_that("RDSfile is tested and stat can be saved in / loaded from an RDS file", {
  testfile <- c(tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"),
                tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"))
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile, test = 1),
                                      load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile),
                                      load = list(test = "test"))))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = c(testfile, testfile)),
                                                                         load = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = 10),
                                      load = list())))
  
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(readRDS(testfile[2]), teststat)
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = 10),
                                      save = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = testfile),
                                      save = list())))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaLen")
  attr(teststat, "n") <- 11L
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat,
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, penalty = "weights",
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaPar")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                       options = list(load = list(RDSfile = testfile[1]))))
  
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaLen", output = "maximum")
  attr(teststat, "n") <- 11L
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, family = "hsmuce", output = "maximum")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat,
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, intervalSystem = "dyaPar", output = "maximum")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, lengths = 3:5, output = "maximum")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat, lengths = 4:6,
                       options = list(load = list(RDSfile = testfile[1]))))
  teststat <- monteCarloSimulation(n = 10L, r = 100L, penalty = "log", output = "maximum")
  saveRDS(teststat, file = testfile[1])
  expect_error(critVal(n = 10L, alpha = 0.1, stat = teststat,
                       options = list(load = list(RDSfile = testfile[1]))))
  unlink(testfile[1])

  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststat)
  expect_false(file.exists(testfile[2]))
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[1]), teststat)
  expect_false(file.exists(testfile[2]))
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", penalty = "weights"))
  expect_false(file.exists(testfile[1]))
  expect_identical(readRDS(testfile[2]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[2]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(readRDS(testfile[2]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[2]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(readRDS(testfile[2]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[2]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  
  testfile <- c("", tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_false(file.exists(testfile[2]))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_false(file.exists(testfile[2]))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[2]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[2]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[2]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[2]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  
  testfile <- c(tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"), "")
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[1]), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = c("", "")), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(readRDS(testfile), teststatvec)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(RDSfile = testfile),
                                          load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile), teststatvec)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile[1]))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights",
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", penalty = "weights"))
  expect_identical(readRDS(testfile), teststat)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L,
                           options = list(simulation = "vector", save = list(),
                                          load = list(RDSfile = testfile))),
                   critVal(100L, alpha = 0.1, stat = teststat))
  unlink(testfile)
})

test_that("variable is tested and stat can be saved in a variable", {
  testvariable <- c("testsavevector", "testsavematrix")
  testStepR <- new.env()
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = c(testvariable, testvariable)),
                                      load = list(), envir = testStepR)))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = 10),
                                      load = list(), envir = testStepR)))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = "testStepR")))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, testStepR))))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, 10))))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)

  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", penalty = "weights"))
  expect_identical(get("testsavematrix", envir = testStepR), teststat)
  expect_false(exists("testsavevector", envir = testStepR))
  remove(testsavematrix, envir = testStepR)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsavematrix", envir = testStepR), teststat)
  expect_identical(get("testsavevector", envir = testStepR), teststatvec)
  remove(testsavematrix, envir = testStepR)
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavematrix", envir = testStepR), teststat)
  expect_identical(get("testsavevector", envir = testStepR), teststatvec)
  remove(testsavematrix, envir = testStepR)
  remove(testsavevector, envir = testStepR)
  
  
  testvariable <- c("", "testsavematrix")
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_false(exists("testsavevector", envir = testStepR))
  expect_false(exists("testsavematrix", envir = testStepR))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_false(exists("testsavevector", envir = testStepR))
  expect_false(exists("testsavematrix", envir = testStepR))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsavematrix", envir = testStepR), teststat)
  expect_false(exists("testsavevector", envir = testStepR))
  remove(testsavematrix, envir = testStepR)
  
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavematrix", envir = testStepR), teststat)
  expect_false(exists("testsavevector", envir = testStepR))
  remove(testsavematrix, envir = testStepR)
  
  
  testvariable <- c("testsavevector", "")
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsavevector", envir = testStepR), teststatvec)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavevector", envir = testStepR), teststatvec)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  
  testvariable <- "testsave"

  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", penalty = "weights"))
  expect_identical(get("testsave", envir = testStepR), teststat)
  remove(testsave, envir = testStepR)
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsave", envir = testStepR), teststat)
  remove(testsave, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsave", envir = testStepR), teststat)
  remove(testsave, envir = testStepR)
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_identical(get("testsave", envir = testStepR), teststatvec)
  remove(testsave, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat))
  expect_identical(get("testsave", envir = testStepR), teststatvec)
  remove(testsave, envir = testStepR)
  
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(RDSfile = c("", "")), load = list(),
                                          envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value"))
  expect_false(exists("testsavevector", envir = testStepR))
  expect_false(exists("testsavematrix", envir = testStepR))
})

test_that("stat can be saved in and loaded from the workspace", {
  testStepR <- new.env()
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(workspace = "matri"),
                                      load = list(), envir = testStepR)))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(workspace = c("vector", "matri")),
                                      load = list(), envir = testStepR)))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", load = list(workspace = "matri"),
                                      save = list(), envir = testStepR)))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", load = list(workspace = c("vector", "matri")),
                                      save = list(), envir = testStepR)))
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(workspace = "matrixIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = "matrixIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrixIncreased", save = list(),
                                          load = list(workspace = "matrixIncreased"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(workspace = "vector"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vector", save = list(),
                                          load = list(workspace = "vector"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(workspace = "vectorIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(workspace = "vectorIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(),
                                          load = list(workspace = "vectorIncreased"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(workspace = "vector"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  

  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(workspace = "vector"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststatvec)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "vector"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(workspace = "vectorIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = "vectorIncreased"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststatvec)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrixIncreased", save = list(),
                                          load = list(workspace = "vectorIncreased"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = "vector"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  
  
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "vectorIncreased"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vector")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(exists("critValStepRTab", where = testStepR, inherits = FALSE))
  

  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("vector")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  
  teststat200 <- monteCarloSimulation(100L, r = 200L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("vector")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat200, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat200)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("vector")),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat200)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vector", save = list(),
                                          load = list(workspace = "vector"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat200, output = "value", options = list()))
  remove(critValStepRTab, envir = testStepR)
  

  
  teststat1 <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", options = list()))
  
  teststat2 <- monteCarloSimulation(98L, r = 100L)
  teststat3 <- monteCarloSimulation(98L, r = 100L, output = "maximum")
  expect_identical(critVal(98L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(98L, alpha = 0.1, stat = teststat2, output = "value", options = list()))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststat4 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:102)
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "value", stat = teststat,
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(102L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  
  teststat1 <- monteCarloSimulation(100L, r = 200L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", options = list()))
  
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(102L, alpha = 0.1, stat = teststat4, output = "vector", options = list()))
  
  teststat5 <- monteCarloSimulation(73L, r = 100L, output = "maximum")
  expect_identical(critVal(73L, alpha = 0.1, r = 100L, output = "vector", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(73L, alpha = 0.1, stat = teststat5, output = "vector", options = list()))
  
  teststat6 <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", options = list()))
  
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector")),
                                          load = list(workspace = c("matrixIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", options = list()))
  
  teststat7 <- monteCarloSimulation(74L, r = 200L, output = "maximum")
  expect_identical(critVal(74L, alpha = 0.1, r = 200L, output = "vector",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vectorIncreased", "vector")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(74L, alpha = 0.1, stat = teststat7, output = "vector", options = list()))
  
  teststat8 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:120)
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vectorIncreased",
                                                                    "vector")),
                                          load = list(workspace = c("vectorIncreased", "matrixIncreased",
                                                                    "vector")),
                                          envir = testStepR)),
                   critVal(120L, alpha = 0.1, stat = teststat8, output = "value", options = list()))
  
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 7L)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat1)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[2]], teststat2)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[3]], teststat3)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[4]], teststat4)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[5]], teststat6)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[6]], teststat7)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[7]], teststat8)
  remove(critValStepRTab, envir = testStepR)
  

  
  teststat1 <- monteCarloSimulation(100L, r = 100L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  
  teststat2 <- monteCarloSimulation(98L, r = 100L, intervalSystem = "dyaPar")
  teststat3 <- monteCarloSimulation(98L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                    lengths = 2^(1:3))
  expect_identical(critVal(98L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3),
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector",
                                                                    "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(98L, alpha = 0.1, stat = teststat2, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3), options = list()))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststat4 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:102, penalty = "log")
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "value", stat = teststat, penalty = "log",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(102L, alpha = 0.1, stat = teststat, output = "value", penalty = "log",
                           options = list()))
  
  teststat1 <- monteCarloSimulation(100L, r = 200L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "vector", lengths = 1:102, penalty = "log",
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(102L, alpha = 0.1, stat = teststat4, output = "vector", lengths = 1:102,
                           penalty = "log", options = list()))
  
  teststat5 <- monteCarloSimulation(73L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 16L, penalty = "log")
  expect_identical(critVal(73L, alpha = 0.1, r = 100L, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(73L, alpha = 0.1, stat = teststat5, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", options = list()))
  
  teststat6 <- monteCarloSimulation(125L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights", nq = 125L,
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "weights",
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen", options = list()))
  
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), nq = 125L,
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector")),
                                          load = list(workspace = c("matrixIncreased", "matrix")),
                                          envir = testStepR)),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), options = list()))
  
  teststat <- monteCarloSimulation(74L, r = 200L, output = "maximum", rand.gen = function(data) {rnorm(74)})
  expect_identical(critVal(74L, alpha = 0.1, r = 200L, output = "vector", rand.gen = function(data) {rnorm(74)},
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vector")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR)),
                   critVal(74L, alpha = 0.1, stat = teststat, output = "vector", options = list()))
  
  teststat7 <- monteCarloSimulation(125L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 2^(3:5), penalty = "log")
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           lengths = 2^(3:5), penalty = "log", nq = 125L,
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vectorIncreased",
                                                                    "vector")),
                                          load = list(workspace = c("vectorIncreased", "matrixIncreased",
                                                                    "vector")),
                                          envir = testStepR)),
                   critVal(120L, alpha = 0.1, stat = teststat7, output = "value", options = list(),
                           intervalSystem = "dyaLen", lengths = 2^(3:5), penalty = "log"))
  
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 6L)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat1)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[2]], teststat2)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[3]], teststat3)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[4]], teststat4)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[5]], teststat6)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[6]], teststat7)
  remove(critValStepRTab, envir = testStepR)
})

test_that("stat can be saved in and loaded from the file system", {
  teststat <- monteCarloSimulation(100L, r = 100L)
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(fileSystem = "matri"),
                                      load = list(), dirs = "testStepR")))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(fileSystem = c("vector", "matri")),
                                      load = list(), dirs = "testStepR")))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", load = list(fileSystem = "matri"),
                                      save = list(), dirs = "testStepR")))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", load = list(fileSystem = c("vector", "matri")),
                                      save = list(), dirs = "testStepR")))
  
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = c("testStepR", "test"))))
  expect_error(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = 10)))
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(fileSystem = "matrixIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = "matrixIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrixIncreased", save = list(),
                                          load = list(fileSystem = "matrixIncreased"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = "matrix"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(fileSystem = "vector"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vector", save = list(),
                                          load = list(fileSystem = "vector"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(fileSystem = "vectorIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(fileSystem = "vectorIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vectorIncreased", save = list(),
                                          load = list(fileSystem = "vectorIncreased"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(fileSystem = "vector"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  teststatvec <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(fileSystem = "vector"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststatvec, "keyList"), dirs = "testStepR"), teststatvec)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "vector"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix", save = list(fileSystem = "vectorIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststatvec <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = "vectorIncreased"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststatvec, "keyList"), dirs = "testStepR"), teststatvec)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrixIncreased", save = list(),
                                          load = list(fileSystem = "vectorIncreased"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = "vector"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector", save = list(fileSystem = "matrix"),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  
  
  teststat <- monteCarloSimulation(100L, r = 100L)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:100)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vectorIncreased",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "vectorIncreased"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrix", "vector")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_false(file_test(op = "-d", file.path(R.cache::getCacheRootPath(), "testStepR")))
  
  
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("vector")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  
  teststat200 <- monteCarloSimulation(100L, r = 200L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("vector")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat200, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat200, "keyList"), dirs = "testStepR"), teststat200)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("vector")),
                                          load = list(), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  expect_identical(R.cache::loadCache(attr(teststat200, "keyList"), dirs = "testStepR"), teststat200)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "value",
                           options = list(simulation = "vector", save = list(),
                                          load = list(fileSystem = "vector"), dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat200, output = "value", options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  
  teststat1 <- monteCarloSimulation(100L, r = 100L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vector", "matrix")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", options = list()))
  
  teststat2 <- monteCarloSimulation(98L, r = 100L)
  teststat3 <- monteCarloSimulation(98L, r = 100L, output = "maximum")
  expect_identical(critVal(98L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrixIncreased", "vector",
                                                                     "matrix")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(98L, alpha = 0.1, stat = teststat2, output = "value", options = list()))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststat4 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:102)
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "value", stat = teststat,
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat, output = "value", options = list()))
  
  teststat1 <- monteCarloSimulation(100L, r = 200L, output = "maximum")
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vector", "matrix")),
                                          load = list(fileSystem = c("vector", "matrix")),
                                          dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", options = list()))
  
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat4, output = "vector", options = list()))
  
  teststat5 <- monteCarloSimulation(73L, r = 100L, output = "maximum")
  expect_identical(critVal(73L, alpha = 0.1, r = 100L, output = "vector", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(73L, alpha = 0.1, stat = teststat5, output = "vector", options = list()))
  
  teststat6 <- monteCarloSimulation(127L, r = 100L)
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrixIncreased", "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", options = list()))
  
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrixIncreased", "vector")),
                                          load = list(fileSystem = c("matrixIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", options = list()))
  
  teststat7 <- monteCarloSimulation(74L, r = 200L, output = "maximum")
  expect_identical(critVal(74L, alpha = 0.1, r = 200L, output = "vector",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(74L, alpha = 0.1, stat = teststat7, output = "vector", options = list()))
  
  teststat8 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:120)
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value",
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vector",
                                                                     "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrixIncreased",
                                                                    "vector")),
                                          dirs = "testStepR")),
                   critVal(120L, alpha = 0.1, stat = teststat8, output = "value", options = list()))
  
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 7L)
  expect_identical(R.cache::loadCache(attr(teststat1, "keyList"), dirs = "testStepR"), teststat1)
  expect_identical(R.cache::loadCache(attr(teststat2, "keyList"), dirs = "testStepR"), teststat2)
  expect_identical(R.cache::loadCache(attr(teststat3, "keyList"), dirs = "testStepR"), teststat3)
  expect_identical(R.cache::loadCache(attr(teststat4, "keyList"), dirs = "testStepR"), teststat4)
  expect_identical(R.cache::loadCache(attr(teststat6, "keyList"), dirs = "testStepR"), teststat6)
  expect_identical(R.cache::loadCache(attr(teststat7, "keyList"), dirs = "testStepR"), teststat7)
  expect_identical(R.cache::loadCache(attr(teststat8, "keyList"), dirs = "testStepR"), teststat8)
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  
  teststat1 <- monteCarloSimulation(100L, r = 100L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vector", "matrix")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  
  teststat2 <- monteCarloSimulation(98L, r = 100L, intervalSystem = "dyaPar")
  teststat3 <- monteCarloSimulation(98L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                    lengths = 2^(1:3))
  expect_identical(critVal(98L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3),
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrixIncreased", "vector",
                                                                     "matrix")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(98L, alpha = 0.1, stat = teststat2, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3), options = list()))
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststat4 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:102, penalty = "log")
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "value", stat = teststat, penalty = "log",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat, output = "value", penalty = "log",
                           options = list()))
  
  teststat1 <- monteCarloSimulation(100L, r = 200L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vector", "matrix")),
                                          load = list(fileSystem = c("vector", "matrix")),
                                          dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "vector", lengths = 1:102, penalty = "log",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat4, output = "vector", lengths = 1:102,
                           penalty = "log", options = list()))
  
  teststat5 <- monteCarloSimulation(73L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 16L, penalty = "log")
  expect_identical(critVal(73L, alpha = 0.1, r = 100L, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(73L, alpha = 0.1, stat = teststat5, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", options = list()))
  
  teststat6 <- monteCarloSimulation(125L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights", nq = 125L,
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen",
                           options = list(simulation = "matrixIncreased",
                                          save = list(fileSystem = c("matrixIncreased", "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "weights",
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen", options = list()))
  
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), nq = 125L,
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrixIncreased", "vector")),
                                          load = list(fileSystem = c("matrixIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), options = list()))
  
  teststat <- monteCarloSimulation(74L, r = 200L, output = "maximum", rand.gen = function(data) {rnorm(74)})
  expect_identical(critVal(74L, alpha = 0.1, r = 200L, output = "vector", rand.gen = function(data) {rnorm(74)},
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          dirs = "testStepR")),
                   critVal(74L, alpha = 0.1, stat = teststat, output = "vector", options = list()))
  
  teststat7 <- monteCarloSimulation(125L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 2^(3:5), penalty = "log")
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           lengths = 2^(3:5), penalty = "log", nq = 125L,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrixIncreased", "vectorIncreased")),
                                          load = list(fileSystem = c("vectorIncreased", "matrixIncreased",
                                                                    "vector")),
                                          dirs = "testStepR")),
                   critVal(120L, alpha = 0.1, stat = teststat7, intervalSystem = "dyaLen",
                           lengths = 2^(3:5), penalty = "log", output = "value", options = list()))
  
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 6L)
  expect_identical(R.cache::loadCache(attr(teststat1, "keyList"), dirs = "testStepR"), teststat1)
  expect_identical(R.cache::loadCache(attr(teststat2, "keyList"), dirs = "testStepR"), teststat2)
  expect_identical(R.cache::loadCache(attr(teststat3, "keyList"), dirs = "testStepR"), teststat3)
  expect_identical(R.cache::loadCache(attr(teststat4, "keyList"), dirs = "testStepR"), teststat4)
  expect_identical(R.cache::loadCache(attr(teststat6, "keyList"), dirs = "testStepR"), teststat6)
  expect_identical(R.cache::loadCache(attr(teststat7, "keyList"), dirs = "testStepR"), teststat7)
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
})

test_that("stat can be loaded from the stepRdata package", {
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(), load = list(package = "vector"))))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(),
                                      load = list(package = c(TRUE, FALSE)))))

  if ("stepRdata" %in% rownames(installed.packages())) {
    teststat <- monteCarloSimulation(31L)
    expect_equal(critVal(31L, alpha = 0.1, r = 100L, output = "value",
                         options = list(simulation = "matrixIncreased", load = list(package = TRUE))),
                 critVal(31L, alpha = 0.1, stat = teststat, output = "value"))
    
    teststat <- monteCarloSimulation(15L, intervalSystem = "dyaLen")
    expect_equal(critVal(12L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                         options = list(simulation = "matrix", load = list(package = TRUE))),
                 critVal(12L, alpha = 0.1, stat = teststat, output = "value", 
                         intervalSystem = "dyaLen"))
    
    teststat <- monteCarloSimulation(63L, intervalSystem = "dyaPar")
    expect_equal(critVal(33L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaPar",
                         options = list(simulation = "vectorIncreased", load = list(package = TRUE))),
                 critVal(33L, alpha = 0.1, stat = teststat, output = "value", 
                         intervalSystem = "dyaPar"))
  }
})

test_that("stat can be saved in and loaded from multiple options", {
  testStepR <- new.env()
  testvariable <- c("testsavevector", "testsavematrix")
  testfile <- c(tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"),
                tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"))
  
  teststat1 <- monteCarloSimulation(100L, r = 100L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix"),
                                                      fileSystem = c("matrixIncreased", "vector", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  expect_identical(readRDS(testfile[1]), teststat1)
  expect_false(file.exists(testfile[2]))
  expect_identical(get("testsavevector", envir = testStepR), teststat1)
  expect_false(exists("testsavematrix", envir = testStepR))
  
  teststat2 <- monteCarloSimulation(98L, r = 100L, intervalSystem = "dyaPar")
  teststat3 <- monteCarloSimulation(98L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                    lengths = 2^(1:3))
  expect_identical(critVal(98L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3),
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("vector"),
                                                      fileSystem = c("matrixIncreased", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   critVal(98L, alpha = 0.1, stat = teststat2, output = "value", intervalSystem = "dyaPar",
                           lengths = 2^(1:3), options = list()))
  expect_identical(readRDS(testfile[1]), teststat3)
  expect_identical(readRDS(testfile[2]), teststat2)
  expect_identical(get("testsavevector", envir = testStepR), teststat3)
  expect_identical(get("testsavematrix", envir = testStepR), teststat2)
  unlink(testfile)
  remove(testsavevector, envir = testStepR)
  
  teststat <- monteCarloSimulation(127L, r = 100L)
  teststat4 <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 1:102, penalty = "log")
  expect_identical(critVal(102L, alpha = 0.1, r = 100L, output = "value", stat = teststat, penalty = "log",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased"),
                                                      fileSystem = c("vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat, output = "value", penalty = "log",
                           options = list()))
  
  teststat1new <- monteCarloSimulation(100L, r = 200L, output = "maximum", lengths = c(23:34, 45:67))
  expect_identical(critVal(100L, alpha = 0.1, r = 200L, output = "value", lengths = c(23:34, 45:67),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(100L, alpha = 0.1, stat = teststat1new, output = "value", lengths = c(23:34, 45:67),
                           options = list()))
  
  expect_identical(critVal(102L, alpha = 0.1, r = 50L, output = "vector", lengths = 1:102, penalty = "log",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(102L, alpha = 0.1, stat = teststat4, output = "vector", lengths = 1:102,
                           penalty = "log", options = list()))
  
  teststat5 <- monteCarloSimulation(73L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 16L, penalty = "log")
  expect_identical(critVal(73L, alpha = 0.1, r = 100L, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vectorIncreased",
                                                                     "vector"),
                                                      workspace = c("matrix", "matrixIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(73L, alpha = 0.1, stat = teststat5, output = "vector", intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", options = list()))
  
  teststat6 <- monteCarloSimulation(125L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "weights", nq = 125L,
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "weights",
                           weights = 1:7 / sum(1:7), intervalSystem = "dyaLen", options = list()))
  
  teststat6b <- monteCarloSimulation(125L, r = 100L, output = "maximum", penalty = "log",
                                     intervalSystem = "dyaLen", lengths = 2^(4:6))
  expect_identical(critVal(107L, alpha = 0.1, r = 100L, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), nq = 125L,
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("matrixIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(107L, alpha = 0.1, stat = teststat6, output = "vector", penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(4:6), options = list()))
  
  teststat <- monteCarloSimulation(74L, r = 200L, output = "maximum", rand.gen = function(data) {rnorm(74)})
  expect_identical(critVal(74L, alpha = 0.1, r = 200L, output = "vector", rand.gen = function(data) {rnorm(74)},
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(74L, alpha = 0.1, stat = teststat, output = "vector", options = list()))
  
  teststat7 <- monteCarloSimulation(125L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 2^(3:5), penalty = "log")
  expect_identical(critVal(120L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           lengths = 2^(3:5), penalty = "log", nq = 125L,
                           options = list(simulation = "vectorIncreased",
                                          save = list(workspace = c("matrixIncreased", "vectorIncreased")),
                                          load = list(workspace = c("matrix", "vector"),
                                                      fileSystem = c("vectorIncreased", "matrixIncreased")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(120L, alpha = 0.1, stat = teststat7, output = "value", options = list(),
                           intervalSystem = "dyaLen", lengths = 2^(3:5), penalty = "log"))
  
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 5L)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat1new)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[2]], teststat3)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[3]], teststat4)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[4]], teststat6)
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[5]], teststat7)
  remove(critValStepRTab, envir = testStepR)
  
  
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 5L)
  expect_identical(R.cache::loadCache(attr(teststat1, "keyList"), dirs = "testStepR"), teststat1)
  expect_identical(R.cache::loadCache(attr(teststat2, "keyList"), dirs = "testStepR"), teststat2)
  expect_identical(R.cache::loadCache(attr(teststat4, "keyList"), dirs = "testStepR"), teststat4)
  expect_identical(R.cache::loadCache(attr(teststat5, "keyList"), dirs = "testStepR"), teststat5)
  expect_identical(R.cache::loadCache(attr(teststat6b, "keyList"), dirs = "testStepR"), teststat6b)
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
})

test_that("... is tested and works", {
  expect_error(critVal(100L, alpha = 0.1, test = 1, options = list(load = list())))
  
  expect_error(critVal(100L, alpha = 0.1, sd = "s", options = list(load = list())))
  expect_error(critVal(100L, alpha = 0.1, sd = 0, options = list(load = list())))
  expect_error(critVal(100L, alpha = 0.1, sd = c(1, 2), options = list(load = list())))

  teststat <- monteCarloSimulation(n = 15L)
  expect_identical(critVal(12, alpha = 0.1, sd = 5, options = list(load = list())),
                   critVal(12, alpha = 0.1, stat = teststat))
  
  expect_error(supressWarning(critVal(100L, alpha = 0.1, r = 100L, seed = "s", options = list(load = list()))))
  expect_identical(critVal(12, alpha = 0.1, r = 100L, seed = c(1, 2), options = list(load = list())),
                   critVal(12, alpha = 0.1, r = 100L, seed = 1L, options = list(load = list())))
  
  expect_identical(critVal(12, alpha = 0.1, r = 100L, seed = 100.5, options = list(load = list())),
                   critVal(12, alpha = 0.1, r = 100L, seed = 100L, options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 15L, r = 100L)
  expect_identical(critVal(12, alpha = 0.1, r = 100L, seed = 15L, options = list(load = list())),
                   critVal(12, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(critVal(10L, alpha = 0.1, r = 100L, rand.gen = 10, options = list(load = list())))
  expect_error(critVal(10L, alpha = 0.1, r = 100L, rand.gen = function(data, n) {rnorm(10)},
                       options = list(load = list())))
  expect_error(critVal(10L, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(10)},
                       options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 15L, r = 100L)
  expect_identical(critVal(12, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(15)},
                           options = list(load = list())),
                   critVal(12, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(critVal(10L, alpha = 0.1, r = 100L, messages = "s", options = list(load = list())))
  expect_error(critVal(10L, alpha = 0.1, r = 100L, messages = c(10, 20), options = list(load = list())))
  expect_error(critVal(10L, alpha = 0.1, r = 100L, messages = 0, options = list(load = list())))
  
  expect_identical(suppressMessages(critVal(12, alpha = 0.1, r = 100L, messages = 10.5,
                                           options = list(load = list()))),
                   suppressMessages(critVal(12, alpha = 0.1, r = 100L, messages = 10L,
                                            options = list(load = list()))))
})

test_that("family 'hsmuce' works", {
  testn <- 5L
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "hsmuce")
  
  expect_error(critVal(stat = teststat, family = "hsmuce"))
  expect_warning(ret <- critVal(n = 2^testn, stat = teststat, family = "hsmuce"))
  expect_identical(ret, critVal(alpha = 0.5, n = 2^testn, stat = teststat, nq = 2^testn, family = "hsmuce",
                                intervalSystem = "dyaPar", lengths = 2^(1:5), penalty = "weights",
                                output = "vector"))
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = as.integer(2^testn), testfamily = "hsmuce",
             testlengths = 2^(1:testn), testalpha = 0.1, testweights = rep(0.2, 5),
             defaultPenalty = "weights")
  testValue(teststat = teststat, testn = as.integer(2^testn), testnq =as.integer(2^testn), testfamily = "hsmuce",
            testlengths = 2^(1:testn), testalpha = 0.1, testweights = rep(0.2, 5),
            defaultPenalty = "weights")

  expect_error(critVal(q = "s", alpha = 0.1, n = as.integer(2^testn), stat = teststat, family = "hsmuce"))
  expect_error(critVal(q = rep(1, 8), alpha = 0.1, n = as.integer(2^testn), stat = teststat, family = "hsmuce"))
  expect_error(critVal(q = rep(1, 4), alpha = 0.1, n = as.integer(2^testn), stat = teststat, family = "hsmuce"))
  
  testcompare <- 1
  attr(testcompare, "n") <- as.integer(2^testn)
  expect_identical(critVal(q = 1, n = as.integer(2^testn), stat = teststat, output = "value", family = "hsmuce",
                           penalty = "sqrt"), testcompare)
  testcompare <- rep(1, 5)
  attr(testcompare, "n") <- as.integer(2^testn)
  expect_identical(critVal(q = rep(1, 5), n = as.integer(2^testn), stat = teststat, family = "hsmuce"),
                   testcompare)

  testn <- 10L
  teststat <- monteCarloSimulation(n = 1024L, r = 100L, family = "hsmuce")
  
  expect_error(critVal(alpha = 0, n = 2^testn, stat = teststat, family = "hsmuce"))
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testfamily = "hsmuce",
             testlengths = 2^(1:testn), testalpha = 0.0567, testweights = rep(0.1, 10),
             defaultPenalty = "weights")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testfamily = "hsmuce",
            testlengths = 2^(1:testn), testalpha = 0.0567, testweights = rep(0.1, 10),
            defaultPenalty = "weights")

  expect_error(critVal(n = "s", alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(critVal(n = c(1L, 2L), alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(critVal(n = Inf, alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  expect_identical(critVal(n = 1010, alpha = 0.1, stat = teststat, family = "hsmuce"),
                   critVal(n = 1010L, alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_identical(critVal(n = 1010.5, alpha = 0.1, stat = teststat, family = "hsmuce"),
                   critVal(n = 1010L, alpha = 0.1, stat = teststat, family = "hsmuce"))

  expect_identical(critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "hsmuce"),
                   critVal(n = 2^testn, nq = 2^testn, alpha = 0.1, stat = teststat, family = "hsmuce"))
  

  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^20L, testfamily = "hsmuce",
             testlengths = 2^(1:testn), testalpha = 0.01, testweights = rep(0.1, 10),
             defaultPenalty = "weights")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testfamily = "hsmuce",
            testlengths = 2^(1:testn), testalpha = 0.01, testweights = rep(0.1, 10),
            defaultPenalty = "weights")

  expect_error(critVal(n = 2^testn, penalty = "", alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(critVal(n = 2^testn, penalty = c("gauss"), alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  expect_identical(critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "hsmuce"),
                   critVal(n = 2^testn, penalty = "weights", alpha = 0.1, stat = teststat,
                           family = "hsmuce"))

  testn <- 5L
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "hsmuce")
  
  expect_identical(critVal(n = 2^testn, alpha = 0.1, penalty = "weights", stat = teststat,
                           family = "hsmuce"),
                   critVal(n = 2^testn, alpha = 0.1, penalty = "weights", 
                           weights = rep(1 / testn, testn), stat = teststat, family = "hsmuce"))
  expect_identical(critVal(n = 2^testn, penalty = "weights", weights = rep(1, testn), alpha = 0.1,
                           stat = teststat, family = "hsmuce"),
                   critVal(n = 2^testn, penalty = "weights", weights = rep(1 / testn, testn),
                           alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^20L, testlengths = 2^(1:testn),
             testalpha = 0.01, compareWeights = rep(1 / testn, testn), defaultPenalty = "weights", 
             testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testlengths = 2^(1:testn),
            testalpha = 0.01, defaultPenalty = "weights", testfamily = "hsmuce")
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^20L, testlengths = 2^(1:testn),
             testalpha = 0.01, testweights = 5:1 / sum(5:1), defaultPenalty = "weights",
             testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testlengths = 2^(1:testn),
            testalpha = 0.01, testweights = 5:1 / sum(5:1), defaultPenalty = "weights",
            testfamily = "hsmuce")
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(1:testn),
             testalpha = 0.01, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "weights", testfamily = "hsmuce")
  testValue(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(1:testn),
            testalpha = 0.01, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "weights", testfamily = "hsmuce")
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(1:testn),
             testalpha = 1e-6, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "weights", testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testlengths = 2^(1:testn),
            testalpha = 1e-6, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "weights", testfamily = "hsmuce")
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(1:testn),
             testalpha = 1 - 1e-6, testweights = c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
             defaultPenalty = "weights", testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testlengths = 2^(1:testn),
            testalpha = 1- 1e-6, testweights =  c(5, 3, 6, 3, 9) / sum(c(5, 3, 6, 3, 9)),
            defaultPenalty = "weights", testfamily = "hsmuce")

  expect_identical(critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "hsmuce"),
                   critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "hsmuce",
                           intervalSystem = "dyaPar"))
  
  teststat <- monteCarloSimulation(n = 6L, r = 100L, family = "hsmuce", intervalSystem = "all")
  testVector(teststat = teststat, testn = 6L, testnq = 20L, testlengths = 1:testn + 1,
             testalpha = 0.1, defaultPenalty = "weights", testweights = rep(1 / testn, testn),
             testintervalsystem = "all", testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 6L, testnq = 20L, testlengths = 1:testn + 1,
            testalpha = 0.1, defaultPenalty = "weights", testintervalsystem = "all", testfamily = "hsmuce")
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "hsmuce", intervalSystem = "dyaLen")
  testVector(teststat = teststat, testn = 32L, testnq = 32L, testlengths = 2^(1:5),
             testalpha = 0.1, defaultPenalty = "weights", testweights = rep(1 / testn, testn),
             testintervalsystem = "dyaLen", testfamily = "hsmuce")
  testValue(teststat = teststat, testn = 32L, testnq = 32L, testlengths = 2^(1:5),
            testalpha = 0.1, defaultPenalty = "weights", testintervalsystem = "dyaLen",
            testfamily = "hsmuce")

  testn <- 6L
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "hsmuce")
  
  expect_error(critVal(n = testn, alpha = 0.1, stat = teststat, lengths = "s", family = "hsmuce"))
  expect_error(critVal(n = 2^testn, alpha = 0.1, stat = teststat, lengths = 2^(0:5),
                       family = "hsmuce"))
  expect_error(critVal(n = 2^testn, alpha = 0.1, stat = teststat, lengths = c(2^(2:6), 0L),
                       family = "hsmuce"))
  
  expect_error(critVal(q = 1, n = testn, stat = teststat, output = "value", family = "hsmuce"))
  
  compare <- 1
  attr(compare, "n") <- testn
  expect_identical(critVal(q = 1, n = testn, stat = teststat, output = "value", family = "hsmuce",
                           penalty = "sqrt"), compare)
  
  compare <- rep(1, 5)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = rep(1, 5), n = 32L, stat = teststat, family = "hsmuce"), compare)
  
  testq <- 1
  attr(testq, "n") <- 10L
  compare <- 1
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, stat = teststat, output = "value", family = "hsmuce",
                           penalty = "log"), compare)
  
  testq <- rep(1, 5)
  attr(testq, "n") <- 100L
  compare <- rep(1, 5)
  attr(compare, "n") <- 100L
  expect_identical(critVal(q = testq, n = 32L, stat = teststat, family = "hsmuce"), compare)
  
  testq <- as.numeric(2^(1:5))
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(1:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaLen", family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(1:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaLen", family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(1:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar", family = "hsmuce"), compare) 
  
  testq <- as.numeric(1:64)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(1:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar", family = "hsmuce"), compare)   
  
  testq <- as.numeric(2^(1:6))
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(1:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "dyaPar", family = "hsmuce"), compare) 
  
  testq <- as.numeric(2:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2:32)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "all", family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2:32)
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "all", family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2:32)
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "all", family = "hsmuce"), compare) 
  
  testq <- as.numeric(1:64)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2:32)
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "all", family = "hsmuce"), compare)   
  
  testq <- as.numeric(2:64)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2:32)
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, intervalSystem = "all", family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:5)
  compare <- as.numeric(1:5)
  attr(compare, "n") <- 256L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(1:5), family = "hsmuce"), compare)
  
  testq <- as.numeric(1:8)
  compare <- as.numeric(1:5)
  attr(compare, "n") <- 256L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(1:5), family = "hsmuce"), compare)
  
  testq <- as.numeric(3:7)
  attr(testq, "n") <- 4096L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 4096L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(3:7), family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:8)
  attr(testq, "n") <- 4096L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 4096L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(3:7), family = "hsmuce"), compare)  
  
  testq <- as.numeric(1:12)
  attr(testq, "n") <- 4096L
  compare <- as.numeric(3:7)
  attr(compare, "n") <- 4096L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(3:7), family = "hsmuce"), compare)
  
  testq <- as.numeric(1:4096)
  attr(testq, "n") <- 4096L
  compare <- as.numeric(2^(3:7))
  attr(compare, "n") <- 4096L
  expect_identical(critVal(q = testq, n = 256L, lengths = 2^(3:7), family = "hsmuce"), compare)
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(1:4))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(1:4), intervalSystem = "all", family = "hsmuce"),
                   compare)

  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(2:3))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(2:3), intervalSystem = "all", family = "hsmuce"),
                   compare)
  
  testq <- as.numeric(1:16)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(2:3))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(2:3), intervalSystem = "all", family = "hsmuce"),
                   compare)
  
  testq <- as.numeric(2^(2:3))
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(2:3))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 16L, lengths = 2^(2:3), intervalSystem = "all", family = "hsmuce"),
                   compare)
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                   lengths = c(2, 4, 8), penalty = "log", family = "hsmuce")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, family = "hsmuce",
                           lengths = c(2, 4, 8), penalty = "log",
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, family = "hsmuce",
                           lengths = c(2, 4, 8), penalty = "log"))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 2:30, family = "hsmuce",
                                   intervalSystem = "all", penalty = "sqrt")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30, family = "hsmuce",
                           intervalSystem = "all", penalty = "sqrt",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30, family = "hsmuce",
                           intervalSystem = "all", penalty = "sqrt"))
  
  teststat <- monteCarloSimulation(120L, r = 100L, output = "maximum", lengths = 2:30, family = "hsmuce",
                                   intervalSystem = "all", penalty = "sqrt")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30, family = "hsmuce",
                           intervalSystem = "all", penalty = "sqrt", nq = 120L,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30, family = "hsmuce",
                           intervalSystem = "all", penalty = "sqrt"))
  
  teststat <- monteCarloSimulation(100L, r = 100L, family = "hsmuce")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, lengths = c(2, 4, 32), family = "hsmuce",
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, lengths = c(2, 4, 32), family = "hsmuce"))
  
  teststat <- monteCarloSimulation(127L, r = 100L, intervalSystem = "dyaLen", family = "hsmuce")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64), family = "hsmuce",
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64), family = "hsmuce"))
  
  testStepR <- new.env()
  teststat <- monteCarloSimulation(100L, r = 100L, family = "hsmuce")
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", family = "hsmuce",
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", family = "hsmuce", 
                           options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "vector", family = "hsmuce",
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", options = list(), 
                           family = "hsmuce"))
  remove(critValStepRTab, envir = testStepR)
  
  if ("stepRdata" %in% rownames(installed.packages())) {
    teststat <- monteCarloSimulation(31L, family = "hsmuce", intervalSystem = "all")
    expect_equal(critVal(31L, alpha = 0.1, r = 100L, family = "hsmuce", intervalSystem = "all",
                         options = list(simulation = "matrixIncreased", load = list(package = TRUE))),
                 critVal(31L, alpha = 0.1, stat = teststat, family = "hsmuce", intervalSystem = "all"))
    
    teststat <- monteCarloSimulation(15L, family = "hsmuce", intervalSystem = "dyaLen")
    expect_equal(critVal(12L, alpha = 0.1, r = 100L, family = "hsmuce", intervalSystem = "dyaLen",
                         options = list(simulation = "matrixIncreased", load = list(package = TRUE))),
                 critVal(12L, alpha = 0.1, stat = teststat, family = "hsmuce", intervalSystem = "dyaLen"))
    
    teststat <- monteCarloSimulation(63L, family = "hsmuce", intervalSystem = "dyaPar")
    expect_equal(critVal(33L, alpha = 0.1, r = 100L, family = "hsmuce", intervalSystem = "dyaPar",
                         options = list(simulation = "matrixIncreased", load = list(package = TRUE))),
                 critVal(33L, alpha = 0.1, stat = teststat, family = "hsmuce", intervalSystem = "dyaPar"))
  }
})

test_that("family 'mDependentPS' works", {
  testCovariances <- seq(1, 0.2, -0.2)
  teststat <- monteCarloSimulation(n = 16L, r = 100L, family = "mDependentPS", covariances = testCovariances)
  
  expect_error(critVal(stat = teststat, family = "mDependentPS", covariances = testCovariances))
  expect_warning(ret <- critVal(n = 16L, stat = teststat, family = "mDependentPS",
                                covariances = testCovariances))
  expect_identical(ret, critVal(alpha = 0.5, n = 16L, stat = teststat, nq = 16L, family = "mDependentPS",
                                covariances = testCovariances,
                                intervalSystem = "dyaLen", lengths = 2^(0:4), penalty = "sqrt",
                                output = "vector"))
  
  testVector(teststat = teststat, testn = 16L, testnq = 16L, testfamily = "mDependentPS",
             testlengths = 2^(0:4), testalpha = 0.1, testweights = rep(0.2, 5),
             defaultPenalty = "sqrt", covariances = testCovariances)
  testValue(teststat = teststat, testn = 16L, testnq = 16L, testfamily = "mDependentPS",
            testlengths = 2^(0:4), testalpha = 0.1, testweights = rep(0.2, 5),
            defaultPenalty = "sqrt", covariances = testCovariances)
  
  expect_error(critVal(q = "s", alpha = 0.1, n = 16L, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(q = rep(1, 8), alpha = 0.1, n = 16L, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(q = rep(1, 4), alpha = 0.1, n = 16L, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  
  
  testn <- 10L
  testCovariances <- c(1, 0.56, 0.234, 0.123)
  teststat <- monteCarloSimulation(n = 1024L, r = 100L, family = "mDependentPS", covariances = testCovariances)
  
  expect_error(critVal(alpha = 0, n = 2^testn, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  
  testVector(teststat = teststat, testn = 1024L, testnq = 2^testn, testfamily = "mDependentPS",
             testlengths = 2^(0:testn), testalpha = 0.0567, testweights = rep(1 / 11, 11),
             defaultPenalty = "sqrt", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testfamily = "mDependentPS",
            testlengths = 2^(0:testn), testalpha = 0.0567, testweights = rep(1 / 11, 11),
            defaultPenalty = "sqrt", covariances = testCovariances)
  
  expect_error(critVal(n = "s", alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(n = c(1L, 2L), alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(n = Inf, alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(n = 0L, alpha = 0.1, stat = as.matrix(teststat[1, ]), family = "mDependentPS",
                       covariances = testCovariances))
  
  expect_identical(critVal(n = 1010, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances),
                   critVal(n = 1010L, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances))
  expect_identical(critVal(n = 1010.5, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances),
                   critVal(n = 1010L, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances))

  expect_identical(critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances),
                   critVal(n = 2^testn, nq = 2^testn, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances))
  
  testVector(teststat = teststat, testn = 1024L, testnq = 2^20L, testfamily = "mDependentPS",
             testlengths = 2^(0:testn), testalpha = 0.01, testweights = rep(1 / 11, 11),
             defaultPenalty = "sqrt", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testfamily = "mDependentPS",
            testlengths = 2^(0:testn), testalpha = 0.01, testweights = rep(1 / 11, 11),
            defaultPenalty = "sqrt", covariances = testCovariances)
  
  expect_error(critVal(n = 2^testn, penalty = "", alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testCovariances))
  expect_error(critVal(n = 2^testn, penalty = c("gauss"), alpha = 0.1, stat = teststat,
                       family = "mDependentPS", covariances = testCovariances))
  
  expect_identical(critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances),
                   critVal(n = 2^testn, penalty = "sqrt", alpha = 0.1, stat = teststat,
                           family = "mDependentPS", covariances = testCovariances))
  
  testn <- 5L
  testCovariances <- c(3, 2, 0.5, -1)
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "mDependentPS", covariances = testCovariances)
  
  expect_identical(critVal(n = 2^testn, alpha = 0.1, penalty = "weights", stat = teststat,
                           family = "mDependentPS", covariances = testCovariances),
                   critVal(n = 2^testn, alpha = 0.1, penalty = "weights", 
                           weights = rep(1 / 6, 6), stat = teststat, family = "mDependentPS",
                           covariances = testCovariances))
  expect_identical(critVal(n = 2^testn, penalty = "weights", weights = rep(1, 6), alpha = 0.1,
                           stat = teststat, family = "mDependentPS", covariances = testCovariances),
                   critVal(n = 2^testn, penalty = "weights", weights = rep(1 / 6, 6),
                           alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances))
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^20L, testlengths = 2^(0:testn),
             testalpha = 0.01, compareWeights = rep(1 / 6, 6), defaultPenalty = "sqrt", 
             testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testlengths = 2^(0:testn),
            testalpha = 0.01, defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^20L, testlengths = 2^(0:testn),
             testalpha = 0.01, testweights = 6:1 / sum(6:1), defaultPenalty = "sqrt",
             testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^20L, testlengths = 2^(0:testn),
            testalpha = 0.01, testweights = 6:1 / sum(6:1), defaultPenalty = "sqrt",
            testfamily = "mDependentPS", covariances = testCovariances)
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(0:testn),
             testalpha = 0.01, testweights = c(5, 3, 6, 3, 9, 1) / sum(c(5, 3, 6, 3, 9, 1)),
             defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testlengths = 2^(0:testn),
            testalpha = 0.01, testweights =  c(5, 3, 6, 3, 9, 1) / sum(c(5, 3, 6, 3, 9, 1)),
            defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(0:testn),
             testalpha = 1e-6, testweights = c(5, 3, 6, 3, 9, 6) / sum(c(5, 3, 6, 3, 9, 6)),
             defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testlengths = 2^(0:testn),
            testalpha = 1e-6, testweights =  c(5, 3, 6, 3, 9, 6) / sum(c(5, 3, 6, 3, 9, 6)),
            defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  
  testVector(teststat = teststat, testn = as.integer(2^testn), testnq = 2^testn, testlengths = 2^(0:testn),
             testalpha = 1 - 1e-6, testweights = c(5, 3, 6, 3, 9, 13) / sum(c(5, 3, 6, 3, 9, 13)),
             defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 2^testn, testnq = 2^testn, testlengths = 2^(0:testn),
            testalpha = 1- 1e-6, testweights =  c(5, 3, 6, 3, 9, 13) / sum(c(5, 3, 6, 3, 9, 13)),
            defaultPenalty = "sqrt", testfamily = "mDependentPS", covariances = testCovariances)
  
  expect_identical(critVal(n = as.integer(2^testn), alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances),
                   critVal(n = 2^testn, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances,
                           intervalSystem = "dyaLen"))
  
  teststat <- monteCarloSimulation(n = 12L, r = 100L, family = "mDependentPS", covariances = testCovariances,
                                   intervalSystem = "all")
  testVector(teststat = teststat, testn = 12L, testnq = 20L, testlengths = 1:6, compareStat = teststat[1:6, ],
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "all", testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 12L, testnq = 20L, testlengths = 1:6,
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "all",
            testfamily = "mDependentPS", covariances = testCovariances)
  teststat <- monteCarloSimulation(n = 32L, r = 100L, family = "mDependentPS", covariances = testCovariances,
                                   intervalSystem = "dyaPar")
  testVector(teststat = teststat, testn = 32L, testnq = 32L, testlengths = 2^(0:5),
             testalpha = 0.1, defaultPenalty = "sqrt", testweights = rep(1 / 6, 6),
             testintervalsystem = "dyaPar", testfamily = "mDependentPS", covariances = testCovariances)
  testValue(teststat = teststat, testn = 32L, testnq = 32L, testlengths = 2^(0:5),
            testalpha = 0.1, defaultPenalty = "sqrt", testintervalsystem = "dyaPar",
            testfamily = "mDependentPS", covariances = testCovariances)
  
  compare <- 1
  attr(compare, "n") <- testn
  expect_identical(critVal(q = 1, n = testn, stat = teststat, output = "value", family = "mDependentPS",
                           covariances = testCovariances), compare)
  
  compare <- rep(1, 5)
  attr(compare, "n") <- 16L
  expect_identical(critVal(q = rep(1, 5), n = 16L, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances), compare)
  
  testq <- 1
  attr(testq, "n") <- 10L
  compare <- 1
  attr(compare, "n") <- 10L
  expect_identical(critVal(q = testq, n = testn, stat = teststat, output = "value", family = "mDependentPS",
                           covariances = testCovariances), compare)
  
  testq <- rep(1, 5)
  attr(testq, "n") <- 20L
  compare <- rep(1, 5)
  attr(compare, "n") <- 20L
  expect_identical(critVal(q = testq, n = 16L, stat = teststat, family = "mDependentPS",
                           covariances = testCovariances), compare)
  
  
  
  testq <- as.numeric(2^(0:5))
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, family = "mDependentPS",
                           covariances = testCovariances), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 32L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 32L
  expect_identical(critVal(q = testq, n = 32L, family = "mDependentPS",
                           covariances = testCovariances), compare)  
  
  testq <- as.numeric(1:32)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, family = "mDependentPS",
                           covariances = testCovariances), compare) 
  
  testq <- as.numeric(1:64)
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, family = "mDependentPS",
                           covariances = testCovariances), compare)   
  
  testq <- as.numeric(2^(0:6))
  attr(testq, "n") <- 64L
  compare <- as.numeric(2^(0:5))
  attr(compare, "n") <- 64L
  expect_identical(critVal(q = testq, n = 32L, family = "mDependentPS",
                           covariances = testCovariances), compare)
  
  teststat <- monteCarloSimulation(100L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                   lengths = c(2, 4, 8), penalty = "log", family = "mDependentPS",
                                   covariances = testCovariances)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log", family = "mDependentPS",
                           covariances = testCovariances,
                           options = list(simulation = "vector", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log", family = "mDependentPS",
                           covariances = testCovariances))
  
  teststat <- monteCarloSimulation(127L, r = 100L, output = "maximum", lengths = 2:30)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = 2:30,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = 2:30))
  
  teststat <- monteCarloSimulation(120L, r = 100L, output = "maximum", lengths = c(2, 4, 8),
                                   family = "mDependentPS", covariances = testCovariances)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", lengths = c(2, 4, 8), nq = 120L,
                           family = "mDependentPS", covariances = testCovariances,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", lengths = c(2, 4, 8),
                           family = "mDependentPS", covariances = testCovariances))
  
  teststat <- monteCarloSimulation(100L, r = 100L, family = "mDependentPS",
                                   covariances = testCovariances)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, lengths = c(2, 8, 64), family = "mDependentPS",
                           covariances = testCovariances,
                           options = list(simulation = "matrix", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, lengths = c(2, 8, 64), family = "mDependentPS",
                           covariances = testCovariances))
  
  teststat <- monteCarloSimulation(127L, r = 100L, intervalSystem = "dyaLen", family = "mDependentPS",
                                   covariances = testCovariances)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64), family = "mDependentPS",
                           covariances = testCovariances,
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "value", intervalSystem = "dyaLen",
                           penalty = "log", lengths = c(4, 8, 32, 64), family = "mDependentPS",
                           covariances = testCovariances))
  
  testStepR <- new.env()
  teststat <- monteCarloSimulation(100L, r = 100L, family = "mDependentPS",
                                   covariances = testCovariances)
  expect_identical(critVal(100L, alpha = 0.1, r = 100L, output = "vector", family = "mDependentPS",
                           covariances = testCovariances,
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", family = "mDependentPS",
                           covariances = testCovariances, options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(100L, alpha = 0.1, r = 50L, output = "vector", family = "mDependentPS",
                           covariances = testCovariances + 1e-12,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(100L, alpha = 0.1, stat = teststat, output = "vector", options = list(),
                           family = "mDependentPS", covariances = testCovariances))
  remove(critValStepRTab, envir = testStepR)
})

test_that("results of digest are as expected", {
  expect_identical(digest::sha1("gauss"), "55f46ed9e4d5824c6dbbb5dd42d3e5612aa38c38")
  expect_identical(digest::sha1("hsmuce"), "ea85b0b1784732506a5dadd685474b19542d5499")
  expect_identical(digest::sha1(list("mDependentPS", c(0.8, 0.5, 0.3)), digits = 6),
                   "bafaebb5df35ee66e46fbd34a6f8c34027600481")

  expect_identical(digest::digest(list(31, digest::sha1("gauss"), "all")),
                   "19d55f7c6d6b9db86f1b4f1123fbc9b6")
  expect_identical(digest::digest(list(120, digest::sha1("hsmuce"), "dyaPar")),
                   "8bb33d5ae7ce51a591342a8ebfa9b83f")
  expect_identical(digest::digest(list(19, digest::sha1(list("mDependentPS", c(0.8, 0.5, 0.3))), "dyaLen")),
                   "b29ba0b06d7e287384cbb20ed22a1ac6")
  
  expect_identical(digest::digest(list(31, digest::sha1("gauss"), "all", 1:31, "sqrt")),
                   "3ae1d6f7ad6615143286979e6f43dab2")
  expect_identical(digest::digest(list(120, digest::sha1("hsmuce"), "dyaPar", c(2, 4, 16), "none")),
                   "d872fa9a922a1898076cb3939e04ef96")
  expect_identical(digest::digest(list(19, digest::sha1(list("mDependentPS", c(0.8, 0.5, 0.3))), "dyaLen",
                                       c(2, 4, 8, 16), "log")),
                   "7f02f681cef8e209c54e2b4f303e8a71")
})

