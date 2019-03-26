# unit tests for S3 class delta
context("delta: base")

test_that("delta: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(delta(name = "equity"))
  expect_error(delta(currency = "CHF"))
  expect_error(delta(sensitivity = 1))

  # type checks
  expect_error(delta(name = list(),
                     currency = "CHF", sensitivity = 100),
               "types")
  expect_error(delta(name = "equity",
                     currency = list(NA), sensitivity = 100),
               "types")
  expect_error(delta(name = "equity",
                     currency = "CHF", sensitivity = list(1, 2)),
               "types")

  expect_error(delta(name = 1,
                     currency = "CHF", sensitivity = 100),
               "types")
  expect_error(delta(name = "equity",
                     currency = 3, sensitivity = 100),
               "types")
  expect_error(delta(name = "equity",
                     currency = "CHF", sensitivity = "a"),
               "types")

  # dimensions checks
  expect_error(delta(name = c("equityCHF", "equityEUR"),
                     currency = "CHF", sensitivity = 100),
               "length")
  expect_error(delta(name = rep("equity", 3),
                     currency = "CHF", sensitivity = rep(3, 3)),
               "length")
  expect_error(delta(name = c("equityCHF", "equityEUR"),
                     currency = c("CHF", "EUR"), sensitivity = c(1, 2, 3)),
               "length")

  # input values checks
  expect_error(delta(name             = c("equity", NA, "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Missing")
  expect_error(delta(name             = c("equity", "equityEUR", "EURCHF"),
                     currency         = c(NA, NA, "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Missing")
  expect_error(delta(name             = c("equity", "equityEUR", "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(NaN, 150, 130)),
               "Missing")

  # name checks
  expect_error(delta(name             = c("equity", "equity", "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Sensitivities")

  # sensitivities checks
  expect_error(delta(name             = c("equityCHF", "equityEUR", "EURCHF"),
                     currency         = c("CHF", "EUR", "EUR"),
                     sensitivity      = c(Inf, -Inf, 130)),
               "Sensitivities")

  expect_warning(delta(name             = c("equityEUR", "equityCHF", "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(100, 0, 130)),
               "efficiency")

})

test_that("delta: internal structure is ok", {

  # a valid data.frame object
  d <- delta(name             = c("equity", "2YCHF", "EURCHF"),
             currency         = c("EUR", "CHF", "EUR"),
             sensitivity      = c(100, 150, 130))

  # checking internal representation of attributes
  expect_equal(length(d), 3)
  expect_equal(names(d), c("name", "currency", "sensitivity"))

  # checking class membership
  expect_equal(is.delta(d), TRUE)
  expect_equal(is.marketItem(d), TRUE)
  expect_equal(is.item(d), TRUE)
  expect_equal(is.list(d), TRUE)
  expect_equal(is.data.frame(d), TRUE)

})

test_that("delta: check method is ok", {

  # a first example
  cov.mat <- diag(rep(4, 2))
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

  expect_false(check.delta(delta(name        = c("2YCHF", "EURCHF"),
                                currency    = c("CHF", "EUR"),
                                sensitivity = c(12, 25)),
                          mr))

  expect_false(check.delta(delta(name        = c("2YCHF", "EURCHF"),
                                 currency    = c("USD", "EUR"),
                                 sensitivity = c(12, 25)),
                           mr))

  expect_true(check.delta(delta(name        = c("2YCHF", "EURCHF"),
                                 currency    = c("CHF", "CHF"),
                                 sensitivity = c(12, 25)),
                           mr))

  expect_error(check.delta(delta(name        = c("3YCHF", "EURCHF"),
                                currency    = c("CHF", "CHF"),
                                sensitivity = c(12, 25)),
                               market.risk = list(1, 2, 3)),
               "delta")

})

test_that("delta: standard methods are ok", {

  # format
  expect_equal(class(format(delta(name        = c("2YCHF", "EURCHF"),
                                  currency    = c("CHF", "CHF"),
                                  sensitivity = c(12, 25)))),
               "character")

  # summary
  expect_equal(class(summary(delta(name        = c("2YCHF", "EURCHF"),
                                   currency    = c("CHF", "CHF"),
                                   sensitivity = c(12, 25)))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(delta(name        = c("2YCHF", "EURCHF"),
                                 currency    = c("CHF", "CHF"),
                                 sensitivity = c(12, 25)))),
               "NULL")

})
