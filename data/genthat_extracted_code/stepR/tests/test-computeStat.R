context("computeStat")

source(system.file("tests/comparisons/indices.R", package = "stepR"))
source(system.file("tests/comparisons/singleStat.R", package = "stepR"))

statAll <- function(y, left, right, value, indices, singleStat, lengths, ...) {
  indices <- indices(length(y), lengths = lengths, ...)
  
  stat <- rep(-Inf, length(y))
  for (i in 1:length(indices$li)) {
    index <- sum(left <= indices$li[i])
    if (index == length(right) - sum(right >= indices$ri[i]) + 1) {
      stat[indices$ri[i] - indices$li[i] + 1] <- max(stat[indices$ri[i] - indices$li[i] + 1],
                                                     singleStat(y, value[index], 
                                                                indices$li[i], indices$ri[i], ...))
    }
  }
  stat
}

test <- function(testy = NULL, testsignal = 0, left = NULL, right = NULL, value = NULL,
                 testfamily = NULL, testintervalSystem = NULL, testlengths = NULL,
                 finallengths = NULL, testnq = length(testy), defaultPenalty = NULL, indices = NULL,
                 singleStat = NULL, tolerance = 1e-12, ...) {
  # none
  compare <- statAll(testy, left = left, right = right, value = value, indices = indices,
                     singleStat = singleStat, lengths = finallengths, ...)[finallengths]
  
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "none",
                           nq = testnq, output = "maximum", ...),
               max(compare), info = "none", tolerance = tolerance)
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "none",
                           nq = testnq, output = "vector", ...),
               compare, info = "none", tolerance = tolerance)
  ret <- computeStat(testy, signal = testsignal, family = testfamily, intervalSystem = testintervalSystem,
                     lengths = testlengths, penalty = "none", nq = testnq, output = "list", ...)
  expect_equal(ret, list(maximum = max(compare), stat = compare, lengths = finallengths),
               info = "none", tolerance = tolerance)
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths, penalty = "none",
                               nq = testnq, ...), ret, info = "none")
  
  # sqrt
  compare <- statAll(testy, left = left, right = right, value = value, indices = indices,
                     singleStat = singleStat, lengths = finallengths, ...)[finallengths]
  finite <- compare != -Inf
  compare[finite] <- sqrt(2 * compare[finite]) - sqrt(2 * log(exp(1) * testnq / finallengths[finite]))
  
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "sqrt",
                           nq = testnq, output = "maximum", ...),
               max(compare), info = "sqrt", tolerance = tolerance)
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "sqrt",
                           nq = testnq, output = "vector", ...),
               compare, info = "sqrt", tolerance = tolerance)
  ret <- computeStat(testy, signal = testsignal, family = testfamily, intervalSystem = testintervalSystem,
                     lengths = testlengths, penalty = "sqrt", nq = testnq, output = "list", ...)
  expect_equal(ret, list(maximum = max(compare), stat = compare, lengths = finallengths),
               info = "sqrt", tolerance = tolerance)
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily, penalty = "sqrt", 
                               intervalSystem = testintervalSystem, lengths = testlengths, nq = testnq, ...),
                   ret, info = "sqrt")
  
  # log
  compare <- statAll(testy, left = left, right = right, value = value, indices = indices,
                     singleStat = singleStat, lengths = finallengths, ...)[finallengths] - 
    log(exp(1) * testnq / finallengths)
  
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "log",
                           nq = testnq, output = "maximum", ...),
               max(compare), info = "log", tolerance = tolerance)
  expect_equal(computeStat(testy, signal = testsignal, family = testfamily,
                           intervalSystem = testintervalSystem, lengths = testlengths, penalty = "log",
                           nq = testnq, output = "vector", ...),
               compare, info = "log", tolerance = tolerance)
  ret <- computeStat(testy, signal = testsignal, family = testfamily, intervalSystem = testintervalSystem,
                     lengths = testlengths, penalty = "log", nq = testnq, output = "list", ...)
  expect_equal(ret, list(maximum = max(compare), stat = compare, lengths = finallengths),
               info = "log", tolerance = tolerance)
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths, penalty = "log",
                               nq = testnq, ...), ret, info = "log")
  
  # default penalty
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "maximum", nq = testnq, ...),
                   computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "maximum", nq = testnq, penalty = defaultPenalty, ...))
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "vector", nq = testnq, ...),
                   computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "vector", nq = testnq, penalty = defaultPenalty, ...))
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "list", nq = testnq, ...),
                   computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "list", nq = testnq, penalty = defaultPenalty, ...))
  expect_identical(computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               nq = testnq, ...),
                   computeStat(testy, signal = testsignal, family = testfamily,
                               intervalSystem = testintervalSystem, lengths = testlengths,
                               output = "list", nq = testnq, penalty = defaultPenalty, ...))
}

