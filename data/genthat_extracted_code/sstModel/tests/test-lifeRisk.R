# unit tests for S3 class lifeRisk
context("lifeRisk S3 class")

# checking constructor
test_that("lifeRisk: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(lifeRisk(corr.mat = matrix(c(1,0,0,1), ncol = 2)))
  expect_error(lifeRisk(quantile = c(0.5, 0.5)))

  # type checks
  expect_error(lifeRisk(corr.mat = list(1, 2, 3),
                        quantile = rep(0.5, 3)),
               "types")
  expect_error(lifeRisk(corr.mat = data.frame(x = c(1, 2)),
                        quantile = rep(0.5, 3)),
               "types")
  expect_error(lifeRisk(corr.mat = matrix(c("a","b","c","d"), ncol = 2),
                        quantile = rep(0.5, 3)),
               "types")
  expect_error(lifeRisk(corr.mat = matrix(c(1,0,0,1), ncol = 2),
                        quantile = list(0.5, 0.5, 0.5)),
               "types")
  expect_error(lifeRisk(corr.mat = matrix(c(1,0,0,1), ncol = 2),
                        quantile = c("a", "b", "c")),
               "types")

  # dimensions checks
  expect_error(lifeRisk(corr.mat = matrix(numeric(), ncol = 0),
                        quantile = rep(0.5, 3)),
               "Empty")
  expect_error(lifeRisk(corr.mat = matrix(c(1,0,0,1,1,0), ncol = 3),
                          quantile = rep(0.5, 3)),
               "square")
  expect_error(lifeRisk(corr.mat = matrix(c(1,0,0,1), ncol = 2),
                        quantile = rep(0.5, 3)),
               "length")

  # name checks
  mat <- matrix(c(1,0,0,1), ncol = 2)
  quantile <- rep(0.5, 2)
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "names")

  colnames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "names")

  colnames(mat) <- NULL
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "names")

  colnames(mat) <- c("storno", "")
  rownames(mat) <- NULL
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "names")

  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("invalidity", "storno")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "names")

  # correlation matrix checks
  mat <- matrix(c(2,0,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "correlation matrix")

  mat <- matrix(c(1,NA,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "correlation matrix")

  mat <- matrix(c(1,NaN,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "correlation matrix")

  mat <- matrix(c(1,Inf,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "correlation matrix")

  mat <- matrix(c(1,0,1,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(lifeRisk(corr.mat = mat,
                        quantile = quantile),
               "correlation matrix")

})

test_that("lifeRisk: internal structure is ok", {

  # a valid data.frame object
  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  d <- lifeRisk(corr.mat  = M,
                quantile = c(0.995, 0.995))

  # checking internal representation of attributes
  expect_equal(length(d), 2)
  expect_equal(is.matrix(d$corr.mat), TRUE)
  expect_equal(names(d), c("corr.mat", "quantile"))

  # checking class membership
  expect_equal(is.lifeRisk(d), TRUE)
  expect_equal(is.insuranceRisk(d), TRUE)
  expect_equal(is.risk(d), TRUE)
  expect_equal(is.list(d), TRUE)

})

test_that("lifeRisk: get methods are ok", {

  # a valid data.frame object
  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  d <- lifeRisk(corr.mat  = M,
                quantile = c(0.995, 0.995))

  expect_equal(getLifeId(object = d, name = c("invalidity")),
               2)

  expect_equal(getLifeQuantile(object = d, name = c("invalidity")),
               0.995)
})


test_that("lifeRisk: standard methods are ok", {

  # a valid data.frame object
  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  d <- lifeRisk(corr.mat  = M,
                quantile = c(0.995, 0.995))

  # format
  expect_equal(class(format(d)),
               "character")

  # summary
  expect_equal(class(summary(d)),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(d)),
               "NULL")

})

