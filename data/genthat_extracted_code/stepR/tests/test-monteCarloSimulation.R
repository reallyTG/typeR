context("monteCarloSimulation")

testrnorm1 <- function(testn, testr, testseed, testfamily, testintervalSystem, testlengths, testpenalty,
                      tolerance, allLengths = testlengths) {
  retvector <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                    intervalSystem = testintervalSystem, lengths = NULL,
                                    penalty = NULL, output = "vector")
  retmax <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                 intervalSystem = testintervalSystem, lengths = testlengths,
                                 penalty = testpenalty, output = "maximum")
  set.seed(testseed)
  for (i in 1:testr) {
    y <- rnorm(testn)
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = NULL, penalty = "none", output = "vector", sd = 1),
                 retvector[ ,i], tolerance = tolerance)
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = testlengths, penalty = testpenalty, output = "maximum", sd = 1),
                 retmax[i], tolerance = tolerance)
  }
  testkeyList <- list(testn, digest::sha1(list("gauss"), digits = 6), testintervalSystem)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retvector, "keyList"), testkeyList)
  expect_identical(attr(retvector, "key"), testkey)
  expect_identical(attr(retvector, "n"), testn)
  expect_identical(attr(retvector, "lengths"), allLengths)
  expect_s3_class(retvector, "MCSimulationVector")
  

  testkeyList <- list(testn, digest::sha1(list("gauss"), digits = 6),
                      testintervalSystem, as.integer(testlengths), testpenalty)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retmax, "keyList"), testkeyList)
  expect_identical(attr(retmax, "key"), testkey)
  expect_identical(attr(retmax, "n"), testn)
  expect_identical(attr(retmax, "lengths"), testlengths)
  expect_s3_class(retmax, "MCSimulationMaximum")
}

testrnorm <- function(testn, testr, testseed, testfamily, testintervalSystem, testlengths, testpenalty,
                       tolerance, allLengths = testlengths) {
  retvector <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                    intervalSystem = testintervalSystem, lengths = NULL,
                                    penalty = NULL, output = "vector")
  retmax <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                 intervalSystem = testintervalSystem, lengths = testlengths,
                                 penalty = testpenalty, output = "maximum")
  set.seed(testseed)
  for (i in 1:testr) {
    y <- rnorm(testn)
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = NULL, penalty = "none", output = "vector"),
                 retvector[ ,i], tolerance = tolerance)
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = testlengths, penalty = testpenalty, output = "maximum"),
                 retmax[i], tolerance = tolerance)
  }
  
  testkeyList <- list(testn, digest::sha1(list("hsmuce"), digits = 6),
                      testintervalSystem)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retvector, "keyList"), testkeyList)
  expect_identical(attr(retvector, "key"), testkey)
  expect_identical(attr(retvector, "n"), testn)
  expect_identical(attr(retvector, "lengths"), allLengths)
  expect_s3_class(retvector, "MCSimulationVector")
  
  testkeyList <- list(testn, digest::sha1(list("hsmuce"), digits = 6),
                      testintervalSystem, as.integer(testlengths), testpenalty)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retmax, "keyList"), testkeyList)
  expect_identical(attr(retmax, "key"), testkey)
  expect_identical(attr(retmax, "n"), testn)
  expect_identical(attr(retmax, "lengths"), testlengths)
  expect_s3_class(retmax, "MCSimulationMaximum")
}

testrand.genMDependent <- function(data) {
  ma <- testcomputeMA(data$covariances)
  as.numeric(arima.sim(n = data$n, list(ma = ma), sd = 1)) / sqrt(sum(c(1, ma)^2))
}

testcomputeMA <- function(cov) {
  N <- length(cov) - 1
  alpha <- matrix(rep(0, N * N), nrow = N, ncol = N)
  vs <- rep(cov[1], N + 1)
  
  for(i in 1:N){
    alpha[i, 1:i] <- rep(0, i)
    alpha[i, i] <- cov[i + 1] / vs[1]
    if(i > 1) {
      for(k in 1:(i - 1)) {
        js <- 0:(k - 1)
        alpha[i, i - k] <- (cov[i - k + 1] - sum(alpha[i, i - js] * alpha[k, k - js] * vs[js + 1])) / vs[k + 1]
      }
    }
    js <- 0:(i - 1)
    vs[i + 1] <- vs[i + 1] - sum(alpha[i, i - js]^2 * vs[js + 1])
  }
  
  alpha[N, ]
}