test_that("argument y is tested", {
  testn <- 100L
  testy <- rnorm(testn)
  
  expect_error(computeStat())
  expect_error(computeStat(numeric(0)))
  expect_identical(computeStat(testy), computeStat(testy, family = "gauss", intervalSystem = "all",
                                                   lengths = 1:testn, penalty = "sqrt", nq = testn,
                                                   output = "list", sd = sdrobnorm(testy)))
  expect_error(computeStat(as.integer(testy)))
  expect_error(computeStat(c(testy, "s")))
  expect_error(computeStat(c(rnorm(10), NA))) 
  
  test(testy, left = 1L, right = testn, value = 0, finallengths = 1:testn,
       indices = indicesAll, singleStat = singleStatGauss, sd = 1, defaultPenalty = "sqrt")
})

test_that("argument signal is tested and works in the default case", {
  testn <- 34L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 1))
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  
  expect_error(computeStat(testy, signal = NULL))
  expect_error(computeStat(testy, signal = "s"))
  expect_identical(computeStat(testy, signal = 0L), computeStat(testy, signal = 0))
  expect_error(computeStat(testy, signal = c(1, 2)))
  expect_error(computeStat(testy, signal = NA))
  expect_error(computeStat(testy, signal = Inf))
  expect_identical(computeStat(testy, signal = 1),
                   computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 1)))
  expect_equal(computeStat(testy, signal = 0),
               computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 0)),
               tolerance = 1e-14)
  
  expect_error(computeStat(testy, signal = list()))
  expect_error(computeStat(testy, signal = list(leftIndex = 1L,
                                                rightIndex = 34L, value = NULL)))
  expect_error(computeStat(testy, signal = list(leftIndex = 1L,
                                                rightIndex = c(17L, 34L), value = numeric(0))))
  expect_error(computeStat(testy, signal = list(leftIndex = c(1L, 18L),
                                                rightIndex = c(17L, 34L), value = numeric(0))))
  expect_error(computeStat(testy, signal = list(leftIndex = c(1L, Inf),
                                                rightIndex = c(17L, 34L), value = c(1, 2))))
  expect_error(computeStat(testy, signal = list(leftIndex = c(1L, 18L),
                                                rightIndex = c(17L, 34L), value = c(1, NA))))
  expect_identical(computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 1L)),
                   computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 1)))
  expect_identical(computeStat(testy, signal = list(leftIndex = 1, rightIndex = 34, value = 1)),
                   computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 1)))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", finallengths = 1:testn,
       indices = indicesAll, singleStat = singleStatGauss, sd = 1.23,
       defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss",
       finallengths = 1:testn, indices = indicesAll, singleStat = singleStatGauss,
       sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "gauss", finallengths = 1:testn, 
       indices = indicesAll, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  testsignal2 <- list(lefxx = "s", rtg = 1:10, leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  expect_identical(computeStat(testy, signal = testsignal2), computeStat(testy, signal = testsignal))
  
  teststepfit <- stepfit(23, family = "gauss", value = c(0, 1), param = 2, leftEnd = c(1L, 12L) / 34,
                         rightEnd = c(11L, 34L) / 34, x0 = -1, leftIndex = c(1L, 12L), rightIndex = c(11L, 34L))
  expect_identical(computeStat(testy, signal = teststepfit), computeStat(testy, signal = testsignal))
})

