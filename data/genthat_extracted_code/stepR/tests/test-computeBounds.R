context("computeBounds")

source(system.file("tests/comparisons/indices.R", package = "stepR"))
source(system.file("tests/comparisons/singleStat.R", package = "stepR"))
source(system.file("tests/comparisons/singleBounds.R", package = "stepR"))

# indices
testIndices <- function(bounds, indices, ...) {
  compareIndices <- as.data.frame(indices(...))
  compareIndices <- compareIndices[order(compareIndices$ri, compareIndices$li, decreasing = FALSE), ]
  bounds <- bounds[order(bounds$ri, bounds$li, decreasing = FALSE), ]
  
  expect_identical(bounds$li, compareIndices$li)
  expect_identical(bounds$ri, compareIndices$ri)
}

# bounds
testBounds <- function(bounds, singleBounds, tolerance = 1e-10, y, criticalValues, lengths = 1:length(y),
                       ...) {
  for (i in 1:length(bounds$li)) {
    compareBounds <- singleBounds(y, criticalValues[lengths == bounds$ri[i] - bounds$li[i] + 1L],
                                  bounds$li[i], bounds$ri[i], ...)
    expect_equal(c(bounds$lower[i], bounds$upper[i]), compareBounds, tolerance = tolerance, info = i)
  }
}

# bounds via statistic == criticalValue
testStat <- function(bounds, singleStat, tolerance = 1e-6, y, criticalValues, lengths = 1:length(y), ...) {
  for (i in 1:length(bounds$li)) {
    compareStats <- c(singleStat(y, bounds$lower[i], bounds$li[i], bounds$ri[i], ...),
                      singleStat(y, bounds$lower[i], bounds$li[i], bounds$ri[i], ...))
    expect_equal(compareStats, rep(criticalValues[lengths == bounds$ri[i] - bounds$li[i] + 1L], 2),
                 tolerance = tolerance, info = i)
  }
}


test_that("argument y is tested", {
  testn <- 40L
  testy <- rnorm(testn)
  testq <- rep(1, testn)
  
  expect_error(computeBounds(q = testq))
  expect_error(computeBounds(numeric(0), q = testq))
  expect_identical(computeBounds(testy, q = testq),
                   computeBounds(testy, family = "gauss", intervalSystem = "all", lengths = 1:testn,
                                 q = testq, sd = sdrobnorm(testy)))
  expect_error(computeBounds(as.integer(testy), q = testq))
  expect_error(computeBounds(c(testy, "s"), q = testq))
  expect_error(computeBounds(c(rnorm(10), NA), q = testq)) 
  
  bounds <- computeBounds(testy, q = testq, sd = 1)
  testIndices(bounds = bounds, indices = indicesAll, n = testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq, sd = 1) 
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq, sd = 1) 
})

test_that("argument family is tested and works in the default case", { # other families below
  testn <- 53L
  testy <- c(rnorm(30, 1, 0.23), rnorm(testn - 30, -1, 0.34))
  testq <- 53:1 / 20
  
  expect_error(computeBounds(testy, family = "", q = testq))
  expect_error(computeBounds(testy, family = c("gauss", "hsmuce"), q = testq))
  expect_identical(computeBounds(testy, q = testq), computeBounds(testy, q = testq, family = "gauss"))
  
  bounds <- computeBounds(testy, q = testq, sd = 0.3)
  testIndices(bounds = bounds, indices = indicesAll, n = testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq, sd = 0.3) 
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq, sd = 0.3) 
})

test_that("argument intervalSystem is tested and works", {
  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- 23:1 / 10
  
  expect_error(computeBounds(testy, intervalSystem = "", q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dya", q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dyalen", q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dyapar", q = testq))
  expect_identical(computeBounds(testy, q = testq),
                   computeBounds(testy, q = testq, intervalSystem = "all"))
  
  testq <- 5:1 / 5
  
  bounds <- computeBounds(testy, q = testq, intervalSystem = "dyaLen", sd = 0.3)
  testIndices(bounds = bounds, indices = indicesDyaLen, n = testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq,
             lengths = 2^(0:4), sd = 0.3) 
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq,
           lengths = 2^(0:4), sd = 0.3) 
  
  bounds <- computeBounds(testy, q = testq, intervalSystem = "dyaPar", sd = 0.3)
  testIndices(bounds = bounds, indices = indicesDyaPar, n = testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq,
             lengths = 2^(0:4), sd = 0.3)  
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq,
           lengths = 2^(0:4), sd = 0.3) 
})

test_that("argument lengths is tested and works", {
  testn <- 37L
  testy <- c(rnorm(20, 1, 0.23), rnorm(testn - 20, -1, 0.34))
  testq <- 37:1 / 12
  
  expect_error(computeBounds(testy, lengths = "s", q = testq))
  expect_error(computeBounds(testy, lengths = c(1:10, NA), q = testq))
  expect_error(computeBounds(testy, lengths = c(1:10, Inf), q = testq))
  expect_error(computeBounds(testy, lengths = 0:10, q = testq))
  expect_error(computeBounds(testy, lengths = -1L, q = testq))
  expect_error(computeBounds(testy, lengths = 38L, q = testq))
  expect_warning(ret <- computeBounds(testy, lengths = c(1:10, 10), q = testq))
  expect_identical(ret, computeBounds(testy, lengths = c(1:10), q = testq))
  expect_identical(computeBounds(testy, lengths = c(10:1), q = testq),
                   computeBounds(testy, lengths = c(1:10), q = testq))
  expect_identical(computeBounds(testy, lengths = c(1:10 + 0.5), q = testq),
                   computeBounds(testy, lengths = c(1:10), q = testq))
  testq <- 2
  expect_error(computeBounds(testy, intervalSystem = "dyaLen", lengths = 3L, q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dyaLen", lengths = 64L, q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dyaPar", lengths = 3L, q = testq))
  expect_error(computeBounds(testy, intervalSystem = "dyaPar", lengths = 64L, q = testq))
  
  testq <- 9:1
  bounds <- computeBounds(testy, q = testq, lengths = c(2, 5:10, 35:36), sd = 0.3)
  testIndices(bounds = bounds, indices = indicesAllLengths, n = testn, lengths = c(2, 5:10, 35:36))
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq,
             lengths = c(2, 5:10, 35:36), sd = 0.3) 
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq,
           lengths = c(2, 5:10, 35:36), sd = 0.3)
  
  testq <- 3:1 / 5
  bounds <- computeBounds(testy, q = testq, intervalSystem = "dyaLen", lengths = c(1, 4, 32), sd = 0.3)
  testIndices(bounds = bounds, indices = indicesDyaLenLengths, n = testn, lengths = c(1, 4, 32))
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq,
             lengths = c(1, 4, 32), sd = 0.3) 
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq,
           lengths = c(1, 4, 32), sd = 0.3) 
  
  testq <- 2:1 / 5
  bounds <- computeBounds(testy, q = testq, intervalSystem = "dyaPar", sd = 0.3, lengths = c(2, 4))
  testIndices(bounds = bounds, indices = indicesDyaParLengths, n = testn, lengths = c(2, 4))
  testBounds(bounds = bounds, singleBounds = singleBoundsGauss, y = testy, criticalValues = testq,
             lengths = c(2, 4), sd = 0.3)  
  testStat(bounds = bounds, singleStat = singleStatGauss, y = testy, criticalValues = testq,
           lengths = c(2, 4), sd = 0.3) 
})