testbyfilter <- function(testn, testr, testseed, testfamily, testintervalSystem, testlengths, testpenalty,
                         tolerance, testcovariances, allLengths = testlengths) {
  retvector <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                    intervalSystem = testintervalSystem, lengths = NULL,
                                    penalty = NULL, output = "vector", covariances = testcovariances)
  retmax <- monteCarloSimulation(n = testn, r = testr, seed = testseed, family = testfamily,
                                 intervalSystem = testintervalSystem, lengths = testlengths,
                                 penalty = testpenalty, output = "maximum", covariances = testcovariances)
  set.seed(testseed)
  ma <- testcomputeMA(testcovariances)
  for (i in 1:testr) {
    y <- as.numeric(arima.sim(n = testn, list(ma = ma), sd = 1)) / sqrt(sum(c(1, ma)^2))
    
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = NULL, penalty = "none", output = "vector",
                             covariances = testcovariances),
                 retvector[ ,i], tolerance = tolerance)
    expect_equal(computeStat(y, family = testfamily, intervalSystem = testintervalSystem,
                             lengths = testlengths, penalty = testpenalty, output = "maximum",
                             covariances = testcovariances),
                 retmax[i], tolerance = tolerance)
  }
  
  testkeyList <- list(testn, digest::sha1(list("mDependentPS", ma), digits = 6),
                      testintervalSystem)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retvector, "keyList"), testkeyList)
  expect_identical(attr(retvector, "key"), testkey)
  expect_identical(attr(retvector, "n"), testn)
  expect_identical(attr(retvector, "lengths"), allLengths)
  expect_s3_class(retvector, "MCSimulationVector")
  
  testkeyList <- list(testn, digest::sha1(list("mDependentPS", ma), digits = 6),
                      testintervalSystem, as.integer(testlengths), testpenalty)
  testkey <- digest::digest(testkeyList)
  expect_identical(attr(retmax, "keyList"), testkeyList)
  expect_identical(attr(retmax, "key"), testkey)
  expect_identical(attr(retmax, "n"), testn)
  expect_identical(attr(retmax, "lengths"), testlengths)
  expect_s3_class(retmax, "MCSimulationMaximum")
}

test_that("argument n is tested and works", {
  expect_error(monteCarloSimulation())
  expect_error(monteCarloSimulation(n = "s"))
  expect_error(monteCarloSimulation(n = c(1L, 2L)))
  expect_error(monteCarloSimulation(n = NA))
  expect_error(monteCarloSimulation(n = Inf))
  expect_error(monteCarloSimulation(n = 0L))
  expect_error(monteCarloSimulation(n = -1L))
  expect_identical(monteCarloSimulation(n = 32), monteCarloSimulation(n = 32L))
  expect_identical(monteCarloSimulation(n = 32.5), monteCarloSimulation(n = 32L))
  expect_equal(monteCarloSimulation(n = 32L),
                   monteCarloSimulation(n = 32L, r = 1e4L, seed = 32L,
                                        rand.gen = function(data) rnorm(data$n),
                                        family = "gauss", intervalSystem = "all", lengths = NULL,
                                        penalty = "none", output = "vector", sd = 1), check.attributes = FALSE)
  
  testrnorm1(testn = 32L, testr = 10L, testseed = 1L, testfamily = "gauss", testintervalSystem = "all",
            testlengths = 1:32, testpenalty = "none", tolerance = 1e-14)
})

