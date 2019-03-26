# unit tests for S3 class fxForward
context("fxForward: base")

test_that("fxForward: checks at construction are ok", {

  ## error when some parameters are missing
  expect_error(fxForward(domestic = "CHF"))
  expect_error(fxForward(foreign = "EUR"))
  expect_error(fxForward(time = 1))
  expect_error(fxForward(nominal = 100))
  expect_error(fxForward(rate = 1.05))
  expect_error(fxForward(position = "short"))

  # domestic checks
  expect_error(fxForward(domestic = list(), foreign = "USD", time="1",
                            nominal=100, rate=1.05, position="short"),
               "types")
  expect_error(fxForward(domestic="CHF", foreign = list("a"), time="1",
                            nominal=100, rate=1.05, position="short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = list(1),
                            nominal = 100, rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1,
                            nominal = list(), rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1,
                            nominal = 100, rate = list(NA,3), position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1,
                            nominal = 100, rate = 1.05, position = list(character())),
               "types")

  expect_error(fxForward(domestic = 2, foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = 1, time = "1",
                            nominal = 100, rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = "t", rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = factor(1), rate = 1.05, position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = as.character(NA), position = "short"),
               "types")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = numeric()),
               "types")

  # dimensions checks
  expect_error(fxForward(domestic = c("a", "b"), foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = "short"),
               "dimensions")
  expect_error(fxForward(domestic = "CHF", foreign = rep("CHF", 9), time = 1L,
                            nominal = 100, rate = 1.05, position = "short"),
               "dimensions")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = c(1L, 2L),
                            nominal = 100, rate = 1.05, position = "short"),
               "dimensions")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = c(230, NA), rate = 1.05, position = "short"),
               "dimensions")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = as.numeric(c(NA, NA)), position = "short"),
               "dimensions")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = character()),
               "dimensions")

  # input values checks
  expect_error(fxForward(domestic = as.character(NA), foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = "short"),
               "Missing")
  expect_error(fxForward(domestic = "CHF", foreign = as.character(NA), time = 1L,
                            nominal = 100, rate = 1.05, position = "short"),
               "Missing")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = as.integer(NA),
                            nominal = 100, rate = 1.05, position = "short"),
               "Missing")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = as.numeric(NA), rate = 1.05, position = "short"),
               "Missing")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = as.numeric(NA), position = "short"),
               "Missing")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = as.character(NA)),
               "Missing")

  # nominal, rate, time, position checks
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = Inf,
                            nominal = 100, rate = 1.05, position = "short"),
               "finite")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = Inf, position = "short"),
               "finite")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = Inf, rate = 1.05, position = "short"),
               "finite")

  expect_error(fxForward(domestic = "CHF", foreign = "CHF", time = 1L,
                         nominal = 100, rate = 1.05, position = "short"),
               "forward")

  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 0L,
                            nominal = 100, rate = 1.05, position = "short"),
               "positive")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = -100, rate = 1.05, position = "short"),
               "positive")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = 0, position = "short"),
               "positive")
  expect_warning(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                              nominal = 0, rate = 1.05, position = "short"),
                 "efficiency")

  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1.2,
                            nominal = 100, rate = 1.05, position = "short"),
               "time")
  expect_error(fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                            nominal = 100, rate = 1.05, position = "asset"),
               "position")

})

test_that("fxForward: check method is ok", {

  # define a fxForward
  fxF <- fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                  nominal = 100, rate = 1.1, position = "short")

  # checking internal representation of attributes
  expect_equal(length(fxF), 6)
  expect_equal(names(fxF), c("domestic", "foreign",
                            "time", "nominal", "rate",
                            "position"))
  expect_equal(class(fxF$time), "integer")

  # checking class membership
  expect_equal(is.fxForward(fxF), TRUE)
  expect_equal(is.marketItem(fxF), TRUE)
  expect_equal(is.item(fxF), TRUE)
  expect_equal(is.list(fxF), TRUE)

})

test_that("fxForward: check method is ok", {

  # a first example
  cov.mat <- diag(2, 2, 2) %*% diag(rep(1, 2)) %*% diag(2, 2, 2)
  name <- c("2YCHF", "EURCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.75),
                                currency(name = "EURCHF",
                                        from = "EUR",
                                        to   = "CHF"))

  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = c(1L, 1L),
                                            currency         = c("CHF", "EUR"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.fxForward(fxForward(domestic = "CHF",
                                        foreign  = "EUR",
                                        time     = 1L,
                                        nominal  = 10,
                                        rate     = 1.1,
                                        position = "long"),
                              mr))

  expect_false(check.fxForward(fxForward(domestic = "EUR",
                                         foreign  = "CHF",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))

  expect_false(check.fxForward(fxForward(domestic = "CHF",
                                         foreign  = "JPY",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))
  expect_false(check.fxForward(fxForward(domestic = "CHF",
                                         foreign  = "EUR",
                                         time     = 2L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))

  mapping.time <- data.frame(time = 1L, mapping = "l", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.fxForward(fxForward(domestic = "CHF",
                                         foreign  = "EUR",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))

  expect_false(check.fxForward(fxForward(domestic = "CHF",
                                         foreign  = "USD",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))

  expect_false(check.fxForward(fxForward(domestic = "JPY",
                                         foreign  = "USD",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               mr))

  expect_error(check.fxForward(fxForward(domestic = "CHF",
                                         foreign  = "EUR",
                                         time     = 1L,
                                         nominal  = 10,
                                         rate     = 1.1,
                                         position = "long"),
                               list(1, 2, 3)),
               "fxForward")
})

test_that("fxForward: standard methods are ok", {

  # format
  expect_equal(class(format(fxForward(domestic = "CHF",
                                      foreign  = "EUR",
                                      time     = 1L,
                                      nominal  = 10,
                                      rate     = 1.1,
                                      position = "long"))),
               "character")

  # summary
  expect_equal(class(summary(fxForward(domestic = "CHF",
                                       foreign  = "EUR",
                                       time     = 1L,
                                       nominal  = 10,
                                       rate     = 1.1,
                                       position = "long"))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "long"))),
               "NULL")

})