test_that("argument family is tested and works in the default case", { # other families below
  testn <- 34L
  testy <- rnorm(testn)
  
  expect_error(computeStat(testy, family = ""))
  expect_error(computeStat(testy, family = "bisom"))
  expect_error(computeStat(testy, family = c("gauss", "hsmuce")))
  expect_identical(computeStat(testy, signal = 0), computeStat(testy, signal = 0, family = "gauss"))
})

test_that("argument intervalSystem is tested and works", {
  testn <- 34L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 1))
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  
  expect_error(computeStat(testy, intervalSystem = ""))
  expect_error(computeStat(testy, intervalSystem = "dya"))
  expect_error(computeStat(testy, intervalSystem = "dyalen"))
  expect_error(computeStat(testy, intervalSystem = "dyapar"))
  expect_error(computeStat(testy, intervalSystem = c("dyaPar", "all")))
  expect_identical(computeStat(testy, signal = 0), computeStat(testy, signal = 0, intervalSystem = "all"))
  expect_identical(computeStat(rep(testy, 30), signal = 0),
                   computeStat(rep(testy, 30), signal = 0, intervalSystem = "dyaLen"))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", finallengths = 2^(0:5),
       testintervalSystem = "dyaLen", indices = indicesDyaLen, singleStat = singleStatGauss,
       sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss",
       finallengths = 2^(0:5), testintervalSystem = "dyaLen",
       indices = indicesDyaLen, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "gauss", finallengths = 2^(0:5), testintervalSystem = "dyaLen",
       indices = indicesDyaLen, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", finallengths = 2^(0:5),
       testintervalSystem = "dyaPar", indices = indicesDyaPar, singleStat = singleStatGauss,
       sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss",
       finallengths = 2^(0:5), testintervalSystem = "dyaPar",
       indices = indicesDyaPar, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "gauss", finallengths = 2^(0:5), testintervalSystem = "dyaPar",
       indices = indicesDyaPar, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
})

test_that("argument lengths is tested and works", {
  testn <- 45L
  testy <- c(rnorm(20, 1, 0.23), rnorm(testn - 20, -1, 0.34))
  testsignal <- list(leftIndex = c(1L, 23L), rightIndex = c(22L, 45L), value = c(0, -1))
  
  expect_error(computeStat(testy, lengths = "s"))
  expect_error(computeStat(testy, lengths = c(1:10, NA)))
  expect_error(computeStat(testy, lengths = c(1:10, Inf)))
  expect_error(computeStat(testy, lengths = 0:10))
  expect_error(computeStat(testy, lengths = -1L))
  expect_error(computeStat(testy, lengths = c(1L, 46L)))
  expect_error(computeStat(testy, intervalSystem = "dyaLen", lengths = 3L))
  expect_error(computeStat(testy, intervalSystem = "dyaLen", lengths = 64L))
  expect_error(computeStat(testy, intervalSystem = "dyaPar", lengths = 3L))
  expect_error(computeStat(testy, intervalSystem = "dyaPar", lengths = 64L))
  
  expect_warning(ret <- computeStat(testy, lengths = c(1:10, 10)))
  expect_identical(ret, computeStat(testy, lengths = c(1:10)))
  expect_identical(computeStat(testy, lengths = c(10:1)),
                   computeStat(testy, lengths = c(1:10)))
  expect_identical(computeStat(testy, lengths = c(1:10 + 0.5)),
                   computeStat(testy, lengths = c(1:10)))
  
  expect_equal(computeStat(testy, lengths = 2^(0:5)), computeStat(testy, intervalSystem = "dyaLen"))
  expect_equal(computeStat(testy, lengths = 2^(3:4)),
               computeStat(testy, intervalSystem = "dyaLen", lengths = 2^(3:4)))
  
  testlengths <- c(1, 3:5, 10:23)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", testlengths = testlengths,
       finallengths = testlengths, indices = indicesAllLengths,
       singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss", 
       testlengths = testlengths, finallengths = testlengths,
       indices = indicesAllLengths, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "gauss", testlengths = testlengths, finallengths = testlengths,
       indices = indicesAllLengths, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  
  testlengths <- c(1, 4, 32)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", testlengths = testlengths,
       finallengths = testlengths, indices = indicesDyaLenLengths,
       singleStat = singleStatGauss, sd = 1.23, testintervalSystem = "dyaLen", defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss", 
       testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaLenLengths, singleStat = singleStatGauss, sd = 1.23,
       testintervalSystem = "dyaLen", defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "gauss", testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaLenLengths, singleStat = singleStatGauss, sd = 1.23, 
       testintervalSystem = "dyaLen", defaultPenalty = "sqrt")
  
  testlengths <- c(2, 4, 16)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", testlengths = testlengths,
       finallengths = testlengths, indices = indicesDyaParLengths,
       singleStat = singleStatGauss, sd = 1.23, testintervalSystem = "dyaPar", defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss", 
       testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaParLengths, singleStat = singleStatGauss, sd = 1.23,
       testintervalSystem = "dyaPar", defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "gauss", testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaParLengths, singleStat = singleStatGauss, sd = 1.23,
       testintervalSystem = "dyaPar", defaultPenalty = "sqrt")
})

