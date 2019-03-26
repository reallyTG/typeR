# unit tests for S3 class healthRisk
context("healthRisk S3 class")

# checking constructor
test_that("healthRisk: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(healthRisk())

  # type checks
  expect_error(healthRisk(corr.mat = list(1, 2, 3)))
  expect_error(healthRisk(corr.mat = data.frame(x = c(1, 2))))
  expect_error(healthRisk(corr.mat = matrix(c("a","b","c","d"), ncol = 2)))

  # dimensions checks
  expect_error(healthRisk(corr.mat = matrix(numeric(), ncol = 0)),
               "Empty")
  expect_error(healthRisk(corr.mat = matrix(c(1,0,0,1,1,0), ncol = 3)),
               "square")

  # name checks
  mat <- matrix(c(1,0,0,1), ncol = 2)
  expect_error(healthRisk(corr.mat = mat),
               "names")

  colnames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "names")

  colnames(mat) <- NULL
  rownames(mat) <-c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "names")

  colnames(mat) <- c("storno", "")
  rownames(mat) <- NULL
  expect_error(healthRisk(corr.mat = mat),
               "names")

  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("invalidity", "storno")
  expect_error(healthRisk(corr.mat = mat),
               "names")

  # correlation matrix checks
  mat <- matrix(c(2,0,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "correlation matrix")

  mat <- matrix(c(1,NA,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "correlation matrix")

  mat <- matrix(c(1,NaN,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "correlation matrix")

  mat <- matrix(c(1,Inf,0,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "correlation matrix")

  mat <- matrix(c(1,0,1,1), ncol = 2)
  colnames(mat) <- c("storno", "invalidity")
  rownames(mat) <- c("storno", "invalidity")
  expect_error(healthRisk(corr.mat = mat),
               "correlation matrix")

})

test_that("healthRisk: internal structure is ok", {

  # a valid data.frame object
  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  d <- healthRisk(corr.mat  = M)

  # checking internal representation of attributes
  expect_equal(is.matrix(d), TRUE)

  # checking class membership
  expect_equal(is.healthRisk(d), TRUE)
  expect_equal(is.insuranceRisk(d), TRUE)
  expect_equal(is.risk(d), TRUE)

})

test_that("lifeRisk: standard methods are ok", {

  # a valid data.frame object
  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  d <- healthRisk(corr.mat  = M)

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