test_that("argument q is tested and works if it is given", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.23), rnorm(12, -1, 0.23), rnorm(12, 1, 0.23))
  teststat <- monteCarloSimulation(36L, r = 100L)
  
  expect_warning(ret <- computeBounds(testy))
  expect_identical(ret, computeBounds(testy, alpha = 0.5))
  expect_warning(ret <- computeBounds(testy, stat = teststat))
  expect_identical(ret, computeBounds(testy, stat = teststat, alpha = 0.5))
  
  expect_error(computeBounds(testy, q = "s", alpha = 0.1, stat = teststat))
  expect_error(computeBounds(testy, q = Inf, alpha = 0.1, stat = teststat))
  expect_error(computeBounds(testy, q = c(rep(1, 35), "s"), alpha = 0.1, stat = teststat))
  expect_error(computeBounds(testy, q = c(rep(1, 35), Inf), alpha = 0.1, stat = teststat))
  expect_error(computeBounds(testy, q = rep(1, 37), alpha = 0.1, stat = teststat))
  expect_error(computeBounds(testy, q = rep(1, 33), alpha = 0.1, stat = teststat))
  
  
  testq <- 1:36
  attr(testq, "n") <- "s"
  expect_error(computeBounds(testy, q = testq, alpha = 0.1, stat = teststat))
  
  attr(testq, "n") <- 35L
  expect_error(computeBounds(testy, q = testq, alpha = 0.1, stat = teststat))
  
  expect_identical(computeBounds(testy, q = 3, intervalSystem = "all", lengths = c(1:3, 8:23)),
                   computeBounds(testy, intervalSystem = "all", lengths = c(1:3, 8:23),
                           q = critVal(q = 3, intervalSystem = "all", lengths = c(1:3, 8:23), n = testn)))
  expect_identical(computeBounds(testy, q = 3, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                                 nq = 45L),
                   computeBounds(testy, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                                       n = testn, nq = 45L)))
  expect_identical(computeBounds(testy, q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       n = testn)))
  
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(computeBounds(testy, q = testq), computeBounds(testy, q = 1:36))
  expect_identical(computeBounds(testy, q = 1:36, lengths = 3:23), computeBounds(testy, q = 3:23, lengths = 3:23))
  expect_identical(computeBounds(testy, q = testq, lengths = 3:23), computeBounds(testy, q = 3:23, lengths = 3:23))
  expect_identical(computeBounds(testy, q = 1:36, intervalSystem = "dyaLen"),
                   computeBounds(testy, q = 2^(0:5), intervalSystem = "dyaLen"))
  expect_identical(computeBounds(testy, q = testq, intervalSystem = "dyaLen"),
                   computeBounds(testy, q = 2^(0:5), intervalSystem = "dyaLen"))
  testq <- 2^(0:6)
  attr(testq, "n") <- 64L
  expect_identical(computeBounds(testy, q = testq, intervalSystem = "dyaPar"),
                   computeBounds(testy, q = 2^(0:5), intervalSystem = "dyaPar"))
})

