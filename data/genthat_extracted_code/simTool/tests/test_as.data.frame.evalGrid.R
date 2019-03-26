testthat::context("test_as.data.frame.evalGrid.R will be removed in the future")

# Q&D way to correct for the deprecate warning in as.data.frame.evalGrid. 
# all this will be removed in the next version
suppressWarnings({
  set.seed(20170728)
  dg <- expandGrid(fun = c("runif"), n = 1:4)
  pg <- expandGrid(proc = c("mean"))
  eg <- evalGrids(dg, pg)
  df <- as.data.frame(eg)
  tmp <- c(
    eg$simulation[[1]][[1]]$results[[1]],
    eg$simulation[[2]][[1]]$results[[1]],
    eg$simulation[[3]][[1]]$results[[1]],
    eg$simulation[[4]][[1]]$results[[1]]
  )
  
  test_that(
    "Results are stored in the correct place",
    expect_identical(df$V1, tmp)
  )
  
  test_that("Deprecated parameters value.fun, post.proc from as.data.frame generate an error", {
    expect_error(suppressWarnings(as.data.frame(eg, value.fun = identity)))
    expect_error(suppressWarnings(as.data.frame(eg, post.proc = mean)))
  })
  
  
  
  f <- function(x) x <= 0.5
  result <-
    structure(list(
      i = 1:4, j = c(1L, 1L, 1L, 1L), fun = c("runif", "runif", "runif", "runif"),
      n = 1:4, proc = c("mean", "mean", "mean", "mean"),
      value = structure(c(1L, 1L, 1L, 1L), .Label = "(all)", class = "factor"),
      V1_mean = c(0, 1, 1, 0), V1_median = c(0, 1, 1, 0)
    ),
    .Names = c("i", "j", "fun", "n", "proc", "value", "V1_mean", "V1_median"),
    row.names = c(NA, -4L), class = "data.frame"
    )
  
  test_that(
    "summary.fun can handel logical data",
    expect_identical(suppressWarnings(as.data.frame(eg, convert.result.fun = f, summary.fun = c(mean, median))), result)
  )
  
  postVec <- function(results) summary(results)
  
  result <- structure(list(
    i = 1:4, j = c(1L, 1L, 1L, 1L), fun = c("runif", "runif", "runif", "runif"),
    n = 1:4, proc = c("mean", "mean", "mean", "mean"),
    value = structure(c(1L, 1L, 1L, 1L), .Label = "(all)", class = "factor"),
    V1_Mode = structure(c(1L, 1L, 1L, 1L), .Label = "logical", class = "factor"),
    V1_FALSE. = structure(c(1L, NA, NA, 1L), .Label = "1", class = "factor"),
    V1_TRUE. = structure(c(NA, 1L, 1L, NA), .Label = "1", class = "factor")
  ),
  .Names = c("i", "j", "fun", "n", "proc", "value", "V1_Mode", "V1_FALSE.", "V1_TRUE."),
  row.names = c(NA, -4L), class = "data.frame"
  )
  
  test_that(
    "summary.fun can handel logical data and returning vector",
    expect_identical(suppressWarnings(as.data.frame(eg, convert.result.fun = f, summary.fun = postVec)), result)
  )
  
  
  f <- function(x) c(length(x), min = min(x), max(x))
  pg <- expandGrid(proc = c("f"))
  # must set environment, otherwise evalGrids will not find the function f()
  eg <- evalGrids(dg, pg, envir = environment())
  df <- as.data.frame(eg)
  
  test_that(
    "Variable names are introduced, where the analyzing function does not provide names",
    expect_identical(names(df), c("i", "j", "fun", "n", "proc", "replication", "V1", "min", "V2"))
  )
  
  
  
  # -------------------------------------------------------
  
  
  genRegData <- function() {
    data.frame(
      x = 1:10,
      y = rnorm(10, mean = 1:10)
    )
  }
  
  
  set.seed(19032013)
  eg <- evalGrids(
    expandGrid(fun = "genRegData"),
    expandGrid(proc = "lm", formula = c("y ~ x", "y ~ x + I(x^2)")),
    replications = 10, envir = environment()
  )
  
  lm2df <- function(lm.object) {
    ret <- coef(summary(lm.object))
    data.frame(covariable = rownames(ret), ret, check.names = FALSE)
  }
  df <- as.data.frame(eg, convert.result.fun = lm2df)
  
  require(plyr)
  tmp <- ldply(eg$simulation[[1]], function(v) rbind(lm2df(v$results[[1]]), lm2df(v$results[[2]])))
  tmp <- arrange(tmp, Estimate)
  df <- arrange(df, Estimate)
  
  test_that(
    "Check that results can be converted to a data.frame",
    expect_identical(df[, -(1:6)], tmp)
  )
  
  
  df <- as.data.frame(eg, convert.result.fun = lm2df, summary.fun = mean)
  require(reshape)
  tmp <- ldply(eg$simulation[[1]], function(v) rbind(lm2df(v$results[[1]])))
  mtmp <- melt(tmp, id = 1)
  tmp1 <- cast(mtmp, ... ~ variable, mean)
  
  tmp <- ldply(eg$simulation[[1]], function(v) rbind(lm2df(v$results[[2]])))
  mtmp <- melt(tmp, id = 1)
  tmp2 <- cast(mtmp, ... ~ variable, mean)
  tmp <- rbind(tmp1, tmp2)
  test_that(
    "Check that results can be converted to a data.frame and summarized over the replications",
    expect_equivalent(df[, -(1:5)], tmp)
  )
  
  df <- suppressWarnings(as.data.frame(eg, convert.result.fun = lm2df, summary.fun = c(mean, sd)))
  
  tmp <- ldply(eg$simulation[[1]], function(v) rbind(lm2df(v$results[[1]])))
  mtmp <- melt(tmp, id = 1)
  tmp1 <- cast(mtmp, ... ~ variable, c(mean, sd))
  
  tmp <- ldply(eg$simulation[[1]], function(v) rbind(lm2df(v$results[[2]])))
  mtmp <- melt(tmp, id = 1)
  tmp2 <- cast(mtmp, ... ~ variable, c(mean, sd))
  
  tmp <- rbind(tmp1, tmp2)
  test_that(
    "Check that results can be converted to a data.frame and summarized (vector) over the replications",
    expect_equivalent(df[, -(1:5)], tmp)
  )
  
  
  require(plyr)
  genData <- function(N) {
    N
  }
  brichtAb <- function(data) {
    if (data == 3) {
      stop("Bewusster Error: fallBackTest")
    }
    1
  }
  
  dg <- expandGrid(fun = c("genData"), N = 1:5)
  pg <- expandGrid(proc = c("brichtAb"))
  if (is.element("RUnitFallBack.Rdata", dir("./tests/testthat/"))) {
    file.remove("./tests/testthat/RUnitFallBack.Rdata")
  }
  
  test_that(
    "Create an error to check afterwards that the results so far were stored",
    expect_error(eg <- suppressWarnings(evalGrids(dg, pg, replications = 4, progress = TRUE, fallback = "RUnitFallBack", envir = environment())))
  )
  rm(list = ls())
  
  load("RUnitFallBack.Rdata")
  df <- as.data.frame(fallBackObj)
  
  # dput
  df2 <- structure(list(
    i = c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 3L, 4L, 5L),
    j = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
    fun = c(
      "genData", "genData", "genData", "genData",
      "genData", "genData", "genData", "genData", "genData", "genData", "genData"
    ),
    N = c(1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 3L, 4L, 5L),
    proc = c(
      "brichtAb", "brichtAb", "brichtAb", "brichtAb",
      "brichtAb", "brichtAb", "brichtAb", "brichtAb",
      "brichtAb", "brichtAb", "brichtAb"
    ),
    replication = structure(c(1L, 2L, 3L, 4L, 1L, 2L, 3L, 4L, NA, NA, NA),
                            .Label = c("1", "2", "3", "4"), class = "factor"
    ),
    V1 = c(1, 1, 1, 1, 1, 1, 1, 1, NA, NA, NA),
    .evalGridComment = structure(c(NA, NA, NA, NA, NA, NA, NA, NA, 1L, 1L, 1L),
                                 .Label = "Results missing", class = "factor"
    )
  ),
  .Names = c("i", "j", "fun", "N", "proc", "replication", "V1", ".evalGridComment"),
  row.names = c(NA, -11L), class = "data.frame"
  )
  
  test_that(
    "Fallback object was correctly stored to hard drive",
    expect_identical(df, df2)
  )
})
