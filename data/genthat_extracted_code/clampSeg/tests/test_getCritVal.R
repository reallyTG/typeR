
context("getCritVal")

library(stepR)

test <- function(testalpha, testn, testnq, teststat, testfilter) {
  ret <- getCritVal(alpha = testalpha, n = testn, nq = testnq, stat = teststat, filter = testfilter) 
  
  expect_identical(ret, critVal(alpha = testalpha, n = testn, nq = testnq, family = "mDependentPS",
                                intervalSystem = "dyaLen", lengths = 2^(0:(as.integer(log2(testn) + 1e-6))),
                                penalty = "sqrt", stat = teststat, output = "value",
                                filter = testfilter))

  expect_identical(critVal(q = ret, alpha = testalpha, n = testn, nq = testnq, family = "mDependentPS",
                           intervalSystem = "dyaLen", lengths = 2^(0:(as.integer(log2(testn) + 1e-6))),
                           penalty = "sqrt", stat = teststat, output = "value", filter = testfilter),
                   critVal(alpha = testalpha, n = testn, nq = testnq, family = "mDependentPS",
                           intervalSystem = "dyaLen", lengths = 2^(0:(as.integer(log2(testn) + 1e-6))),
                           penalty = "sqrt", stat = teststat, output = "value", filter = testfilter))
}

test_that("n is tested and works for default parameters and given stat", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_error(getCritVal())
  expect_error(getCritVal(stat = teststat))
  expect_error(getCritVal(stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = "s", stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = c(1L, 2L), stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = as.integer(NA), stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = NULL, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = Inf, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 0L, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = -1L, stat = teststat, filter = testfilter))
  
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, nq = 30L, alpha = 0.05))
  expect_identical(getCritVal(n = 30, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter))
  expect_identical(getCritVal(n = 30.5, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter))

  test(testalpha = 0.05, testn = 30L, testnq = 30L, teststat = teststat, testfilter = testfilter)
})

test_that("alpha is tested and works for given stat", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_error(getCritVal(n = 30L, alpha = "s", stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = NULL, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = NA, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = Inf, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = c(0.1, 0.05), stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = 0, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = 1, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = -0.05, stat = teststat, filter = testfilter))
  expect_error(getCritVal(n = 30L, alpha = 1.1, stat = teststat, filter = testfilter))
  
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, alpha = 0.05, stat = teststat, filter = testfilter))
  
  test(testalpha = 0.02, testn = 30L, testnq = 30L, teststat = teststat, testfilter = testfilter)
  test(testalpha = 0.335, testn = 30L, testnq = 30L, teststat = teststat, testfilter = testfilter)
})

test_that("filter is tested and works for given stat", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_error(getCritVal(n = 30L,stat = teststat, filter = unclass(testfilter)))
  
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 8)
  teststat <- monteCarloSimulation(n = 45, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  test(testalpha = 0.1223, testn = 45L, testnq = 45L, teststat = teststat, testfilter = testfilter)
  
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.05), len = 14)
  teststat <- monteCarloSimulation(n = 23, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  test(testalpha = 0.01, testn = 23L, testnq = 23L, teststat = teststat, testfilter = testfilter)
  
  testfilter <- lowpassFilter(param = list(pole = 6L, cutoff = 0.25), len = 5)
  teststat <- monteCarloSimulation(n = 45, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  test(testalpha = 0.3, testn = 45L, testnq = 45L, teststat = teststat, testfilter = testfilter)
})

test_that("stat is tested and works", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  
  teststat <- matrix(runif(1e2 * 5), 5, 1e2)
  expect_error(getCritVal(n = 30L, stat = teststat, filter = testfilter))
  
  teststat <- rnorm(100)
  expect_error(getCritVal(n = 30L, stat = teststat, filter = testfilter))
  
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  testmatrix <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS", filter = testfilter)
  expect_identical(getCritVal(n = 30L, stat = testmatrix, filter = testfilter),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter))

  expect_error(getCritVal(n = 32L, stat = teststat, filter = testfilter))
  
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 10)
  expect_error(getCritVal(n = 30L, stat = teststat, filter = testfilter))
  
  testfilter <- lowpassFilter(param = list(pole = 6L, cutoff = 0.1), len = 11)
  expect_error(getCritVal(n = 30L, stat = teststat, filter = testfilter))
  
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.15), len = 11)
  expect_error(getCritVal(n = 30L, stat = teststat, filter = testfilter))
})