test_that("argument q is computed correctly", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.23), rnorm(12, -1, 0.23), rnorm(12, 1, 0.23))
  teststat <- monteCarloSimulation(36L, r = 100L)
  
  ret <- computeBounds(testy, alpha = 0.1, stat = teststat)
  expect_identical(ret, computeBounds(testy, alpha = 0.1, stat = teststat, nq = testn, family = "gauss",
                                intervalSystem = "all", lengths = 1:testn, penalty = "sqrt"))
  expect_identical(ret, computeBounds(testy, q = critVal(alpha = 0.1, stat = teststat, n = testn)))
  
  expect_error(computeBounds(testy, alpha = "s", stat = teststat))
  expect_error(computeBounds(testy, alpha = 0, stat = teststat))
  expect_identical(computeBounds(testy, alpha = 0.075, stat = teststat),
                   computeBounds(testy, q = critVal(alpha = 0.075, stat = teststat, n = testn)))
  
  expect_error(computeBounds(testy, alpha = 0.1, stat = teststat, n = testn))
  
  expect_error(computeBounds(testy, alpha = 0.1, nq = "s", stat = teststat))
  expect_error(computeBounds(testy, q = 1, nq = "s", stat = teststat))
  expect_error(computeBounds(testy, alpha = 0.1, nq = Inf, stat = teststat))
  expect_error(computeBounds(testy, q = 1, nq = Inf, stat = teststat))
  expect_error(computeBounds(testy, alpha = 0.1, nq = 8L, stat = teststat))
  expect_error(computeBounds(testy, q = 1, nq = 8L, stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, penalty = "", stat = teststat))
  expect_error(computeBounds(testy, alpha = 0.1, penalty = "ads", stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, penalty = "weights", weights = rep(1 / 8, 8),
                             stat = teststat))
  
  expect_identical(computeBounds(testy, alpha = 0.1, penalty = "weights", stat = teststat),
                   computeBounds(testy, q = critVal(alpha = 0.1, penalty = "weights",
                                                    weights = rep(1 / 36, 36),
                                              stat = teststat, n = testn)))
  expect_identical(computeBounds(testy, alpha = 0.1, penalty = "weights", weights = rep(1, 36),
                                 stat = teststat),
                   computeBounds(testy, q = critVal(alpha = 0.1, penalty = "weights",
                                                    weights = rep(1 / 36, 36), stat = teststat, n = testn)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(1, 5, 8, 23)),
                   computeBounds(testy, intervalSystem = "all", lengths = c(1, 5, 8, 23),
                           q = critVal(alpha = 0.14, intervalSystem = "all", lengths = c(1, 5, 8, 23),
                                       penalty = "log", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(computeBounds(testy, alpha = 0.034, penalty = "none", stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32)),
                   computeBounds(testy, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                           q = critVal(alpha = 0.034, intervalSystem = "dyaLen", lengths = c(1, 4, 8, 32),
                                       penalty = "none", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  expect_identical(computeBounds(testy, alpha = 0.56, penalty = "weights", weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.56, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       penalty = "weights", weights = c(0.2, 0.3, 0.4, 0.1),
                                       stat = teststat, n = testn)))
  
  teststat <- matrix(abs(rnorm(1e4 * testn)), testn, 1e4)
  expect_error(computeBounds(testy, alpha = 0.1, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 37L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.05, stat = teststat, nq = 37L),
                   computeBounds(testy, q = critVal(alpha = 0.05, stat = teststat, n = testn, nq = 37L)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  expect_identical(computeBounds(testy, alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(0:3, 5)),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                           q = critVal(alpha = 0.014, intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                                       stat = teststat, n = testn, nq = 100L)))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "all")
  expect_identical(computeBounds(testy, alpha = 0.014, stat = teststat, nq = 100L, 
                           intervalSystem = "all", lengths = 1L),
                   computeBounds(testy, intervalSystem = "all", lengths = 1L,
                           q = critVal(alpha = 0.014, intervalSystem = "all", lengths = 1,
                                       stat = teststat, n = testn, nq = 100L)))
  
  expect_error(computeBounds(testy, alpha = 0.1, output = "vector", stat = teststat))
  expect_error(computeBounds(testy, alpha = 0.1, data = 1, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum")
  expect_error(computeBounds(testy, alpha = 0.1, penalty = "weights", stat = teststat))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L)
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", penalty = "sqrt")
  expect_identical(computeBounds(testy, alpha = 0.05, stat = teststatvector),
                   computeBounds(testy, q = critVal(alpha = 0.05, stat = teststatmatrix, n = testn)))
  
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum",
                                         penalty = "log", lengths = c(1, 3, 5, 8, 9, 12))
  expect_identical(computeBounds(testy, alpha = 0.15, stat = teststatvector, nq = 100L,
                           lengths = c(1, 3, 5, 8, 9, 12), penalty = "log"),
                   computeBounds(testy, lengths = c(1, 3, 5, 8, 9, 12),
                           q = critVal(alpha = 0.15, stat = teststatmatrix, n = testn, nq = 100L,
                                       lengths = c(1, 3, 5, 8, 9, 12), penalty = "log")))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaLen")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                         penalty = "sqrt", lengths = c(1, 2, 8, 16))
  expect_identical(computeBounds(testy, alpha = 0.05, stat = teststatvector, nq = 2^7L,
                           intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16), penalty = "sqrt"),
                   computeBounds(testy, intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16),
                           q = critVal(alpha = 0.05, stat = teststatmatrix, n = testn, nq = 2^7L,
                                       intervalSystem = "dyaLen", lengths = c(1, 2, 8, 16), penalty = "sqrt")))
  
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                         penalty = "sqrt", lengths = c(1, 2, 8, 16, 32))
  expect_identical(computeBounds(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt")))
  expect_identical(computeBounds(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatvector, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt", output = "vector")))
  expect_identical(computeBounds(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32), penalty = "sqrt"),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       intervalSystem = "dyaPar", lengths = c(1, 2, 8, 16, 32),
                                       penalty = "sqrt", output = "vector")))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = "s", options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 0, options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = c(100, 200), options = list(load = list())))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100.5, options = list(load = list())),
                   computeBounds(testy, alpha = 0.1, r = 100L, options = list(load = list())))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulat = "vector", save = list(), load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, options = "vector"))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vecto", save = list(), load = list())))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log",
                           options = list(simulation = "vector", save = list(), load = list())),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8),
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8), penalty = "log",
                                       options = list(simulation = "vector", save = list(), load = list()))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   computeBounds(testy, lengths = 3:17,
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, lengths = 3:17, 
                                       penalty = "log",
                                       options = list(simulation = "vectorIncreased", save = list(),
                                                      load = list()))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log", nq = 100,
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   computeBounds(testy, lengths = 3:17,
                           q = critVal(n = 100, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log",
                                       options = list(simulation = "vector", save = list(),
                                                      load = list()))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, lengths = 10:13, penalty = "weights",
                           weights = rep(1 / 4, 4),
                           options = list(simulation = "matrix", save = list(), load = list())),
                   computeBounds(testy, lengths = 10:13,
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, lengths = 10:13,
                                       penalty = "weights", weights = rep(1 / 4, 4),
                                       options = list(simulation = "matrix", save = list(),
                                                      load = list()))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   computeBounds(testy, q = critVal(n = length(testy), alpha = 0.1, r = 100L,
                                              options = list(simulation = "matrixIncreased", save = list(),
                                                             load = list()))))
  
  testfile <- c(tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"),
                tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS"))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile, test = 1),
                                      load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = testfile),
                                      load = list(test = "test"))))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = c(testfile, testfile)),
                                      load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(RDSfile = 10),
                                      load = list())))
  
  teststat <- monteCarloSimulation(36L, r = 100L)
  teststatvec <- monteCarloSimulation(36L, r = 100L, output = "maximum")
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrix", save = list(RDSfile = testfile), load = list())),
                   computeBounds(testy, alpha = 0.1, stat = teststat))
  expect_identical(readRDS(testfile[1]), teststatvec)
  expect_identical(readRDS(testfile[2]), teststat)
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = 10),
                                      save = list())))
  expect_error(critVal(100L, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", load = list(RDSfile = testfile),
                                      save = list())))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", load = list(RDSfile = testfile[1]),
                                          save = list())),
                   computeBounds(testy, alpha = 0.1, stat = teststat))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", load = list(RDSfile = testfile[1]),
                                          save = list())),
                   computeBounds(testy, alpha = 0.1, stat = teststat))
  unlink(testfile)
  
  testvariable <- c("testsavevector", "testsavematrix")
  testStepR <- new.env()
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = c(testvariable, testvariable)),
                                      load = list(), envir = testStepR)))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = 10),
                                      load = list(), envir = testStepR)))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = "testStepR")))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, testStepR))))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "vector", save = list(variable = testvariable),
                                      load = list(), envir = c(testStepR, 10))))
  
  teststat <- monteCarloSimulation(36L, r = 100L, output = "maximum")
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "vector", save = list(variable = testvariable),
                                          load = list(), envir = testStepR)),
                   computeBounds(testy, alpha = 0.1, stat = teststat))
  expect_identical(get("testsavevector", envir = testStepR), teststat)
  expect_false(exists("testsavematrix", envir = testStepR))
  remove(testsavevector, envir = testStepR)
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(workspace = "matri"),
                                      load = list(), envir = testStepR)))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(workspace = c("vector", "matri")),
                                      load = list(), envir = testStepR)))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", load = list(workspace = "matri"),
                                      save = list(), envir = testStepR)))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", load = list(workspace = c("vector", "matri")),
                                      save = list(), envir = testStepR)))
  
  teststat <- monteCarloSimulation(36L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L,
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   computeBounds(testy, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   computeBounds(testy, alpha = 0.1, stat = teststat, options = list()))
  remove(critValStepRTab, envir = testStepR)
  
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = "matri"),
                                      load = list(), dirs = "testStepR")))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = c("vector", "matri")),
                                      load = list(), dirs = "testStepR")))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", load = list(fileSystem = "matri"),
                                      save = list(), dirs = "testStepR")))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", load = list(fileSystem = c("vector", "matri")),
                                      save = list(), dirs = "testStepR")))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, 
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = c("testStepR", "test"))))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L,
                       options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                      load = list(), dirs = 10)))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, 
                           options = list(simulation = "matrix", save = list(fileSystem = "matrix"),
                                          load = list(), dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(critVal(36L, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   critVal(36L, alpha = 0.1, stat = teststat, options = list()))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 50L,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(fileSystem = "matrix"), dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat, options = list()))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  teststat1 <- monteCarloSimulation(36L, r = 100L, output = "maximum", lengths = c(23:34))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, lengths = c(23:34),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix"),
                                                      fileSystem = c("matrixIncreased", "vector", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat1, lengths = c(23:34),
                           options = list()))
  expect_identical(readRDS(testfile[1]), teststat1)
  expect_false(file.exists(testfile[2]))
  expect_identical(get("testsavevector", envir = testStepR), teststat1)
  expect_false(exists("testsavematrix", envir = testStepR))
  
  teststat2 <- monteCarloSimulation(36L, r = 100L, intervalSystem = "dyaPar")
  teststat3 <- monteCarloSimulation(36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                    lengths = 2^(1:3))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar", lengths = 2^(1:3),
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("vectorIncreased", "vector"),
                                                      fileSystem = c("matrixIncreased", "matrix"),
                                                      RDSfile = testfile, variable = testvariable),
                                          load = list(), envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat2, intervalSystem = "dyaPar",
                           lengths = 2^(1:3), options = list()))
  expect_identical(readRDS(testfile[1]), teststat3)
  expect_identical(readRDS(testfile[2]), teststat2)
  expect_identical(get("testsavevector", envir = testStepR), teststat3)
  expect_identical(get("testsavematrix", envir = testStepR), teststat2)
  unlink(testfile)
  remove(testsavevector, envir = testStepR)
  remove(testsavematrix, envir = testStepR)
  
  teststat <- monteCarloSimulation(63L, r = 100L)
  teststat4 <- monteCarloSimulation(63L, r = 100L, output = "maximum", lengths = 1:36, penalty = "log")
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, stat = teststat, penalty = "log",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrix", "vectorIncreased"),
                                                      fileSystem = c("vector", "matrix")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat, penalty = "log", options = list()))
  
  teststat1new <- monteCarloSimulation(36L, r = 200L, output = "maximum", lengths = c(23:34))
  expect_identical(critVal(36L, alpha = 0.1, r = 200L, output = "value", lengths = c(23:34),
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrixIncreased", "vector", "matrix")),
                                          load = list(workspace = c("vector", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   critVal(36L, alpha = 0.1, stat = teststat1new, output = "value", lengths = c(23:34),
                           options = list()))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 50L, penalty = "log",
                           options = list(simulation = "matrix",
                                          save = list(fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat4, penalty = "log", options = list()))
  
  teststat5 <- monteCarloSimulation(36L, r = 100L, output = "maximum", intervalSystem = "dyaLen",
                                    lengths = 16L, penalty = "log")
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", stat = teststat5,
                           options = list(simulation = "vector",
                                          save = list(fileSystem = c("matrix", "vector"),
                                                      workspace = c("matrix", "matrixIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat5, intervalSystem = "dyaLen",
                           lengths = 16L, penalty = "log", options = list()))
  
  teststat6 <- monteCarloSimulation(125L, r = 100L, intervalSystem = "dyaLen")
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, penalty = "weights", nq = 125L,
                           weights = 1:6 / sum(1:6), intervalSystem = "dyaLen",
                           options = list(simulation = "matrixIncreased",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat6, penalty = "weights",
                           weights = 1:6 / sum(1:6), intervalSystem = "dyaLen", options = list()))
  
  teststat6b <- monteCarloSimulation(125L, r = 100L, output = "maximum", penalty = "log",
                                     intervalSystem = "dyaLen", lengths = 2^(2:4))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(2:4), nq = 125L,
                           options = list(simulation = "matrix",
                                          save = list(workspace = c("matrixIncreased", "vector"),
                                                      fileSystem = c("matrix", "vectorIncreased")),
                                          load = list(workspace = c("matrixIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat6, penalty = "log",
                           intervalSystem = "dyaLen", lengths = 2^(2:4), options = list()))
  
  teststat <- monteCarloSimulation(36L, r = 200L, output = "maximum", rand.gen = function(data) {rnorm(36)})
  expect_identical(computeBounds(testy, alpha = 0.1, r = 200L, rand.gen = function(data) {rnorm(36)},
                           options = list(simulation = "vector",
                                          save = list(workspace = c("matrix", "vector")),
                                          load = list(fileSystem = c("vectorIncreased", "matrix")),
                                          envir = testStepR, dirs = "testStepR")),
                   computeBounds(testy, alpha = 0.1, stat = teststat, options = list()))
  
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
  
  if ("stepRdata" %in% rownames(installed.packages())) {
    teststat <- monteCarloSimulation(63L, intervalSystem = "dyaLen")
    expect_equal(computeBounds(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaLen",
                               options = list(simulation = "vector", save = list(),
                                              load = list(package = TRUE),
                                              envir = testStepR, dirs = "testStepR")),
                 computeBounds(testy, alpha = 0.1, stat = teststat, intervalSystem = "dyaLen",
                               options = list()))
  }
  
  expect_error(computeBounds(testy, alpha = 0.1, test = 1, options = list(load = list())))
  
  expect_error(computeBounds(testy, alpha = 0.1, sd = "s", options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, sd = 0, options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, sd = c(1, 2), options = list(load = list())))
  
  expect_error(supressWarning(computeBounds(testy, alpha = 0.1, r = 100L, seed = "s", options = list(load = list()))))
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, seed = c(1, 2), options = list(load = list())),
                   computeBounds(testy, alpha = 0.1, r = 100L, seed = 1, options = list(load = list())))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, seed = 100.5, options = list(load = list())),
                   computeBounds(testy, alpha = 0.1, r = 100L, seed = 100L, options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 63L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, seed = 63L, options = list(load = list())),
                   computeBounds(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, seed = 36L,
                                 options = list(load = list(), simulation = "matrix")),
                   computeBounds(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, rand.gen = 10, options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, rand.gen = function(data, n) {rnorm(10)},
                       options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(10)},
                       options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 63L, r = 100L)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, rand.gen = function(data) {rnorm(63)},
                           options = list(load = list())),
                   computeBounds(testy, alpha = 0.1, r = 100L, stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, messages = "s", options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, messages = c(10, 20), options = list(load = list())))
  expect_error(computeBounds(testy, alpha = 0.1, r = 100L, messages = 0, options = list(load = list())))
  
  expect_identical(suppressMessages(computeBounds(testy, alpha = 0.1, r = 100L, messages = 10.5,
                                            options = list(load = list()))),
                   suppressMessages(computeBounds(testy, alpha = 0.1, r = 100L, messages = 10L,
                                            options = list(load = list()))))
})