test_that("argument r is tested and works", {
  expect_error(monteCarloSimulation(n = 32L, r = "s"))
  expect_error(monteCarloSimulation(n = 32L, r = c(1L, 2L)))
  expect_error(monteCarloSimulation(n = 32L, r = NA))
  expect_error(monteCarloSimulation(n = 32L, r = Inf))
  expect_error(monteCarloSimulation(n = 32L, r = 0L))
  expect_error(monteCarloSimulation(n = 32L, r = -1L))
  expect_identical(monteCarloSimulation(n = 32L), monteCarloSimulation(n = 32L, r = 1e4L))
  expect_identical(monteCarloSimulation(n = 32L, r = 100), monteCarloSimulation(n = 32L, r = 100L))
  expect_identical(monteCarloSimulation(n = 32L, r = 100.5), monteCarloSimulation(n = 32L, r = 100L))
})

test_that("argument seed is tested and works", {
  expect_error(suppressWarnings(monteCarloSimulation(n = 32L, seed = "s")))
  expect_error(suppressWarnings(monteCarloSimulation(n = 32L, seed = NA)))
  expect_error(suppressWarnings(monteCarloSimulation(n = 32L, seed = Inf)))
  set.seed(0L)
  expect_identical(monteCarloSimulation(n = 32L, r = 100L, seed = "no"),
                   monteCarloSimulation(n = 32L, r = 100L, seed = 0L))
  expect_identical(monteCarloSimulation(n = 32L, r = 100L),
                   monteCarloSimulation(n = 32L, r = 100L, seed = 32L))
  expect_identical(monteCarloSimulation(n = 32L, r = 100L, seed = 0),
                   monteCarloSimulation(n = 32L, r = 100L, seed = 0L))
  expect_identical(monteCarloSimulation(n = 32L, r = 100L, seed = 0.5),
                   monteCarloSimulation(n = 32L, r = 100L, seed = 0L))
  
  testrnorm1(testn = 32L, testr = 10L, testseed = -1L, testfamily = "gauss", testintervalSystem = "all",
            testlengths = 1:32, testpenalty = "none", tolerance = 1e-14)
})

test_that("argument rand.gen is tested and works", {
  expect_error(monteCarloSimulation(n = 32L, rand.gen = "s"))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function() {}))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(test) {rnorm(32)}))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(data, test) {rnorm(32)}))
  
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(data) {rnorm(31)}))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(data) {c(rnorm(31), NA)}))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(data) {c(rnorm(31), "NA")}))
  expect_error(monteCarloSimulation(n = 32L, rand.gen = function(data) {c(rnorm(31), Inf)}))
  
  expect_equal(monteCarloSimulation(n = 32L, r = 100L),
               monteCarloSimulation(n = 32L, r = 100L, rand.gen = function(data) {rnorm(32)}),
               check.attributes = FALSE)
})

test_that("argument messages is tested and works", {
  expect_error(monteCarloSimulation(n = 32L, messages = "s"))
  expect_error(monteCarloSimulation(n = 32L, messages = c(1L, 2L)))
  expect_error(monteCarloSimulation(n = 32L, messages = NA))
  expect_error(monteCarloSimulation(n = 32L, messages = Inf))
  expect_error(monteCarloSimulation(n = 32L, messages = 0L))
  expect_error(monteCarloSimulation(n = 32L, messages = -1L))
  expect_identical(suppressMessages(monteCarloSimulation(n = 32L, r = 100L, messages = 10L)),
                   monteCarloSimulation(n = 32L, r = 100L))
  expect_identical(suppressMessages(monteCarloSimulation(n = 32L, r = 100L, messages = 3)),
                   suppressMessages(monteCarloSimulation(n = 32L, r = 100L, messages = 3.5)))
  expect_identical(suppressMessages(monteCarloSimulation(n = 32L, r = 100L, messages = 10L)),
                   monteCarloSimulation(n = 32L, r = 100L))
})

test_that("argument family is tested and works in the default case", { # other families below
  expect_error(monteCarloSimulation(n = 32L, family = ""))
  expect_error(monteCarloSimulation(n = 32L, family = c("gauss", "hsmuce")))
  expect_identical(monteCarloSimulation(n = 32L, r = 10L),
                   monteCarloSimulation(n = 32L, r = 10L, family = "gauss"))
})

