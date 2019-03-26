# unit tests for S3 class cashflow
context("cashflow: base")

test_that("cashflow: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(cashflow(time = 10))
  expect_error(cashflow(currency = "CHF"))
  expect_error(cashflow(rating = "AAA"))
  expect_error(cashflow(spread = 0.1))
  expect_error(cashflow(value = 10))

  # type checks
  expect_error(cashflow(time = list(), currency="CHF",
                        value=10, rating="AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = list(1),
                        value = 10, rating = "AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = list(1, NA), rating = "AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = 10, rating = list(1, 2), spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = 10, rating = "AAA", spread = list()),
               "Invalid types")

  expect_error(cashflow(time = "a", currency = "CHF",
                        value = 100, rating = "AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = 1,
                        value = 100, rating = "AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = TRUE, rating = "AAA", spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = 100, rating = 10L, spread = 0.2),
               "Invalid types")
  expect_error(cashflow(time = 10, currency = "CHF",
                        value = 100, rating = 10L, spread = "A"),
               "Invalid types")

  # dimensions checks
  expect_error(cashflow(time = c(1, 1), currency="CHF",
                        value=100, rating="AAA", spread = 0.2),
               "dimensions")
  expect_error(cashflow(time = 1, currency= c("a", "b"),
                        value = 10, rating="AAA", spread = 0.2),
               "dimensions")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = numeric(), rating="AAA", spread = 0.2),
               "dimensions")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = 1, rating = rep("AAA", 10), spread = 0.2),
               "dimensions")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = 1, rating = "AAA", spread = c(0.2, 0.1)),
               "dimensions")

  # input values checks
  expect_error(cashflow(time = as.numeric(NA), currency="CHF",
                        value = 100, rating="AAA", spread = 0.2),

               "Missing")
  expect_error(cashflow(time = 1, currency = as.character(NA),
                        value = 10, rating="AAA", spread = 0.2),
               "Missing")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = NaN, rating="AAA", spread = 0.2),
               "Missing")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = 1, rating = as.character(NA), spread = 0.2),
               "Missing")
  expect_error(cashflow(time = 1, currency= "CHF",
                        value = 1, rating = "AAA", spread = as.numeric(NA)),
               "Missing")

  # time and value checks
  expect_error(cashflow(time = Inf, currency="CHF",
                         value = 10, rating="AAA", spread = 0.2),
               "finite")
  expect_error(cashflow(time = 1, currency="CHF",
                        value = -Inf, rating="AAA", spread = 0.2),
               "finite")
  expect_error(cashflow(time = 1, currency="CHF",
                        value = 10, rating="AAA", spread = Inf),
               "finite")

  expect_warning(cashflow(time = 1, currency="CHF",
                        value = 10, rating="AAA", spread = -1),
               "spread")
  expect_warning(cashflow(time = 1, currency="CHF",
                        value = 10, rating="AAA", spread = 10),
               "spread")

  expect_error(cashflow(time = -1, currency="CHF",
                          value = 10, rating = "AAA", spread = 0.1),
                 "time")
  expect_warning(cashflow(time = 1, currency="CHF",
                          value = 0, rating="AAA", spread = 0.1),
                 "value")
  expect_error(cashflow(time = 1.2, currency="CHF",
                          value = 10, rating="AAA", spread = 0.1),
                 "time")

})

test_that("cashflow: internal structure is ok", {

  # define a cashflow
  cf <- cashflow(time = 10, currency = "CHF",
                 value = 10, rating = "AAA", spread = 0.2)

  # checking internal representation of attributes
  expect_equal(length(cf), 5)
  expect_equal(names(cf), c("time", "currency",
                            "rating", "spread", "value"))
  expect_equal(class(cf$time), "integer")

  # checking class membership
  expect_equal(is.cashflow(cf), TRUE)
  expect_equal(is.marketItem(cf), TRUE)
  expect_equal(is.item(cf), TRUE)
  expect_equal(is.list(cf), TRUE)

})

test_that("cashflow: check method is ok", {

  # a first example
  cov.mat <- diag(rep(4, 2))
  name <- c("2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))
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

  expect_true(check.cashflow(cashflow(time     = 1L,
                                      currency = "CHF",
                                      rating   = "AAA",
                                      spread   = 0.2,
                                      value    = 10),
                             market.risk = mr))
  expect_false(check.cashflow(cashflow(time     = 2L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))
  expect_false(check.cashflow(cashflow(time     = 2L,
                                       currency = "CHF",
                                       rating   = "AA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))
  expect_false(check.cashflow(cashflow(time     = 2L,
                                       currency = "EUR",
                                       rating   = "AA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))

  ## a second example
  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "l"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.cashflow(cashflow(time    = 1L,
                                      currency = "CHF",
                                      rating   = "AAA",
                                      spread   = 0.2,
                                      value    = 10),
                              market.risk = mr))

  # a third example
  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "BB"))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.cashflow(cashflow(time     = 1L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))

  # a fourth example
  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  mapping.time <- data.frame(time = 1L, mapping = "m", stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)



  expect_false(check.cashflow(cashflow(time     = 1L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))

  # a fifth example with an incorrect mapping time
  mapping.time <- data.frame(time = 2L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)



  expect_false(check.cashflow(cashflow(time     = 1L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))

  # a sixth example with incorrect initial rate
  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 2L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_false(check.cashflow(cashflow(time     = 1L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              market.risk = mr))

  expect_error(check.cashflow(cashflow(time     = 1L,
                                       currency = "CHF",
                                       rating   = "AAA",
                                       spread   = 0.2,
                                       value    = 10),
                              list(1, 2, 3)),
               "Invalid type")

})


test_that("cashflow: standard methods are ok", {

  # format
  expect_equal(class(format(cashflow(time     = 1L,
                                     currency = "CHF",
                                     rating   = "AAA",
                                     spread   = 0.2,
                                     value    = 10))),
               "character")

  # summary
  expect_equal(class(summary(cashflow(time     = 1L,
                                      currency = "CHF",
                                      rating   = "AAA",
                                      spread   = 0.2,
                                      value    = 10))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(cashflow(time     = 1L,
                                    currency = "CHF",
                                    rating   = "AAA",
                                    spread   = 0.2,
                                    value    = 10))),
               "NULL")

})