test_that("... is tested and works", {
  testn <- 22L
  testy <- rnorm(testn)
  testq <- rep(1, testn)
  
  expect_error(computeBounds(testy, q = testq, std = 1))
  expect_error(computeBounds(testy, q = testq, intervalsystem = "all"))
  expect_error(computeBounds(testy, sd = "s", q = testq))
  expect_error(computeBounds(testy, sd = c(1, 2), q = testq))
  expect_error(computeBounds(testy, sd = NA, q = testq))
  expect_error(computeBounds(c(1, 2), q = c(2, 2)))
  expect_error(computeBounds(testy, sd = Inf, q = testq))
  expect_error(computeBounds(testy, sd = 0, q = testq))
  expect_error(computeBounds(testy, sd = -0.1, q = testq))
  expect_identical(computeBounds(testy, q = testq), computeBounds(testy, q = testq, sd = sdrobnorm(testy)))
  expect_identical(computeBounds(testy, q = testq, sd = 1L), computeBounds(testy, q = testq, sd = 1))
})

test_that("family 'hsmuce' works", {
  testn <- 40L
  testy <- rnorm(testn)
  testq <- rep(1, testn)
  
  expect_error(computeBounds(family = "hsmuce", q = testq))
  expect_error(computeBounds(numeric(0), q = testq))
  expect_identical(computeBounds(testy, family = "hsmuce", q = testq),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = 2^(1:5),
                                 q = testq))
  expect_error(computeBounds(as.integer(testy), family = "hsmuce", q = testq))
  expect_error(computeBounds(c(testy, "s"), family = "hsmuce", q = testq))
  expect_error(computeBounds(c(rnorm(10), NA), family = "hsmuce", q = testq)) 
  
  bounds <- computeBounds(testy, family = "hsmuce", q = testq)
  testIndices(bounds = bounds, indices = indicesDyaParLengths, n = testn, lengths = 2^(1:5))
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq) 

  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- 23:1 / 10
  
  expect_identical(computeBounds(testy, family = "hsmuce", q = testq),
                   computeBounds(testy, family = "hsmuce", q = testq, intervalSystem = "dyaPar"))
  
  bounds <- computeBounds(testy, family = "hsmuce", q = testq, intervalSystem = "all")
  testIndices(bounds = bounds, indices = indicesAllLengths, n = testn, lengths = 2:testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq) 

  bounds <- computeBounds(testy, family = "hsmuce", q = testq, intervalSystem = "dyaLen")
  testIndices(bounds = bounds, indices = indicesDyaLenLengths, n = testn, lengths = 2^(1:5))
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq) 

  testn <- 37L
  testy <- c(rnorm(20, 1, 0.23), rnorm(testn - 20, -1, 0.34))
  
  testq <- 2
  expect_error(computeBounds(testy, family = "hsmuce", lengths = 1L, q = testq))
  expect_error(computeBounds(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = 1L, q = testq))
  expect_error(computeBounds(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = 1L, q = testq))
  testq <- 37:1 / 10
  expect_identical(computeBounds(testy, family = "hsmuce", q = testq),
                   computeBounds(testy, family = "hsmuce", q = testq, lengths = 2^(1:5)))
  
  testq <- 9:1
  bounds <- computeBounds(testy, family = "hsmuce", q = testq, intervalSystem = "all",
                          lengths = c(2, 5:10, 35:36))
  testIndices(bounds = bounds, indices = indicesAllLengths, n = testn, lengths = c(2, 5:10, 35:36))
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq,
             lengths = c(2, 5:10, 35:36)) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq,
           lengths = c(2, 5:10, 35:36))
  
  testq <- 3:1 / 5
  bounds <- computeBounds(testy, family = "hsmuce", q = testq, intervalSystem = "dyaLen",
                          lengths = c(2, 4, 32))
  testIndices(bounds = bounds, indices = indicesDyaLenLengths, n = testn, lengths = c(2, 4, 32))
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq,
             lengths = c(2, 4, 32)) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq,
           lengths = c(2, 4, 32)) 
  
  testq <- 2:1 / 5
  bounds <- computeBounds(testy, family = "hsmuce", q = testq, lengths = c(2, 4))
  testIndices(bounds = bounds, indices = indicesDyaParLengths, n = testn, lengths = c(2, 4))
  testBounds(bounds = bounds, singleBounds = singleBoundsHsmuce, y = testy, criticalValues = testq,
             lengths = c(2, 4)) 
  testStat(bounds = bounds, singleStat = singleStatHsmuce, y = testy, criticalValues = testq,
           lengths = c(2, 4))
  
  testq <- 37:1 / 10
  expect_error(computeBounds(testy, q = testq, family = "hsmuce", sd = 1))
  expect_error(computeBounds(testy, q = testq, family = "hsmuce", intervalsystem = "all"))
})