test_that("argument penalty is tested and works in the default case", {
  testn <- 34L
  testy <- rnorm(testn)
  
  expect_error(computeStat(testy, penalty = ""))
  expect_error(computeStat(testy, penalty = c("gauss")))
  expect_error(computeStat(testy, penalty = c("sqrt", "log")))
  expect_identical(computeStat(testy, signal = 0), computeStat(testy, signal = 0, penalty = "sqrt"))
})

test_that("argument nq is tested and works", {
  testn <- 34L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 1))
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  
  expect_error(computeStat(testy, nq = "s"))
  expect_error(computeStat(testy, nq = c(1L, 2L)))
  expect_error(computeStat(testy, nq = NA))
  expect_error(computeStat(testy, nq = Inf))
  expect_error(computeStat(testy, nq = 0L))
  expect_error(computeStat(testy, nq = -1L))
  expect_error(computeStat(testy, nq = 33L))
  expect_error(computeStat(testy, intervalSystem = "dyaPar", lengths = 64L, nq = 64L))
  expect_identical(computeStat(testy), computeStat(testy, nq = testn))
  expect_identical(computeStat(testy, nq = 100), computeStat(testy, nq = 100L))
  expect_identical(computeStat(testy, nq = 100.5), computeStat(testy, nq = 100L))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", finallengths = 1:testn,
       testnq = 100L, indices = indicesAll, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss",
       finallengths = 1:testn, testnq = 64L, indices = indicesAll, singleStat = singleStatGauss,
       sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "gauss", finallengths = 1:testn, testnq = 55L,
       indices = indicesAll, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  
  testlengths <- c(1, 3:5, 10:23)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "gauss", testlengths = testlengths,
       finallengths = testlengths, testnq = 100L, indices = indicesAllLengths,
       singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "gauss", 
       testlengths = testlengths, finallengths = testlengths, testnq = 64L,
       indices = indicesAllLengths, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "gauss", testlengths = testlengths, finallengths = testlengths, testnq = 45L,
       indices = indicesAllLengths, singleStat = singleStatGauss, sd = 1.23, defaultPenalty = "sqrt")
})

test_that("argument output is tested and works in the default case", {
  testn <- 34L
  testy <- rnorm(testn)
  
  expect_error(computeStat(testy, output = 1))
  expect_error(computeStat(testy, output = "mu"))
  expect_identical(computeStat(testy, signal = 0), computeStat(testy, signal = 0, output = "l"))
})