test_that("r is tested and works", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)

  expect_error(getCritVal(n = 30L, filter = testfilter, r = "s", options = list(load = list())))
  expect_error(getCritVal(n = 30L, filter = testfilter, r = 0L, options = list(load = list())))
  expect_error(getCritVal(n = 30L, filter = testfilter, r = c(100L, 200L), options = list(load = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100.5, options = list(load = list())),
                   getCritVal(n = 30L, filter = testfilter, r = 100L, options = list(load = list())))
  
  teststat <- monteCarloSimulation(n = 30, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, options = list(load = list())),
                   getCritVal(n = 30L, filter = testfilter, stat = teststat))
})

test_that("nq is tested and works for given stat", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_error(getCritVal(n = 30L, nq = "s", stat = teststat,
                          filter = testfilter, options = list(load = list())))
  expect_error(getCritVal(n = 30L, nq = c(1L, 2L), stat = teststat,
                          filter = testfilter, options = list(load = list())))
  expect_error(getCritVal(n = 30L, nq = NA, stat = teststat,
                          filter = testfilter, options = list(load = list())))
  expect_error(getCritVal(n = 30L, nq = Inf, stat = teststat,
                          filter = testfilter, options = list(load = list())))
  expect_error(getCritVal(n = 30L, nq = NULL, stat = teststat,
                          filter = testfilter, options = list(load = list())))
  expect_error(getCritVal(n = 30L, nq = 8L, stat = teststat,
                          filter = testfilter, options = list(load = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100, options = list(load = list())),
                   getCritVal(n = 30L, nq = 30L, filter = testfilter, r = 100, options = list(load = list())))
  expect_identical(getCritVal(n = 30L, nq = 100, filter = testfilter, r = 100, options = list(load = list())),
                   getCritVal(n = 30L, nq = 100L, filter = testfilter, r = 100, options = list(load = list())))
  expect_identical(getCritVal(n = 30L, nq = 30.5, filter = testfilter, r = 100, options = list(load = list())),
                   getCritVal(n = 30L, nq = 30L, filter = testfilter, r = 100, options = list(load = list())))
})

test_that("options is tested", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  
  expect_error(getCritVal(n = 30L, filter = testfilter, simulation = "vector"))
  expect_error(getCritVal(n = 30L, filter = testfilter, options = "vector"))
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(a = "vector")))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(simulation = c("vector", "matrix"), save = list(), load = list())))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(simulation = "vecto", save = list(), load = list())))
  
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(load = "test")))
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(load = list(test = "test"))))
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(load = list(RDSfile = rep(testfile, 2)))))
  
  
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(save = "test")))
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(save = list(test = "test"))))
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  expect_error(getCritVal(n = 30L, filter = testfilter, options = list(save = list(RDSfile = rep(testfile, 3)))))
  
  testvariable <- "test"
  testStepR <- new.env()
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(variable = 10), envir = testStepR)))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(variable = rep(testvariable, 3)), envir = testStepR)))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(variable = testvariable), envir = "testStepR")))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(variable = testvariable), envir = c(testStepR, .GlobalEnv))))

  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(workspace = "vecto"), envir = testStepR)))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(workspace = c("vector", "vecto")), envir = testStepR)))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(load = list(workspace = "vecto"), envir = testStepR)))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(load = list(workspace = c("vector", "vecto")), envir = testStepR)))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(fileSystem = "vecto"), dirs = "testStepR")))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(fileSystem = c("vector", "vecto")), dirs = "testStepR")))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(load = list(fileSystem = "vecto"), dirs = "testStepR")))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(load = list(fileSystem = c("vector", "vecto")), dirs = "testStepR")))
  
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(fileSystem = "vector"), dirs = c("testStepR", "test"))))
  expect_error(getCritVal(n = 30L, filter = testfilter,
                          options = list(save = list(fileSystem = "vector"), dirs = 10)))
})