test_that("argument q is tested and works for family 'hsmuce'", {
  testn <- 36L
  testy <- c(rnorm(12, 1, 0.13), rnorm(12, -1, 0.23), rnorm(12, 1, 0.43))
  teststat <- monteCarloSimulation(36L, family = "hsmuce", r = 100L)
  
  expect_warning(ret <- computeBounds(testy, family = "hsmuce"))
  expect_identical(ret, computeBounds(testy, family = "hsmuce", alpha = 0.5))
  expect_error(computeBounds(testy, q = Inf, alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(computeBounds(testy, q = rep(1, 6), alpha = 0.1, stat = teststat, family = "hsmuce"))
  expect_error(computeBounds(testy, q = rep(1, 4), alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  testq <- 1:5
  attr(testq, "n") <- "s"
  expect_error(computeBounds(testy, q = testq, alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  attr(testq, "n") <- 35L
  expect_error(computeBounds(testy, q = testq, alpha = 0.1, stat = teststat, family = "hsmuce"))
  
  expect_identical(computeBounds(testy, q = 3, family = "hsmuce", intervalSystem = "all",
                                 lengths = c(2:3, 8:23),
                           penalty = "sqrt"),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", lengths = c(2:3, 8:23),
                           q = critVal(q = 3, family = "hsmuce", intervalSystem = "all",
                                       lengths = c(2:3, 8:23), n = testn, penalty = "sqrt")))
  expect_identical(computeBounds(testy, q = 3, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32), nq = 45L, 
                           penalty = "none"),
                   computeBounds(testy, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                                       n = testn, nq = 45L, penalty = "none")))
  expect_identical(computeBounds(testy, q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           penalty = "log"),
                   computeBounds(testy, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(q = 3, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                                       n = testn, penalty = "log")))
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  testq <- 2:45
  attr(testq, "n") <- 45L
  expect_identical(computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  testq <- 1:36
  attr(testq, "n") <- 45L
  expect_identical(computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = testq),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = 2:36))
  expect_identical(computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = 1:36, lengths = 3:23),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", q = 3:23, lengths = 3:23))
  expect_identical(computeBounds(testy, q = 1:36, family = "hsmuce", intervalSystem = "dyaLen"),
                   computeBounds(testy, q = 2^(1:5), family = "hsmuce", intervalSystem = "dyaLen"))
  testq <- 2^(1:6)
  attr(testq, "n") <- 64L
  expect_identical(computeBounds(testy, q = testq, family = "hsmuce", intervalSystem = "dyaPar"),
                   computeBounds(testy, q = 2^(1:5), family = "hsmuce", intervalSystem = "dyaPar"))
  
  ret <- computeBounds(testy, family = "hsmuce", alpha = 0.1, stat = teststat)
  expect_identical(ret, computeBounds(testy, family = "hsmuce", alpha = 0.1, stat = teststat,
                                nq = testn, intervalSystem = "dyaPar", lengths = 2^(1:5),
                                penalty = "weights", weights = rep(0.2, 5)))
  expect_identical(ret, computeBounds(testy, family = "hsmuce",
                                q = critVal(family = "hsmuce", alpha = 0.1, stat = teststat, n = testn)))
  
  expect_error(computeBounds(testy, family = "hsmuce", alpha = "s", stat = teststat))
  expect_identical(computeBounds(testy, family = "hsmuce", alpha = 0.075, stat = teststat),
                   computeBounds(testy, family = "hsmuce",
                           q = critVal(alpha = 0.075, family = "hsmuce", stat = teststat, n = testn)))
  
  expect_error(computeBounds(testy, family = "hsmuce", alpha = 0.1, stat = teststat, n = testn))
  expect_error(computeBounds(testy, alpha = 0.1, family = "hsmuce", weights = NA, stat = teststat))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce", intervalSystem = "all")
  expect_identical(computeBounds(testy, family = "hsmuce", alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(2, 5, 8, 23)),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all", lengths = c(2, 5, 8, 23),
                           q = critVal(alpha = 0.14, family = "hsmuce", intervalSystem = "all",
                                       lengths = c(2, 5, 8, 23),
                                       penalty = "log", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce", intervalSystem = "dyaLen")
  expect_identical(computeBounds(testy, family = "hsmuce", alpha = 0.034, penalty = "none", stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32)),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.034, family = "hsmuce", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32),
                                       penalty = "none", stat = teststat, n = testn)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "hsmuce")
  expect_identical(computeBounds(testy, family = "hsmuce", alpha = 0.56, penalty = "weights",
                           weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32)),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           q = critVal(alpha = 0.56, family = "hsmuce", intervalSystem = "dyaPar", 
                                       lengths = c(2, 4, 8, 32), penalty = "weights",
                                       weights = c(0.2, 0.3, 0.4, 0.1), stat = teststat, n = testn)))
  
  expect_identical(computeBounds(testy, family = "hsmuce", alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(1:3, 5)),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = 2^c(1:3, 5),
                           q = critVal(alpha = 0.014, family = "hsmuce", intervalSystem = "dyaPar",
                                       lengths = 2^c(1:3, 5), stat = teststat, n = testn, nq = 100L)))
  
  expect_error(computeBounds(testy, family = "hsmuce", alpha = 0.1, output = "vector", stat = teststat))
  expect_error(computeBounds(testy, family = "hsmuce", alpha = 0.1, data = 1, stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, family = "hsmuce", stat = rnorm(1e4)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "all", family = "hsmuce")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "all",
                                         penalty = "sqrt", family = "hsmuce")
  expect_identical(computeBounds(testy, family = "hsmuce", intervalSystem = "all", penalty = "sqrt", alpha = 0.05,
                           stat = teststatvector),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "all",
                           q = critVal(family = "hsmuce", intervalSystem = "all", alpha = 0.05, penalty = "sqrt",
                                       stat = teststatmatrix, n = testn)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, intervalSystem = "dyaPar", family = "hsmuce")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, output = "maximum", intervalSystem = "dyaPar",
                                         penalty = "sqrt", family = "hsmuce", lengths = c(2, 8, 16, 32))
  expect_identical(computeBounds(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                           penalty = "sqrt"),
                   computeBounds(testy, family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       family = "hsmuce", intervalSystem = "dyaPar", lengths = c(2, 8, 16, 32),
                                       penalty = "sqrt")))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8), penalty = "log", family = "hsmuce",
                           options = list(simulation = "vector", save = list(), load = list())),
                   computeBounds(testy, intervalSystem = "dyaPar", family = "hsmuce", lengths = c(2, 4, 8),
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8), penalty = "log", family = "hsmuce",
                                       options = list(simulation = "vector", save = list(), load = list()))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, family = "hsmuce", weights = c(0.4, 0.2, 0.1, 0.1, 0.2),
                           options = list(simulation = "matrixIncreased", save = list(), load = list())),
                   computeBounds(testy, family = "hsmuce",
                           q = critVal(n = length(testy), alpha = 0.1, r = 100L, family = "hsmuce"
                                       , weights = c(0.4, 0.2, 0.1, 0.1, 0.2),
                                       options = list(simulation = "matrixIncreased", save = list(),
                                                      load = list()))))
})