test_that("... is tested and works", {
  testn <- 34L
  testy <- rnorm(testn)

  expect_error(computeStat(testy, std = 1))
  expect_error(computeStat(testy, familty = "hsmuce"))
  expect_error(computeStat(testy, covariances = c(1, 0.6)))
  expect_error(computeStat(testy, sd = "s"))
  expect_error(computeStat(testy, sd = c(1, 2)))
  expect_error(computeStat(testy, sd = NA))
  expect_error(computeStat(c(1, 2)))
  expect_error(computeStat(testy, sd = Inf))
  expect_error(computeStat(testy, sd = 0))
  expect_error(computeStat(testy, sd = -0.1))
  expect_identical(computeStat(testy), computeStat(testy, sd = sdrobnorm(testy)))
  expect_identical(computeStat(testy, sd = 1L), computeStat(testy, sd = 1))
})

test_that("family hsmuce works", {
  testn <- 100L
  testy <- rnorm(testn)
  
  expect_error(computeStat(family = "hsmuce"))
  expect_error(computeStat(numeric(0), family = "hsmuce"))
  expect_identical(computeStat(testy, family = "hsmuce"),
                   computeStat(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = 2^(1:6),
                               penalty = "none", nq = testn, output = "list"))
  expect_error(computeStat(as.integer(testy), family = "hsmuce"))
  expect_error(computeStat(c(testy, "s"), family = "hsmuce"))
  expect_error(computeStat(c(rnorm(10), NA), family = "hsmuce"))
  expect_error(computeStat(c(rnorm(10), Inf), family = "hsmuce")) 
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", finallengths = 2^(1:6),
       indices = indicesDyaPar, singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)

  testn <- 34L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 1))
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 34L), value = c(0, 1))
  
  expect_equal(computeStat(testy, signal = 0, family = "hsmuce"),
               computeStat(testy, signal = list(leftIndex = 1L, rightIndex = 34L, value = 0),
                           family = "hsmuce"), tolerance = 1e-6)
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", finallengths = 2^(1:5),
       indices = indicesDyaPar, singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce",
       finallengths = 2^(1:5), indices = indicesDyaPar, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "hsmuce", finallengths = 2^(1:5), indices = indicesDyaPar, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6)

  expect_identical(computeStat(testy, family = "hsm"), computeStat(testy, family = "hsmuce"))

  expect_identical(computeStat(testy, signal = 0, family = "hsmuce"),
                   computeStat(testy, signal = 0, family = "hsmuce", intervalSystem = "dyaPar"))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", finallengths = 2:testn,
       testintervalSystem = "all", indices = indicesAll, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce",
       finallengths = 2:testn, testintervalSystem = "all", indices = indicesAll, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "hsmuce", finallengths = 2:testn, testintervalSystem = "all",
       indices = indicesAll, singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", finallengths = 2^(1:5),
       testintervalSystem = "dyaLen", indices = indicesDyaLen, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6) 
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce",
       finallengths = 2^(1:5), testintervalSystem = "dyaLen", indices = indicesDyaLen,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, 34L), value = c(0, 1),
       testfamily = "hsmuce", finallengths = 2^(1:5), testintervalSystem = "dyaLen", indices = indicesDyaLen,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)

  testn <- 45L
  testy <- c(rnorm(20, 1, 0.23), rnorm(testn - 20, -1, 0.34))
  testsignal <- list(leftIndex = c(1L, 23L), rightIndex = c(22L, 45L), value = c(0, -1))
  
  expect_error(computeStat(testy, family = "hsmuce", lengths = 1:3))
  expect_error(computeStat(testy, family = "hsmuce", intervalSystem = "all", lengths = 1:45))
  expect_error(computeStat(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = 1:2))

  testlengths <- c(2, 6:10, 23:45)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", testintervalSystem = "all", 
       testlengths = testlengths, finallengths = testlengths, indices = indicesAllLengths,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce",
       testintervalSystem = "all", testlengths = testlengths, finallengths = testlengths,
       indices = indicesAllLengths, singleStat = singleStatHsmuce, defaultPenalty = "none",
       tolerance = 1e-6)
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "hsmuce", testintervalSystem = "all", testlengths = testlengths,
       finallengths = testlengths, indices = indicesAllLengths,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  
  testlengths <- c(2, 4, 32)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", testlengths = testlengths,
       finallengths = testlengths, indices = indicesDyaLenLengths, singleStat = singleStatHsmuce,
       defaultPenalty = "none", tolerance = 1e-6, testintervalSystem = "dyaLen")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce", 
       testlengths = testlengths, finallengths = testlengths, indices = indicesDyaLenLengths,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6, testintervalSystem = "dyaLen")
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "hsmuce", testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaLenLengths, singleStat = singleStatHsmuce, defaultPenalty = "none",
       tolerance = 1e-6, testintervalSystem = "dyaLen")
  
  testlengths <- c(4, 8, 16)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", testlengths = testlengths,
       finallengths = testlengths, indices = indicesDyaParLengths,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "hsmuce", 
       testlengths = testlengths, finallengths = testlengths, indices = indicesDyaParLengths,
       singleStat = singleStatHsmuce, defaultPenalty = "none", tolerance = 1e-6)
  test(testy, testsignal = testsignal, left = c(1L, 23L), right = c(22L, 45L), value = c(0, -1),
       testfamily = "hsmuce", testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaParLengths, singleStat = singleStatHsmuce, defaultPenalty = "none",
       tolerance = 1e-6)

    expect_identical(computeStat(testy, signal = 0, family = "hsmuce"),
                     computeStat(testy, signal = 0, family = "hsmuce", penalty = "none"))
    expect_identical(computeStat(testy, signal = 0, family = "hsmuce", penalty = "weights"),
                     computeStat(testy, signal = 0, family = "hsmuce", penalty = "none"))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "hsmuce", finallengths = 2^(1:5),
       testnq = 100L, indices = indicesDyaPar, singleStat = singleStatHsmuce, defaultPenalty = "none",
       tolerance = 1e-6)
  
  expect_error(computeStat(testy, family = "hsmuce", sd = 1))
  expect_error(computeStat(testy, family = "hsmuce", intervalsystem = "all"))
})

