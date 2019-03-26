# unit tests for S3 class asset
context("asset: base")

test_that("asset: checks at construction are ok", {

  ## error when some parameters are missing
  expect_error(asset(type = "hedgeFund"))
  expect_error(asset(value = 10))
  expect_error(asset(currency = "CHF"))

  ## type checks
  expect_error(asset(type = 1, currency = "CHF", value = 10),
               "Invalid types")
  expect_error(asset(type = list(), currency = "CHF", value = 10),
               "Invalid types")
  expect_error(asset(type = NULL, currency = "CHF", value = 10),
               "Invalid types")
  expect_error(asset(type = c(1, 2), currency = "CHF", value = 10),
               "Invalid types")

  expect_error(asset(type = "equity", currency = "CHF", value = "a"),
               "Invalid types")
  expect_error(asset(type = "equity", currency = "CHF", value = list()),
               "Invalid types")
  expect_error(asset(type = "equity", currency = "CHF", value = NULL),
               "Invalid types")
  expect_error(asset(type = "equity", currency = "CHF", value = c("a", "b")),
               "Invalid types")

  expect_error(asset(type = "equity", currency = 1, value = 10),
               "Invalid types")
  expect_error(asset(type = "equity", currency = list(), value = 10),
               "Invalid types")
  expect_error(asset(type = "equity", currency = NULL, value = 10),
               "Invalid types")
  expect_error(asset(type = "equity", currency = c(1, 2), value = 10),
               "Invalid types")

  ## dimension checks
  expect_error(asset(type = c("hedgeFund", "equity"), currency = "CHF", value = 1),
               "dimensions")
  expect_error(asset(type = "hedgeFund", currency = c("CHD", "USD"), value = 1),
               "dimensions")
  expect_error(asset(type = "hedgeFund", currency = "CHF", value = numeric()),
               "dimensions")

  ## input values checks
  expect_error(asset(type = "hedgeFund", currency = "CHF", value = NaN),
               "Missing")
  expect_error(asset(type = "hedgeFund", currency = as.character(NA), value = 1),
               "Missing")
  expect_error(asset(type = as.character(NA), currency = "CHF", value = 1),
               "Missing")

  ## reserved values checks
  expect_error(asset(type = "currency", currency = "CHF", value = 1),
               "Reserved")
  expect_error(asset(type = "rate", currency = "CHF", value = 1),
               "Reserved")
  expect_error(asset(type = "pcRate", currency = "CHF", value = 1),
               "Reserved")
  expect_error(asset(type = "spread", currency = "CHF", value = 1),
               "Reserved")

  ## value checks
  expect_error(asset(type = "hedgeFund", currency = "CHF", value = Inf),
               "finite")
  expect_error(asset(type = "hedgeFund", currency = "CHF", value = -Inf),
               "finite")

  expect_warning(asset(type = "hedgeFund", currency = "CHF", value = 0),
		             "efficiency")

})

test_that("asset: internal structure is ok", {

  ## define an asset
  a <- asset(type = "hedgeFund", currency = "CHF", value = 10)

  ## checking internal representation of attributes
  expect_equal(length(a), 3)
  expect_equal(names(a), c("type", "currency", "value"))

  ## checking class membership
  expect_equal(is.asset(a), TRUE)
  expect_equal(is.marketItem(a), TRUE)
  expect_equal(is.item(a), TRUE)
  expect_equal(is.list(a), TRUE)

})

test_that("asset: check method is ok", {

  ## a failure of checks on asset
  cov.mat <- diag(1)
  name <- c("equityCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"))
  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.asset(asset(type     = "equity",
                                currency  = "EUR",
                                value     = 10),
                           mr))
  expect_false(check.asset(asset(type     = "hedgeFund",
                                 currency  = "CHF",
                                 value     = 10),
                           mr))

  # a success of checks on asset
  cov.mat <- diag(rep(4, 2))
  name <- c("equityCHF", "EURCHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 0.5))
  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.asset(asset(type     = "equity",
                                currency = "EUR",
                                value    = 10),
                          mr))
  expect_true(check.asset(asset(type     = "equity",
                                currency = "CHF",
                                value    = 10),
                          mr))

  expect_error(check.asset(asset(type     = "equity",
                                 currency = "CHF",
                                 value    = 10), list(1, 2, 3)),
                           "Invalid type")

})


test_that("asset: standard methods are ok", {

  # format
  expect_equal(class(format(asset(type = "equity", currency = "CHF", value = 10))),
               "character")

  # summary
  expect_equal(class(summary(asset(type = "equity", currency = "CHF", value = 10))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(asset(type = "equity", currency = "CHF", value = 10))),
               "NULL")

})