test_that("family 'mDependentPS' works", {
  testn <- 20L
  testy <- rnorm(testn)
  testq <- rep(1, testn)
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  
  expect_error(computeBounds(family = "mDependentPS", q = testq, covariances = testcovariances))
  expect_error(computeBounds(numeric(0), q = testq, covariances = testcovariances))
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq, covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaLen",
                                 lengths = 2^(0:4), q = testq, covariances = testcovariances))
  expect_error(computeBounds(as.integer(testy), family = "mDependentPS", q = testq,
                             covariances = testcovariances))
  expect_error(computeBounds(c(testy, "s"), family = "mDependentPS", q = testq,
                             covariances = testcovariances))
  expect_error(computeBounds(c(rnorm(10), NA), family = "mDependentPS", q = testq,
                             covariances = testcovariances)) 
  
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq, covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesDyaLen, n = testn, lengths = 2^(0:4))
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           covariances = testcovariances) 
  
  testn <- 23L
  testy <- c(rnorm(10, 1, 0.23), rnorm(testn - 10, -1, 0.34))
  testq <- 23:1 / 10
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.6, 0.5), lag.max = 2))
  
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq, covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", q = testq, intervalSystem = "dyaLen",
                                 covariances = testcovariances))
  
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq, intervalSystem = "all",
                          covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesAll, n = testn, lengths = 1:testn)
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           covariances = testcovariances) 
  
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq, intervalSystem = "dyaPar",
                          covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesDyaPar, n = testn, lengths = 2^(0:4))
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           covariances = testcovariances) 
  
  testn <- 37L
  testy <- c(rnorm(20, 1, 0.23), rnorm(testn - 20, -1, 0.34))
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3, 0.1, 0.05), lag.max = 5))
  testq <- 37:1 / 10
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq, covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", q = testq, lengths = 2^(0:5),
                                 covariances = testcovariances))
  
  testq <- 9:1
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq, intervalSystem = "all",
                          lengths = c(2, 5:10, 35:36), covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesAllLengths, n = testn, lengths = c(2, 5:10, 35:36))
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             lengths = c(2, 5:10, 35:36), covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           lengths = c(2, 5:10, 35:36), covariances = testcovariances)
  
  testq <- 3:1 / 5
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq,
                          lengths = c(1, 4, 32), covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesDyaLenLengths, n = testn, lengths = c(1, 4, 32))
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             lengths = c(1, 4, 32), covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           lengths = c(1, 4, 32), covariances = testcovariances) 
  
  testq <- 2:1 / 5
  bounds <- computeBounds(testy, family = "mDependentPS", q = testq, intervalSystem = "dyaPar",
                          lengths = c(2, 4), covariances = testcovariances)
  testIndices(bounds = bounds, indices = indicesDyaParLengths, n = testn, lengths = c(2, 4))
  testBounds(bounds = bounds, singleBounds = singleBoundsmDependentPS, y = testy, criticalValues = testq,
             lengths = c(2, 4), covariances = testcovariances) 
  testStat(bounds = bounds, singleStat = singleStatmDependentPS, y = testy, criticalValues = testq,
           lengths = c(2, 4), covariances = testcovariances)
})