test_that("family mDependentPS works", {
  testn <- 30L
  testy <- rnorm(testn)
  testCovariances <- seq(1, 0.2, -0.2)
  
  expect_error(computeStat(family = "mDependentPS", covariances = testCovariances))
  expect_error(computeStat(numeric(0), family = "mDependentPS", covariances = testCovariances))
  expect_identical(computeStat(testy, family = "mDependentPS", covariances = testCovariances),
                   computeStat(testy, family = "mDependentPS", intervalSystem = "dyaLen", lengths = 2^(0:4),
                               penalty = "sqrt", nq = testn, output = "list", covariances = testCovariances))
  expect_error(computeStat(as.integer(testy), family = "mDependentPS", covariances = testCovariances))
  expect_error(computeStat(c(testy, "s"), family = "mDependentPS", covariances = testCovariances))
  expect_error(computeStat(c(rnorm(10), NA), family = "mDependentPS", covariances = testCovariances)) 
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", finallengths = 2^(0:4),
       indices = indicesDyaLen, singleStat = singleStatmDependentPS,
       covariances = testCovariances, defaultPenalty = "sqrt")

  testn <- 18L
  testy <- c(rnorm(testn / 2), rnorm(testn / 2, 1))
  testsignal <- list(leftIndex = c(1L, 12L), rightIndex = c(11L, 18L), value = c(0, 1))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", finallengths = 2^(0:4),
       indices = indicesDyaLen, singleStat = singleStatmDependentPS,
       covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS",
       finallengths = 2^(0:4), indices = indicesDyaLen, singleStat = singleStatmDependentPS,
       covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, testn), value = c(0, 1),
       testfamily = "mDependentPS", finallengths = 2^(0:4), indices = indicesDyaLen,
       singleStat = singleStatmDependentPS, covariances = testCovariances, defaultPenalty = "sqrt")

  expect_identical(computeStat(testy, signal = 0, family = "mDependentPS", covariances = testCovariances),
                   computeStat(testy, signal = 0, family = "mDependentPS", intervalSystem = "dyaLen",
                               covariances = testCovariances))
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", finallengths = 1:testn,
       testintervalSystem = "all", indices = indicesAll, singleStat = singleStatmDependentPS,
       covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS",
       finallengths = 1:testn, testintervalSystem = "all", indices = indicesAll,
       singleStat = singleStatmDependentPS, covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, testn), value = c(0, 1),
       testfamily = "mDependentPS", finallengths = 1:testn, testintervalSystem = "all", indices = indicesAll,
       singleStat = singleStatmDependentPS, covariances = testCovariances, defaultPenalty = "sqrt")
  
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", finallengths = 2^(0:4),
       testintervalSystem = "dyaPar", indices = indicesDyaPar,
       singleStat = singleStatmDependentPS, covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS",
       finallengths = 2^(0:4), testintervalSystem = "dyaPar", indices = indicesDyaPar,
       singleStat = singleStatmDependentPS, covariances = testCovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 12L), right = c(11L, testn), value = c(0, 1),
       testfamily = "mDependentPS", finallengths = 2^(0:4), testintervalSystem = "dyaPar",
       indices = indicesDyaPar, singleStat = singleStatmDependentPS, covariances = testCovariances,
       defaultPenalty = "sqrt")

  testn <- 17L
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  testsignal <- list(leftIndex = c(1L, 13L), rightIndex = c(12L, testn), value = c(0, -1))
  testy <- as.numeric(arima.sim(n = testn, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 1))
  
  testlengths <- c(1, 3:5, 10:14)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", testlengths = testlengths,
       finallengths = testlengths, indices = indicesAllLengths, testintervalSystem = "all",
       singleStat = singleStatmDependentPS, covariances = testcovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS", 
       testlengths = testlengths, finallengths = testlengths, testintervalSystem = "all", defaultPenalty = "sqrt",
       indices = indicesAllLengths, singleStat = singleStatmDependentPS, covariances = testcovariances)
  test(testy, testsignal = testsignal, left = c(1L, 13L), right = c(12L, testn), value = c(0, -1),
       testfamily = "mDependentPS", testlengths = testlengths, finallengths = testlengths,
       testintervalSystem = "all", indices = indicesAllLengths, singleStat = singleStatmDependentPS,
       covariances = testcovariances, defaultPenalty = "sqrt")
  
  testlengths <- c(1, 4, 16)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", testlengths = testlengths,
       finallengths = testlengths, indices = indicesDyaLenLengths,
       singleStat = singleStatmDependentPS, covariances = testcovariances, defaultPenalty = "sqrt")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS", 
       testlengths = testlengths, finallengths = testlengths, defaultPenalty = "sqrt",
       indices = indicesDyaLenLengths, singleStat = singleStatmDependentPS, covariances = testcovariances)
  test(testy, testsignal = testsignal, left = c(1L, 13L), right = c(12L, testn), value = c(0, -1),
       testfamily = "mDependentPS", testlengths = testlengths, finallengths = testlengths, defaultPenalty = "sqrt",
       indices = indicesDyaLenLengths, singleStat = singleStatmDependentPS, covariances = testcovariances)
  
  testlengths <- c(2, 4, 16)
  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", testlengths = testlengths,
       finallengths = testlengths, defaultPenalty = "sqrt", indices = indicesDyaParLengths,
       singleStat = singleStatmDependentPS, covariances = testcovariances, testintervalSystem = "dyaPar")
  test(testy, testsignal = 1, left = 1L, right = testn, value = 1, testfamily = "mDependentPS", 
       testlengths = testlengths, finallengths = testlengths, indices = indicesDyaParLengths,
       singleStat = singleStatmDependentPS, covariances = testcovariances,
       testintervalSystem = "dyaPar", defaultPenalty = "sqrt")
  test(testy, testsignal = testsignal, left = c(1L, 13L), right = c(12L, testn), value = c(0, -1),
       testfamily = "mDependentPS", testlengths = testlengths, finallengths = testlengths,
       indices = indicesDyaParLengths, singleStat = singleStatmDependentPS, covariances = testcovariances,
       testintervalSystem = "dyaPar", defaultPenalty = "sqrt")

  expect_identical(computeStat(testy, family = "mDependentPS", signal = 0, covariances = testcovariances),
                   computeStat(testy, family = "mDependentPS", signal = 0, covariances = testcovariances,
                               penalty = "sqrt"))

  test(testy, left = 1L, right = testn, value = 0, testfamily = "mDependentPS", finallengths = 2^(0:4),
       testnq = 100L, indices = indicesDyaLen, singleStat = singleStatmDependentPS,
       covariances = testcovariances, defaultPenalty = "sqrt")
})