test_that("argument intervalSystem is tested and works", {
  expect_error(monteCarloSimulation(n = 32L, intervalSystem = ""))
  expect_error(monteCarloSimulation(n = 32L, intervalSystem = "dya"))
  expect_error(monteCarloSimulation(n = 32L, intervalSystem = "dyalen"))
  expect_error(monteCarloSimulation(n = 32L, intervalSystem = "dyapar"))
  expect_identical(monteCarloSimulation(n = 34L, r = 10L),
                   monteCarloSimulation(n = 34L, r = 10L, intervalSystem = "all"))
  
  testrnorm1(testn = 28L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaLen",
            testlengths = as.integer(2^(0:4)), testpenalty = "sqrt", tolerance = 1e-14)
  testrnorm1(testn = 33L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaPar",
            testlengths = as.integer(2^(0:5)), testpenalty = "sqrt", tolerance = 1e-14)
})

test_that("argument lengths is tested and works", {
  expect_warning(ret <- monteCarloSimulation(n = 32L, r = 10L, lengths = 1:10))
  expect_identical(ret, monteCarloSimulation(n = 32L, r = 10L))
  
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = "s"))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = c(1:10, NA)))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = c(1:10, Inf)))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = 0:10))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = -1L))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", lengths = c(1L, 46L)))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", intervalSystem = "dyaLen", lengths = 3L))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", intervalSystem = "dyaLen", lengths = 64L))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", intervalSystem = "dyaPar", lengths = 3L))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", intervalSystem = "dyaPar", lengths = 64L))
  
  expect_identical(monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1, 4, 10)),
                   monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1L, 4L, 10L)))
  expect_warning(ret <- monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1:10, 10)))
  expect_identical(ret, monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1:10)))
  expect_identical(monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(10:1)),
                   monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1:10)))
  expect_identical(monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1:10 + 0.5)),
                   monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = c(1:10)))
  
  expect_equal(monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = 2^(0:5)),
               monteCarloSimulation(n = 32L, output = "maximum", r = 10L, intervalSystem = "dyaLen"),
               check.attributes = FALSE)
  expect_equal(monteCarloSimulation(n = 32L, output = "maximum", r = 10L, lengths = 2^(3:4)),
               monteCarloSimulation(n = 32L, output = "maximum", r = 10L, intervalSystem = "dyaLen",
                                    lengths = 2^(3:4)), check.attributes = FALSE)
  
  testlengths <- c(1L, 3:5, 10:23)
  testrnorm1(testn = 28L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = 1:28)
  
  testlengths <- c(1L, 4L, 32L)
  testrnorm1(testn = 32L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(0:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm1(testn = 24L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(0:4)))
})