test_that("argument q is tested and works for family 'mDependentPS'", {
  testn <- 36L
  testy <- c(rnorm(12, 10, 0.13), rnorm(12, -10, 0.13), rnorm(12, 10, 0.13))
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances)
  
  expect_warning(ret <- computeBounds(testy, family = "mDependentPS", covariances = testcovariances))
  expect_identical(ret,
                   computeBounds(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.5))
  expect_error(computeBounds(testy, q = rep(1, 7), alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testcovariances))
  expect_error(computeBounds(testy, q = rep(1, 4), alpha = 0.1, stat = teststat, family = "mDependentPS",
                       covariances = testcovariances))
  
  expect_identical(computeBounds(testy, q = 3, family = "mDependentPS", intervalSystem = "all",
                           lengths = c(2:3, 8:23), penalty = "sqrt", covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "all", lengths = c(2:3, 8:23),
                           covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "all",
                                       lengths = c(2:3, 8:23), n = testn, penalty = "sqrt", 
                                       covariances = testcovariances)))
  expect_identical(computeBounds(testy, q = 3, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), nq = 45L, penalty = "none",
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32), n = testn, nq = 45L, penalty = "none",
                                       covariances = testcovariances)))
  expect_identical(computeBounds(testy, q = 3, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), penalty = "log", covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(q = 3, family = "mDependentPS", intervalSystem = "dyaPar",
                                       lengths = c(2, 4, 8, 32), n = testn, penalty = "log",
                                       covariances = testcovariances)))
  
  testq <- 1:45
  attr(testq, "n") <- 45L
  expect_identical(computeBounds(testy, family = "mDependentPS", intervalSystem = "all", q = testq,
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "all", q = 1:36,
                           covariances = testcovariances))
  expect_identical(computeBounds(testy, family = "mDependentPS", intervalSystem = "all", q = 1:36,
                           lengths = 3:23, covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "all", q = 3:23,
                           lengths = 3:23, covariances = testcovariances))
  expect_identical(computeBounds(testy, q = 1:36, family = "mDependentPS", intervalSystem = "dyaLen",
                           covariances = testcovariances),
                   computeBounds(testy, q = 2^(0:5), family = "mDependentPS", intervalSystem = "dyaLen",
                           covariances = testcovariances))
  testq <- 2^(0:6)
  attr(testq, "n") <- 64L
  expect_identical(computeBounds(testy, q = testq, family = "mDependentPS",
                           intervalSystem = "dyaPar", covariances = testcovariances),
                   computeBounds(testy, q = 2^(0:5), family = "mDependentPS", intervalSystem = "dyaPar",
                           covariances = testcovariances))
  
  ret <- computeBounds(testy, family = "mDependentPS", alpha = 0.1, stat = teststat,
                 covariances = testcovariances)
  expect_identical(ret, computeBounds(testy, family = "mDependentPS", alpha = 0.1, stat = teststat,
                                nq = testn, intervalSystem = "dyaLen", lengths = 2^(0:5),
                                penalty = "sqrt", covariances = testcovariances))
  expect_identical(ret, computeBounds(testy, family = "mDependentPS", covariances = testcovariances,
                                q = critVal(family = "mDependentPS", alpha = 0.1, stat = teststat,
                                            n = testn, covariances = testcovariances)))
  
  expect_error(computeBounds(testy, family = "mDependentPS", alpha = "s", stat = teststat,
                       covariances = testcovariances))
  expect_identical(computeBounds(testy, family = "mDependentPS", alpha = 0.075, stat = teststat,
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", covariances = testcovariances,
                           q = critVal(alpha = 0.075, family = "mDependentPS", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  
  expect_error(computeBounds(testy, family = "mDependentPS", alpha = 0.1, stat = teststat, n = testn,
                       covariances = testcovariances))
  expect_error(computeBounds(testy, alpha = 0.1, family = "mDependentPS", penalty = "weights", weights = NA,
                       stat = teststat, covariances = testcovariances))
  
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "all")
  expect_identical(computeBounds(testy, family = "mDependentPS", alpha = 0.14, penalty = "log", stat = teststat,
                           intervalSystem = "all", lengths = c(2, 5, 8, 23),
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "all",
                           lengths = c(2, 5, 8, 23),
                           covariances = testcovariances,
                           q = critVal(alpha = 0.14, family = "mDependentPS", intervalSystem = "all",
                                       lengths = c(2, 5, 8, 23), penalty = "log", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "dyaLen")
  expect_identical(computeBounds(testy, family = "mDependentPS", alpha = 0.034, penalty = "none",
                           stat = teststat,
                           intervalSystem = "dyaLen", lengths = c(2, 4, 8, 32),
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaLen",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(alpha = 0.034, family = "mDependentPS", intervalSystem = "dyaLen",
                                       lengths = c(2, 4, 8, 32), penalty = "none", stat = teststat,
                                       n = testn, covariances = testcovariances)))
  teststat <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS", covariances = testcovariances,
                                   intervalSystem = "dyaPar")
  expect_identical(computeBounds(testy, family = "mDependentPS", alpha = 0.56, penalty = "weights",
                           weights = c(0.2, 0.3, 0.4, 0.1),
                           stat = teststat, intervalSystem = "dyaPar", lengths = c(2, 4, 8, 32),
                           covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaPar",
                           lengths = c(2, 4, 8, 32), covariances = testcovariances,
                           q = critVal(alpha = 0.56, family = "mDependentPS", intervalSystem = "dyaPar", 
                                       lengths = c(2, 4, 8, 32), penalty = "weights",
                                       weights = c(0.2, 0.3, 0.4, 0.1), stat = teststat, n = testn,
                                       covariances = testcovariances)))
  
  expect_identical(computeBounds(testy, family = "mDependentPS", alpha = 0.014,
                           stat = teststat, nq = 100L, 
                           intervalSystem = "dyaPar", lengths = 2^c(0:3, 5), covariances = testcovariances),
                   computeBounds(testy, family = "mDependentPS", intervalSystem = "dyaPar", lengths = 2^c(0:3, 5),
                           covariances = testcovariances,
                           q = critVal(alpha = 0.014, family = "mDependentPS", intervalSystem = "dyaPar",
                                       lengths = 2^c(0:3, 5), stat = teststat, n = testn, nq = 100L,
                                       covariances = testcovariances)))
  
  expect_error(computeBounds(testy, family = "mDependentPS", alpha = 0.1, output = "vector", stat = teststat,
                       covariances = testcovariances))
  expect_error(computeBounds(testy, family = "mDependentPS", alpha = 0.1, data = 1, stat = teststat,
                       covariances = testcovariances))
  
  expect_error(computeBounds(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.1,
                       output = "vector", stat = teststat))
  expect_error(computeBounds(testy, family = "mDependentPS", covariances = testcovariances, alpha = 0.1, data = 1,
                       stat = teststat))
  
  expect_error(computeBounds(testy, alpha = 0.1, family = "mDependentPS", covariances = testcovariances,
                       stat = rnorm(1e4), penalty = "weights"))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, intervalSystem = "all")
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, output = "maximum",
                                         intervalSystem = "all")
  expect_identical(computeBounds(testy, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all", penalty = "sqrt", alpha = 0.078, stat = teststatvector),
                   computeBounds(testy, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all",
                           q = critVal(family = "mDependentPS", covariances = testcovariances,
                                       intervalSystem = "all", alpha = 0.078, penalty = "sqrt",
                                       stat = teststatmatrix, n = testn)))
  
  teststatmatrix <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances)
  teststatvector <- monteCarloSimulation(n = 36L, r = 100L, family = "mDependentPS",
                                         covariances = testcovariances, output = "maximum",
                                         lengths = c(2, 8, 16, 32))
  expect_identical(computeBounds(testy, alpha = 0.122, stat = teststatvector, nq = 2^9L,
                           family = "mDependentPS", covariances = testcovariances,
                           lengths = c(2, 8, 16, 32)),
                   computeBounds(testy, family = "mDependentPS", covariances = testcovariances,
                           lengths = c(2, 8, 16, 32),
                           q = critVal(alpha = 0.122, stat = teststatmatrix, n = testn, nq = 2^9L,
                                       family = "mDependentPS", covariances = testcovariances,
                                       lengths = c(2, 8, 16, 32))))
  
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, lengths = 3:17, penalty = "log", nq = 100,
                           family = "mDependentPS", covariances = testcovariances, intervalSystem = "all",
                           options = list(simulation = "vectorIncreased", save = list(), load = list())),
                   computeBounds(testy, lengths = 3:17, family = "mDependentPS", covariances = testcovariances,
                           intervalSystem = "all",
                           q = critVal(n = 100, alpha = 0.1, r = 100L, lengths = 3:17, intervalSystem = "all",
                                       penalty = "log", family = "mDependentPS", covariances = testcovariances,
                                       options = list(simulation = "vector", save = list(),
                                                      load = list()))))
  
  testStepR <- new.env()
  teststat <- monteCarloSimulation(36L, r = 100L, family = "mDependentPS",
                                   covariances = testcovariances)
  expect_identical(computeBounds(testy, alpha = 0.1, r = 100L, family = "mDependentPS",
                           covariances = testcovariances,
                           options = list(simulation = "matrix", save = list(workspace = "matrix"),
                                          load = list(), envir = testStepR)),
                   computeBounds(testy, alpha = 0.1, stat = teststat, family = "mDependentPS",
                           covariances = testcovariances, options = list()))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(critVal(36L, alpha = 0.1, r = 50L, output = "vector", family = "mDependentPS",
                           covariances = testcovariances + 1e-12,
                           options = list(simulation = "matrix", save = list(),
                                          load = list(workspace = "matrix"), envir = testStepR)),
                   critVal(36L, alpha = 0.1, stat = teststat, output = "vector", options = list(),
                           family = "mDependentPS", covariances = testcovariances))
  remove(critValStepRTab, envir = testStepR)
})