test_that("stat is simulated correctly", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, filter = testfilter, r = 100, options = list(load = list())))
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, filter = testfilter, r = 100, nq = 35L,
                              options = list(simulation = "vector", load = list())))
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, filter = testfilter, r = 100,
                              options = list(simulation = "vectorIncreased", load = list())))
  expect_identical(getCritVal(n = 30L, stat = teststat, filter = testfilter),
                   getCritVal(n = 30L, filter = testfilter, r = 100,
                              options = list(simulation = "matrix", load = list())))
  expect_identical(getCritVal(n = 28L, stat = teststat, filter = testfilter),
                   getCritVal(n = 28L, filter = testfilter, r = 100, nq = 30L,
                              options = list(simulation = "vectorIncreased", load = list())))
})

test_that("stat is saved and loaded correctly", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  testfile <- tempfile(pattern = "file", tmpdir = tempdir(), fileext = ".RDS")
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(RDSfile = testfile), load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(readRDS(testfile), teststat)
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(save = list(), load = list(RDSfile = testfile))),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  unlink(testfile)
  
  testvariable <- "test"
  testStepR <- new.env()
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(variable = testvariable), envir = testStepR,
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(get("test", envir = testStepR), teststat)
  remove(test, envir = testStepR)
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(workspace = "vector"), envir = testStepR,
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(workspace = "vector"), envir = testStepR,
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(workspace = "vectorIncreased"), envir = testStepR,
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  remove(critValStepRTab, envir = testStepR)
  
  expect_identical(getCritVal(n = 28L, filter = testfilter, r = 100L, nq = 30L,
                              options = list(save = list(workspace = "vectorIncreased"), envir = testStepR,
                                             load = list())),
                   getCritVal(n = 28L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  expect_identical(getCritVal(n = 28L, filter = testfilter, r = 50L, nq = 30L,
                              options = list(load = list(workspace = "vectorIncreased"), envir = testStepR,
                                             save = list())),
                   getCritVal(n = 28L, stat = teststat, filter = testfilter, options = list(save = list())))
  remove(critValStepRTab, envir = testStepR)
  
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(workspace = "vector"), envir = testStepR,
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  teststat200 <- monteCarloSimulation(n = 30, r = 200, family = "mDependentPS",
                                      filter = testfilter, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 200L,
                              options = list(save = list(workspace = "vector"), envir = testStepR,
                                             load = list("vector"))),
                   getCritVal(n = 30L, stat = teststat200, filter = testfilter, options = list(save = list())))
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(workspace = "vector"), envir = testStepR,
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat[[1]], teststat200)
  expect_identical(length(get("critValStepRTab", envir = testStepR, inherits = FALSE)$stat), 1L)
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(workspace = "vector"), envir = testStepR,
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat200, filter = testfilter, options = list(save = list())))
  remove(critValStepRTab, envir = testStepR)
  
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(fileSystem = "vector"), dirs = "testStepR",
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(fileSystem = "vector"), dirs = "testStepR",
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(fileSystem = "vectorIncreased"), dirs = "testStepR",
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  expect_identical(getCritVal(n = 28L, filter = testfilter, r = 100L, nq = 30L,
                              options = list(save = list(fileSystem = "vectorIncreased"), dirs = "testStepR",
                                             load = list())),
                   getCritVal(n = 28L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  expect_identical(getCritVal(n = 28L, filter = testfilter, r = 50L, nq = 30L,
                              options = list(load = list(fileSystem = "vectorIncreased"), dirs = "testStepR",
                                             save = list())),
                   getCritVal(n = 28L, stat = teststat, filter = testfilter, options = list(save = list())))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(fileSystem = "vector"), dirs = "testStepR",
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  teststat200 <- monteCarloSimulation(n = 30, r = 200, family = "mDependentPS",
                                      filter = testfilter, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 200L,
                              options = list(save = list(fileSystem = "vector"), dirs = "testStepR",
                                             load = list("vector"))),
                   getCritVal(n = 30L, stat = teststat200, filter = testfilter, options = list(save = list())))
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 100L,
                              options = list(save = list(fileSystem = "vector"), dirs = "testStepR",
                                             load = list())),
                   getCritVal(n = 30L, stat = teststat, filter = testfilter, options = list(save = list())))
  expect_identical(R.cache::loadCache(attr(teststat, "keyList"), dirs = "testStepR"), teststat200)
  expect_identical(length(list.files(file.path(R.cache::getCacheRootPath(), "testStepR"))), 1L)
  
  expect_identical(getCritVal(n = 30L, filter = testfilter, r = 50L,
                              options = list(load = list(fileSystem = "vector"), dirs = "testStepR",
                                             save = list())),
                   getCritVal(n = 30L, stat = teststat200, filter = testfilter, options = list(save = list())))
  unlink(file.path(R.cache::getCacheRootPath(), "testStepR"), recursive = TRUE)
  
  
  testfilter1 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 8)
  teststat1 <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                    filter = testfilter1, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter1, r = 100L,
                              options = list(save = list(RDSfile = testfile, variable = testvariable,
                                                         workspace = c("vector", "vectorIncreased")),
                                             load = list(), envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat1, filter = testfilter1, options = list(save = list())))
  expect_identical(readRDS(testfile), teststat1)
  expect_identical(get("test", envir = testStepR), teststat1)
  remove(test, envir = testStepR)
  
  testfilter2 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.2), len = 8)
  teststat2 <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                    filter = testfilter2, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter2, r = 100L,
                              options = list(envir = testStepR, dirs = "testStepR", 
                              save = list(fileSystem = "vector", workspace = "vector"))),
                   getCritVal(n = 30L, stat = teststat2, filter = testfilter2, options = list(save = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter1, r = 200L,
                              options = list(load = list(RDSfile = testfile), save = list(fileSystem = "vector"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat1, filter = testfilter1, options = list(save = list())))
  unlink(testfile)
  
  testfilter3 <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat3 <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                    filter = testfilter3, output = "maximum")
  expect_identical(getCritVal(n = 28L, filter = testfilter3, r = 100L, nq = 30L,
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 28L, stat = teststat3, filter = testfilter3, options = list(save = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter3, r = 50L, nq = 32L,
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat3, filter = testfilter3, options = list(save = list())))
  
  teststat4 <- monteCarloSimulation(n = 32, r = 100, family = "mDependentPS", lengths = 2^(0:4),
                                    filter = testfilter3, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter3, r = 100L, nq = 32L,
                              options = list(save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             load = list(workspace = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat4, filter = testfilter3, options = list(save = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter3, r = 100L, nq = 32L,
                              options = list(simulation = "vector",
                                             save = list(workspace = "vector", fileSystem = "vectorIncreased"),
                                             load = list(workspace = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat3, filter = testfilter3, options = list(save = list())))
  
  teststat5 <- monteCarloSimulation(n = 32, r = 200, family = "mDependentPS", lengths = 2^(0:4),
                                    filter = testfilter3, output = "maximum")
  expect_identical(getCritVal(n = 30L, filter = testfilter3, r = 200L, nq = 32L,
                              options = list(save = list(workspace = "vectorIncreased",
                                                         fileSystem = "vector"),
                                             load = list(workspace = "vectorIncreased",
                                                         fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat5, filter = testfilter3, options = list(save = list())))
  
  expect_identical(getCritVal(n = 30L, filter = testfilter3, r = 100L, nq = 32L,
                              options = list(save = list(workspace = "vectorIncreased",
                                                         fileSystem = "vector"),
                                             load = list(workspace = "vectorIncreased",
                                                         fileSystem = "vectorIncreased"),
                                             envir = testStepR, dirs = "testStepR")),
                   getCritVal(n = 30L, stat = teststat5, filter = testfilter3, options = list(save = list())))

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

test_that("messages is tested and works", {
  testfilter <- lowpassFilter(param = list(pole = 4L, cutoff = 0.1), len = 11)
  teststat <- monteCarloSimulation(n = 30, r = 100, family = "mDependentPS",
                                   filter = testfilter, output = "maximum")
  
  expect_error(getCritVal(n = 30L, filter = testfilter, messages = "s",
                          r = 100, options = list(load = list())))
  expect_error(getCritVal(n = 30L, filter = testfilter, messages = 0L,
                          r = 100, options = list(load = list())))
  expect_error(getCritVal(n = 30L, filter = testfilter, messages = c(10L, 20L),
                          r = 100, options = list(load = list())))
  
  expect_identical(suppressMessages(getCritVal(n = 30L, filter = testfilter, messages = 10L,
                                               r = 100, options = list(load = list()))),
                   getCritVal(n = 30L, filter = testfilter, r = 100, options = list(load = list())))
  
  expect_identical(suppressMessages(getCritVal(n = 30L, filter = testfilter, messages = 10.5,
                                               r = 100, options = list(load = list()))),
                   getCritVal(n = 30L, filter = testfilter, r = 100, options = list(load = list())))
})