test_that("argument penalty is tested and works in the default case", {
  expect_warning(ret <- monteCarloSimulation(n = 32L, r = 10L, penalty = "log"))
  expect_identical(ret, monteCarloSimulation(n = 32L, r = 10L))
  
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", penalty = ""))
  expect_error(monteCarloSimulation(n = 32L, output = "maximum", penalty = c("gauss")))
  expect_identical(monteCarloSimulation(n = 32L, r = 10L, sd = 1),
                   monteCarloSimulation(n = 32L, r = 10L, penalty = "none", sd = 1))
  
  testlengths <- c(1L, 3:5, 10:23)
  testrnorm1(testn = 28L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = 1:28)
  
  testlengths <- c(1L, 4L, 32L)
  testrnorm1(testn = 32L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(0:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm1(testn = 24L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(0:4)))
  
  testlengths <- c(1L, 3:5, 10:23)
  testrnorm1(testn = 28L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = 1:28)
  
  testlengths <- c(1L, 4L, 32L)
  testrnorm1(testn = 32L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = as.integer(2^(0:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm1(testn = 24L, testr = 10L, testseed = 10L, testfamily = "gauss", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = as.integer(2^(0:4)))
})

test_that("argument output is tested and works in the default case", {
  expect_error(monteCarloSimulation(n = 32L, output = 1))
  expect_error(monteCarloSimulation(n = 32L, output = "mu"))
  expect_identical(monteCarloSimulation(n = 32L, r = 10L),
                   monteCarloSimulation(n = 32L, r = 10L, output = "vector"))
})

test_that("... is tested and works", {
  expect_error(monteCarloSimulation(n = 32L, familty = "hsmuce"))
  expect_error(monteCarloSimulation(n = 32L, sd = "s"))
  expect_identical(monteCarloSimulation(n = 32L, r = 1e2),
                   monteCarloSimulation(n = 32L, r = 1e2, sd = 5))
})

test_that("family 'hsmuce' works", {
  expect_error(monteCarloSimulation(family = "hsmuce"))
  expect_error(monteCarloSimulation(family = "hsmuce", n = "s"))
  expect_identical(monteCarloSimulation(family = "hsmuce", n = 32),
                   monteCarloSimulation(family = "hsmuce", n = 32L))
  expect_identical(monteCarloSimulation(family = "hsmuce", n = 32.5),
                   monteCarloSimulation(family = "hsmuce", n = 32L))
  expect_equal(monteCarloSimulation(family = "hsmuce", n = 32L),
               monteCarloSimulation(n = 32L, r = 1e4L, seed = 32L,
                                    rand.gen = function(data) rnorm(data$n),
                                    family = "hsmuce", intervalSystem = "dyaPar", output = "vector"),
               check.attributes = FALSE)
  
  testrnorm(testn = 32L, testr = 10L, testseed = 1L, testfamily = "hsmuce", testintervalSystem = "all",
            testlengths = 2:32, testpenalty = "none", tolerance = 1e-14)

  testrnorm(testn = 32L, testr = 10L, testseed = -1L, testfamily = "hsmuce", testintervalSystem = "dyaPar",
            testlengths = as.integer(2^(1:5)), testpenalty = "none", tolerance = 1e-14)

  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, rand.gen = "s"))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, rand.gen = function() {}))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, rand.gen = function(test) {rnorm(32)}))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L,
                                    rand.gen = function(data, test) {rnorm(32)}))
  
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, rand.gen = function(data) {rnorm(31)}))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), NA)}))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), "NA")}))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), Inf)}))
  
  expect_equal(monteCarloSimulation(family = "hsmuce", n = 32L, r = 100L),
               monteCarloSimulation(family = "hsmuce", n = 32L, r = 100L,
                                    rand.gen = function(data) {rnorm(32)}), check.attributes = FALSE)

  expect_identical(monteCarloSimulation(family = "hsmuce", n = 34L, r = 10L),
                   monteCarloSimulation(family = "hsmuce", n = 34L, r = 10L, intervalSystem = "dyaPar"))
  
  testrnorm(testn = 28L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "all",
            testlengths = 2:28, testpenalty = "none", tolerance = 1e-14)
  testrnorm(testn = 28L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaLen",
            testlengths = as.integer(2^(1:4)), testpenalty = "none", tolerance = 1e-14)
  
  expect_error(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, lengths = 1L))
  expect_error(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, lengths = c(33L)))
  expect_error(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, intervalSystem = "all",
                                    lengths = 1L))
  expect_error(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, intervalSystem = "dyaLen",
                                    lengths = 1L))
  
  expect_equal(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L,
                                    intervalSystem = "all", lengths = 2^(1:5)),
               monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L,
                                    intervalSystem = "dyaLen"), check.attributes = FALSE)
  expect_equal(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L,
                                    intervalSystem = "all", lengths = 2^(3:4)),
               monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L,
                                    intervalSystem = "dyaLen", lengths = 2^(3:4)), check.attributes = FALSE)
  
  testlengths <- c(2:5, 10:23)
  testrnorm(testn = 28L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "none", tolerance = 1e-14, allLengths = 2:28)
  
  testlengths <- c(2L, 4L, 8L)
  testrnorm(testn = 32L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "none", tolerance = 1e-14, allLengths = as.integer(2^(1:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm(testn = 24L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "none", tolerance = 1e-14, allLengths = as.integer(2^(1:4)))

  expect_identical(monteCarloSimulation(family = "hsmuce", n = 32L, r = 10L),
                   monteCarloSimulation(family = "hsmuce", n = 32L, r = 10L, penalty = "none"))
  expect_identical(monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L),
                   monteCarloSimulation(family = "hsmuce", output = "maximum", n = 32L, r = 10L, penalty = "none"))
  
  testlengths <- c(2:5, 8L, 10:23)
  testrnorm(testn = 28L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = 2:28)
  
  testlengths <- c(2L, 4L, 32L)
  testrnorm(testn = 32L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(1:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm(testn = 24L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "sqrt", tolerance = 1e-14, allLengths = as.integer(2^(1:4)))
  
  testlengths <- c(2:5, 8L, 10:23)
  testrnorm(testn = 28L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "all",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = 2:28)
  
  testlengths <- c(2L, 4L, 32L)
  testrnorm(testn = 32L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaLen",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = as.integer(2^(1:5)))
  
  testlengths <- c(2L, 4L, 16L)
  testrnorm(testn = 24L, testr = 10L, testseed = 10L, testfamily = "hsmuce", testintervalSystem = "dyaPar",
            testlengths = testlengths, testpenalty = "log", tolerance = 1e-14, allLengths = as.integer(2^(1:4)))

  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, intervalsystem = "dyaPar"))
  expect_error(monteCarloSimulation(family = "hsmuce", n = 32L, sd = 1))
})

test_that("family 'mDependentPS' works", {
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.7, 0.4, 0.3, 0.1), lag.max = 4))
  expect_error(monteCarloSimulation(family = "mDependentPS", covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = "s", covariances = testcovariances))
  expect_identical(monteCarloSimulation(family = "mDependentPS", n = 32, covariances = testcovariances),
                   monteCarloSimulation(family = "mDependentPS", n = 32L, covariances = testcovariances))
  expect_identical(monteCarloSimulation(family = "mDependentPS", n = 32.5, covariances = testcovariances),
                   monteCarloSimulation(family = "mDependentPS", n = 32L, covariances = testcovariances))
  expect_equal(monteCarloSimulation(family = "mDependentPS", n = 32L, covariances = testcovariances),
               monteCarloSimulation(n = 32L, r = 1e4L, seed = 32L, 
                                    rand.gen = testrand.genMDependent,
                                    family = "mDependentPS", intervalSystem = "dyaLen", output = "vector",
                                    covariances = testcovariances), tolerance = 1e-14, check.attributes = FALSE)
  
  testbyfilter(testn = 32L, testr = 10L, testseed = 1L, testfamily = "mDependentPS",
               testintervalSystem = "dyaLen", testlengths = as.integer(2^(0:5)), testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances)
  
  testbyfilter(testn = 17L, testr = 8L, testseed = -1L, testfamily = "mDependentPS",
               testintervalSystem = "dyaLen", testlengths = as.integer(2^(0:4)), testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances)
 
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L, rand.gen = "s",
                                    covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L, rand.gen = function() {},
                                    covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(test) {rnorm(32)}, covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(data, test) {rnorm(32)},
                                    covariances = testcovariances))
  
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(data) {rnorm(31)}, covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), NA)},
                                    covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), "NA")},
                                    covariances = testcovariances))
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L,
                                    rand.gen = function(data) {c(rnorm(31), Inf)},
                                    covariances = testcovariances))

  expect_identical(monteCarloSimulation(family = "mDependentPS", n = 34L, r = 10L, covariances = testcovariances),
                   monteCarloSimulation(family = "mDependentPS", n = 34L, r = 10L, covariances = testcovariances,
                                        intervalSystem = "dyaLen"))
  
  testbyfilter(testn = 28L, testr = 7L, testseed = 1L, testfamily = "mDependentPS",
               testintervalSystem = "all", testlengths = 1:28, testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances)
  testbyfilter(testn = 28L, testr = 6L, testseed = 1L, testfamily = "mDependentPS",
               testintervalSystem = "dyaPar", testlengths = as.integer(2^(0:4)), testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances)

  expect_error(monteCarloSimulation(family = "mDependentPS", output = "maximum", n = 32L, lengths = c(33L),
                                    covariances = testcovariances))

  expect_equal(monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, intervalSystem = "all",
                                    output = "maximum", lengths = 2^(0:5), covariances = testcovariances),
               monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, intervalSystem = "dyaLen",
                                    output = "maximum", covariances = testcovariances),
               check.attributes = FALSE)
  expect_equal(monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, intervalSystem = "all",
                                    output = "maximum", lengths = 2^(3:4), covariances = testcovariances),
               monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, intervalSystem = "dyaLen",
                                    output = "maximum", lengths = 2^(3:4), covariances = testcovariances),
               check.attributes = FALSE)
  
  testlengths <- c(2:5, 10:23)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "all", testlengths = testlengths, testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = 1:28)
  
  testlengths <- c(2L, 4L, 8L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaLen", testlengths = testlengths, testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  testlengths <- c(2L, 4L, 16L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaPar", testlengths = testlengths, testpenalty = "none",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  expect_identical(monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, covariances = testcovariances),
                   monteCarloSimulation(family = "mDependentPS", n = 32L, r = 10L, penalty = "none",
                                        covariances = testcovariances))
  expect_identical(monteCarloSimulation(family = "mDependentPS", output = "maximum", n = 32L, r = 10L,
                                        covariances = testcovariances),
                   monteCarloSimulation(family = "mDependentPS", output = "maximum", n = 32L, r = 10L,
                                        penalty = "sqrt", covariances = testcovariances))
  
  testlengths <- c(2:5, 10:23)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "all", testlengths = testlengths, testpenalty = "sqrt",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = 1:28)
  
  testlengths <- c(2L, 4L, 8L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaLen", testlengths = testlengths, testpenalty = "sqrt",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  testlengths <- c(2L, 4L, 16L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaPar", testlengths = testlengths, testpenalty = "sqrt",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  testlengths <- c(2:5, 10:23)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "all", testlengths = testlengths, testpenalty = "log",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = 1:28)
  
  testlengths <- c(2L, 4L, 8L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaLen", testlengths = testlengths, testpenalty = "log",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  testlengths <- c(2L, 4L, 16L)
  testbyfilter(testn = 28L, testr = 10L, testseed = 10L, testfamily = "mDependentPS",
               testintervalSystem = "dyaPar", testlengths = testlengths, testpenalty = "log",
               tolerance = 1e-14, testcovariances = testcovariances, allLengths = as.integer(2^(0:4)))
  
  expect_error(monteCarloSimulation(family = "mDependentPS", n = 32L, intervalsystem = "dyaPar",
                                    covariances = testcovariances))
  
  expect_identical(monteCarloSimulation(10L, r = 100, family = "mDependentPS", covariances = testcovariances * 2),
                   monteCarloSimulation(10L, r = 100, family = "mDependentPS", covariances = testcovariances))
  expect_error(monteCarloSimulation(10L, family = "mDependentPS"))
  expect_error(monteCarloSimulation(10L, family = "mDependentPS", covariances = c(testcovariances, "s")))
  expect_error(monteCarloSimulation(10L, family = "mDependentPS", covariances = c(0.01, testcovariances)))
  expect_error(monteCarloSimulation(10L, family = "mDependentPS", covariances = c(-10, testcovariances)))
  expect_error(monteCarloSimulation(10L, family = "mDependentPS", covariances = c(testcovariances, 0)))
  
  expect_identical(monteCarloSimulation(10L, r = 100, family = "mDependentPS", covariances = testcovariances * 2),
                   monteCarloSimulation(10L, r = 100, family = "mDependentPS", correlations = testcovariances))
  expect_equal(monteCarloSimulation(10L, r = 100, family = "mDependentPS", covariances = testcovariances * 2),
               monteCarloSimulation(10L, r = 100, family = "mDependentPS",
                                    correlations = testcovariances, sd = 3))
})