test_that("arguments in ... are tested and work for family mDependentPS", {
  testn <- 17L
  testcovariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
  testcorrelations <- testcovariances / testcovariances[1]
  testsignal <- list(leftIndex = c(1L, 13L), rightIndex = c(12L, testn), value = c(0, -1))
  testfilter <- list(acf = testcorrelations)
  class(testfilter) <- c("lowpassFilter", class(testfilter))
  testy <- as.numeric(arima.sim(n = testn, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 1))
  testq = 17:1 / 3
  
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, covariances = testcovariances, 
                             std = 1))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, correlations = testcorrelations,
                             std = 1))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, filter = testfilter, std = 1))
  expect_error(computeBounds(testy, family = "mDependentPS", intervalsystem = "all"))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = 1))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             covariances = c(testcovariances, "s")))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             covariances = c(testcovariances, NA)))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             covariances = c(testcovariances, Inf)))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             covariances = c(0.01, testcovariances)))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             covariances = c(-1, testcovariances)))
  
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             correlations = c(testcorrelations, "s")))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             correlations = c(testcorrelations, NA)))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             correlations = c(testcorrelations, Inf)))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                             correlations = c(testcorrelations, 1.1)))
  expect_error(ccomputeBounds(testy, family = "mDependentPS", q = testq,
                              correlations = c(0.99, testcorrelations[-1])))
  
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = "s",
                             correlations = testcorrelations))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = c(1, 2),
                             correlations = testcorrelations))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = NA,
                             correlations = testcorrelations))
  expect_error(computeBounds(c(1, 2), q = c(5, 4), family = "mDependentPS", correlations = testcorrelations))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = Inf,
                             correlations = testcorrelations))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = 0,
                             correlations = testcorrelations))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = -0.1,
                             correlations = testcorrelations))
  
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq,
                           filter = list(param = list(acf = testcorrelations))))
  
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = "s", filter = testfilter))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = c(1, 2), filter = testfilter))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = NA, filter = testfilter))
  expect_error(computeBounds(c(1, 2), q = c(5, 4), family = "mDependentPS", filter = testfilter))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = Inf, filter = testfilter))
  expect_error(computeBounds(testy, family = "mDependentPS", q = testq, sd = 0, filter = testfilter))
  expect_error(ccomputeBounds(testy, family = "mDependentPS", q = testq, sd = -0.1, filter = testfilter))
  
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq,
                               covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   computeBounds(testy, family = "mDependentPS", q = testq, correlations = testcorrelations))
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq,
                               covariances = 1.1^2 * testcorrelations),
                   computeBounds(testy, family = "mDependentPS", q = testq,
                                 correlations = testcorrelations, sd = 1.1))
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq,
                               covariances = sdrobnorm(testy, lag = 4)^2 * testcorrelations),
                   computeBounds(testy, family = "mDependentPS", q = testq, filter = testfilter))
  expect_identical(computeBounds(testy, family = "mDependentPS", q = testq,
                               covariances = 1.1^2 * testcorrelations),
                   computeBounds(testy, family = "mDependentPS", q = testq, filter = testfilter, sd = 1.1))
})
