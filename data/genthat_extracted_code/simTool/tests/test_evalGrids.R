testthat::context("test_evalGrids.R will be removed in the future")

suppressWarnings({
  require(reshape)
  set.seed(15032013)
  dg <- expandGrid(fun = c("runif"), n = 1:4)
  eg <- evalGrids(dg)
  
  test_that(
    "Data grid that was used is preserved in the object returned by evalGrids",
    expect_true(all(eg$dataGrid == dg))
  )
  
  test_that(
    "Default function for analyzing the generated data is the function length",
    expect_identical(eg$procGrid, suppressWarnings(expandGrid(proc = "length")))
  )
  
  test_that("Data was generated and stored in simulation", {
    data <- unlist(sapply(eg$simulation, function(l) l[[1]]$data))
    expect_false(is.null(data))
    set.seed(15032013)
    expect_identical(data, runif(sum(1:4)))
  })
  
  test_that("Results were created and stored in simulation", {
    results <- unlist(sapply(eg$simulation, function(l) l[[1]]$results))
    expect_identical(results, 1:4)
  })
  
  # ---------------------------------------------
  
  set.seed(15032013)
  pg <- expandGrid(proc = c("mean"))
  eg <- evalGrids(dg, pg)
  
  lpkgN <- function(dummy, name) c(ret = any(loadedNamespaces() == name))
  pg <- expandGrid(proc = "lpkgN", name = c("boot", "MASS"))
  eg <- evalGrids(dg, pg, ncpus = 2, clusterLibraries = c("MASS", "boot"), rep = 2, envir = environment())
  
  test_that(
    "The cluster libraries are loaded on the cluster",
    expect_true(all(suppressWarnings(as.data.frame(eg)$ret)))
  )
  
  
  
  # ---------------------------------------------
  
  
  set.seed(23112013)
  dg <- expandGrid(proc = "runif", n = c(5, 100, 1000))
  pg <- expandGrid(fun = c("summary", "mean"))
  test_that(
    "Error if deprecated parameter post.proc is used",
    expect_error(suppressWarnings(evalGrids(dg, pg, post.proc = mean)))
  )
  
  
  # ---------------------------------------------
  
  
  eg <- evalGrids(dg, pg, replications = 10)
  df1 <- as.data.frame(eg, summary.fun = c(mean, sd))
  set.seed(23112013)
  eg <- evalGrids(dg, pg, replications = 10, summary.fun = c(mean, sd))
  df2 <- as.data.frame(eg)
  df2$replication <- NULL
  test_that(
    "summary.fun from as.data.frame and evalGrids return the same object",
    expect_identical(df1, df2)
  )
  
  
  # ---------------------------------------------
  
  set.seed(23112013)
  dg <- expandGrid(proc = "runif", n = c(5, 100, 1000))
  pg <- expandGrid(fun = c("summary", "mean"))
  eg <- evalGrids(dg, pg, replications = 10)
  postVec <- function(results) c(mean = mean(results), sd = sd(results))
  df3 <- as.data.frame(eg, summary.fun = postVec)
  test_that(
    "summary.fun from as.data.frame works with a function returning a vector",
    expect_identical(df3, df2)
  )
  
  
  
  # ---------------------------------------------
  
  set.seed(23112013)
  eg <- evalGrids(dg, pg, replications = 10, summary.fun = postVec)
  df2 <- as.data.frame(eg)
  df2$replication <- NULL
  test_that(
    "summary.fun from evalGrids works with a function returning a vector",
    expect_identical(df3, df2)
  )
})

