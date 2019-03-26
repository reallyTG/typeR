# unit tests for S3 class assetForward
context("assetForward: base")

test_that("assetForward: checks at construction are ok", {

  ## error when some parameters are missing
  expect_error(assetForward(type = "equity"))
  expect_error(assetForward(currency = "CHF"))
  expect_error(assetForward(time = 1))
  expect_error(assetForward(exposure = 100))
  expect_error(assetForward(price = 10))
  expect_error(assetForward(position = "short"))

  # type checks
  expect_error(assetForward(type = list(), currency = "USD", time="1",
                            exposure=100, price=50, position="short"),
               "types")
  expect_error(assetForward(type="hedgeFund", currency = list("a"), time="1",
                            exposure=100, price=50, position="short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = list(1),
                            exposure = 100, price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1,
                            exposure = list(), price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1,
                            exposure = 100, price = list(NA,3), position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1,
                            exposure = 100, price = 50, position = list(character())),
               "types")

  expect_error(assetForward(type = 2, currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = 1, time = "1",
                            exposure = 100, price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = "t", price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = factor(1), price = 50, position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = as.character(NA), position = "short"),
               "types")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = numeric()),
               "types")

  # dimensions checks
  expect_error(assetForward(type = c("a", "b"), currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "dimensions")
  expect_error(assetForward(type = "hedgeFund", currency = rep("CHF", 9), time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "dimensions")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = c(1L, 2L),
                            exposure = 100, price = 50, position = "short"),
               "dimensions")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = c(230, NA), price = 50, position = "short"),
               "dimensions")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = as.numeric(c(NA, NA)), position = "short"),
               "dimensions")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = character()),
               "dimensions")

  # reserved values checks
  expect_error(assetForward(type = "currency", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Reserved")
  expect_error(assetForward(type = "rate", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Reserved")
  expect_error(assetForward(type = "pcRate", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Reserved")
  expect_error(assetForward(type = "spread", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Reserved")

  # input values checks
  expect_error(assetForward(type = as.character(NA), currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Missing")
  expect_error(assetForward(type = "hedgeFund", currency = as.character(NA), time = 1L,
                            exposure = 100, price = 50, position = "short"),
               "Missing")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = as.integer(NA),
                            exposure = 100, price = 50, position = "short"),
               "Missing")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = as.numeric(NA), price = 50, position = "short"),
               "Missing")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = as.numeric(NA), position = "short"),
               "Missing")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = as.character(NA)),
               "Missing")

  # exposure, price, time, position checks
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = Inf,
                            exposure = 100, price = 50, position = "short"),
               "finite")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = Inf, position = "short"),
               "finite")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
             exposure = Inf, price = 50, position = "short"),
               "finite")

  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = -1L,
                            exposure = 100, price = 50, position = "short"),
               "positive")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = -100, price = 50, position = "short"),
               "positive")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = -50, position = "short"),
               "positive")
  expect_warning(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 0, price = 50, position = "short"),
               "efficiency")

  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1.2,
                            exposure = 100, price = 50, position = "short"),
               "time")
  expect_error(assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                            exposure = 100, price = 50, position = "asset"),
               "position")

})

test_that("assetForward: internal structure is ok", {

  # define a assetForward
  aF <- assetForward(type = "hedgeFund", currency = "USD", time = 1L,
                      exposure = 100, price = 50, position = "short")

  # checking internal representation of attributes
  expect_equal(length(aF), 6)
  expect_equal(names(aF), c("type", "currency",
                             "time", "exposure", "price",
                             "position"))
  expect_equal(class(aF$time), "integer")

  # checking class membership
  expect_equal(is.assetForward(aF), TRUE)
  expect_equal(is.marketItem(aF), TRUE)
  expect_equal(is.item(aF), TRUE)
  expect_equal(is.list(aF), TRUE)

})

test_that("assetForward: check method is ok", {

  # a first example
  cov.mat <- diag(rep(4, 3))
  name <- c("2YCHF", "equityCHF", "EURCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.75),
                                currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 0.5))
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

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.assetForward(assetForward(type      = "equity",
                                              currency  = "CHF",
                                              time      = 1L,
                                              exposure  = 10,
                                              price     = 100,
                                              position  = "long"),
                                 mr))

  expect_true(check.assetForward(assetForward(type      = "equity",
                                              currency  = "EUR",
                                              time      = 1L,
                                              exposure  = 10,
                                              price     = 100,
                                              position  = "long"),
                                 mr))

  expect_false(check.assetForward(assetForward(type      = "equity",
                                               currency  = "JPY",
                                               time      = 1L,
                                               exposure  = 10,
                                               price     = 100,
                                               position  = "long"),
                                  mr))

  expect_false(check.assetForward(assetForward(type      = "equity",
                                               currency  = "EUR",
                                               time      = 2L,
                                               exposure  = 10,
                                               price     = 100,
                                               position  = "long"),
                                  mr))

  mapping.time <- data.frame(time = 1L, mapping = "l", stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.assetForward(assetForward(type      = "equity",
                                               currency  = "EUR",
                                               time      = 1L,
                                               exposure  = 10,
                                               price     = 100,
                                               position  = "long"),
                                  mr))

  expect_error(check.assetForward(assetForward(type      = "equity",
                                               currency  = "EUR",
                                               time      = 1L,
                                               exposure  = 10,
                                               price     = 100,
                                               position  = "long"),
                              list(1, 2, 3)),
               "Invalid type")


})

test_that("assetForward: standard methods are ok", {

  # format
  expect_equal(class(format(assetForward(type      = "equity",
                                         currency  = "EUR",
                                         time      = 1L,
                                         exposure  = 10,
                                         price     = 100,
                                         position  = "long"))),
               "character")

  # summary
  expect_equal(class(summary(assetForward(type      = "equity",
                                          currency  = "EUR",
                                          time      = 1L,
                                          exposure  = 10,
                                          price     = 100,
                                          position  = "long"))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(assetForward(type      = "equity",
                                        currency  = "EUR",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"))),
               "NULL")

})