test_that("arguments in ... are tested and work for family mDependentPS", {
  testn <- 17L
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3)) * 2^2
  testcorrelations <- testcovariances / testcovariances[1]
  testsignal <- list(leftIndex = c(1L, 13L), rightIndex = c(12L, testn), value = c(0, -1))
  testfilter <- list(acf = testcorrelations)
  class(testfilter) <- c("lowpassFilter", class(testfilter))
  testy <- as.numeric(arima.sim(n = testn, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 2))
  
  expect_error(computeStat(testy, family = "mDependentPS", covariances = testcovariances, std = 1))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = testcorrelations, std = 1))
  expect_error(computeStat(testy, family = "mDependentPS", filter = testfilter, std = 1))
  expect_error(computeStat(testy, family = "mDependentPS", intervalsystem = "all"))
  expect_error(computeStat(testy, family = "mDependentPS"))
  expect_error(computeStat(testy, family = "mDependentPS", sd = 1))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(testcovariances, "s")))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(testcovariances, NA)))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(testcovariances, Inf)))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(0.01, testcovariances)))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(-10, testcovariances)))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(1, testcovariances)))
  expect_error(computeStat(testy, family = "mDependentPS", covariances = c(testcovariances, 0)))
  
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(testcorrelations, "s")))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(testcorrelations, NA)))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(testcorrelations, Inf)))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(testcorrelations, 1.1)))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(0.99, testcorrelations[-1])))
  expect_error(computeStat(testy, family = "mDependentPS", correlations = c(testcorrelations, 0)))
  
  expect_error(computeStat(testy, sd = "s", family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(testy, sd = c(1, 2), family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(testy, sd = NA, family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(c(1, 2), family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(testy, sd = Inf, family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(testy, sd = 0, family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeStat(testy, sd = -0.1, family = "mDependentPS", correlations = testcorrelations))
  
  expect_error(computeStat(testy, family = "mDependentPS",
                           filter = list(param = list(acf = testcorrelations))))
  
  expect_error(computeStat(testy, sd = "s", family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(testy, sd = c(1, 2), family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(testy, sd = NA, family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(c(1, 2), family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(testy, sd = Inf, family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(testy, sd = 0, family = "mDependentPS", filter = testfilter))
  expect_error(computeStat(testy, sd = -0.1, family = "mDependentPS", filter = testfilter))
  
  expect_identical(computeStat(testy, family = "mDependentPS",
                               covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   computeStat(testy, family = "mDependentPS", correlations = testcorrelations))
  expect_identical(computeStat(testy, family = "mDependentPS",
                               covariances = 1.1^2 * testcorrelations),
                   computeStat(testy, family = "mDependentPS", correlations = testcorrelations, sd = 1.1))
  expect_identical(computeStat(testy, family = "mDependentPS",
                               covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   computeStat(testy, family = "mDependentPS", filter = testfilter))
  expect_identical(computeStat(testy, family = "mDependentPS",
                               covariances = 1.1^2 * testcorrelations),
                   computeStat(testy, family = "mDependentPS", filter = testfilter, sd = 1.1))
})
