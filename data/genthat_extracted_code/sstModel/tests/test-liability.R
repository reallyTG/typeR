# unit tests for S3 class liability
context("liability: base")

test_that("liability: checks at construction are ok", {

  ## error when some parameters are missing
  expect_error(liability(time = 10))
  expect_error(liability(currency = "CHF"))
  expect_error(liability(value = 10))

  # type checks
  expect_error(liability(time = list(), currency="CHF",
                        value=10),
               "Invalid types")
  expect_error(liability(time = 10, currency = list(1),
                        value = 10),
               "Invalid types")
  expect_error(liability(time = 10, currency = "CHF",
                        value = list(1, NA)),
               "Invalid types")

  expect_error(liability(time = "a", currency = "CHF",
                        value = 100),
               "Invalid types")
  expect_error(liability(time = 10, currency = 1,
                        value = 100),
               "Invalid types")
  expect_error(liability(time = 10, currency = "CHF",
                        value = TRUE),
               "Invalid types")

  # dimension checks
  expect_error(liability(time = c(1, 1), currency="CHF",
                        value=100),
               "dimensions")
  expect_error(liability(time = 1, currency= c("a", "b"),
                        value = 10),
               "dimensions")
  expect_error(liability(time = 1, currency= "CHF",
                        value = numeric()),
               "dimensions")

  # input values checks
  expect_error(liability(time = as.numeric(NA), currency="CHF",
                        value = 100),
               "Missing")
  expect_error(liability(time = 1, currency = as.character(NA),
                        value = 10),
               "Missing")
  expect_error(liability(time = 1, currency= "CHF",
                        value = NaN),
               "Missing")

  # time and value checks
  expect_error(liability(time = Inf, currency="CHF",
                        value = 10),
               "finite")
  expect_error(liability(time = 1, currency="CHF",
                        value = -Inf),
               "finite")

  expect_error(liability(time = -1, currency="CHF",
                        value = 10),
               "time")
  expect_warning(liability(time = 1, currency="CHF",
                          value = 0),
                 "value")
  expect_error(liability(time = 1.2, currency="CHF",
                        value = 10),
               "time")

})

test_that("constructor of liability is ok", {

  ## cheching types
  expect_error(liability(time=10))
  expect_error(liability(value=-10))
  expect_error(liability(time = "1", currency = "CHF",
                         value = 10),
               "Invalid types")
  expect_error(liability(time = 10, currency = 20,
                         value = -100),
               "Invalid types")
  expect_error(expect_warning(liability(time = 1.2, currency = "CHF",
                         value = -100)),
               "time must be an integer")
  expect_error(liability(time = 1, currency = "CHF",
                         value = Inf),
               "finite")
  expect_error(liability(time = 1, currency = "CHF",
                         value = NaN),
               "Missing")
  expect_error(liability(time = Inf, currency = "CHF",
                         value = 100),
               "finite")
  expect_error(liability(time = Inf, currency = "CHF",
                         value = 100),
               "finite")
  expect_error(liability(time = NaN, currency = "CHF",
                         value = 100),
               "Missing")
  expect_error(liability(time = -10, currency = "CHF",
                         value = 100),
               "time must be positive")
  expect_warning(liability(time = 10, currency = "CHF",
                        value = 0),
               "efficiency")
  expect_error(liability(time = -10, currency = "CHF",
                         value = 100),
               "time must be positive")


  ## checking dimensions
  expect_error(liability(time = c(1,2), currency = "CHF",
                        value = -10),
               "Invalid dimensions")
  expect_error(liability(time = numeric(), currency = "CHF",
                        value = -10),
               "Invalid dimensions")



})

test_that("liability: internal structure is ok", {

  ## create a liability
  liab <- liability(time = 1, currency = "CHF",
                    value = 3)

  ## checking internal representation of attributes
  expect_equal(length(liab), 3)
  expect_equal(names(liab), c("time", "currency",
                              "value"))
  expect_equal(class(liab$time), "integer")

  ## checking class membership
  expect_equal(is.liability(liab), TRUE)
  expect_equal(is.marketItem(liab), TRUE)
  expect_equal(is.item(liab), TRUE)
  expect_equal(is.list(liab), TRUE)

})

test_that("liability: check method is ok", {

  ## a first example
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

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check.liability(liability(time     = 1L,
                                      currency = "CHF",
                                      value    = -10),
                             market.risk = mr))
  expect_false(check.liability(liability(time     = 2L,
                                         currency = "CHF",
                                         value    = -10),
                               market.risk = mr))

  ## a second example
  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "l"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(!check.liability(liability(time     = 1L,
                                       currency = "CHF",
                                       value    = -10),
                              market.risk = mr))

  ## a third example
  mapping.table <- mappingTable(rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  mapping.time <- data.frame(time = 1L, mapping = "m", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)



  expect_false(check.liability(liability(time     = 1L,
                                         currency = "CHF",
                                         value    = -10),
                               market.risk = mr))

  ## a fourth example with incorrect mapping time
  mapping.time <- data.frame(time = 2L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)



  expect_false(check.liability(liability(time     = 1L,
                                         currency = "CHF",
                                         value    = -10),
                               market.risk = mr))

  ## a fifth example with incorrect initial rate
  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 2L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(!check.liability(liability(time     = 1L,
                                         currency = "CHF",
                                         value    = -10),
                               market.risk = mr))

  expect_error(check.liability(liability(time     = 1L,
                                         currency = "CHF",
                                         value    = -10),
                               market.risk = list(1, 2, 3)),
               "Invalid type")

})

test_that("liability: standard methods are ok", {

  # format
  expect_equal(class(format(liability(time     = 1L,
                                      currency = "CHF",
                                      value    = -10))),
               "character")

  # summary
  expect_equal(class(summary(liability(time     = 1L,
                                       currency = "CHF",
                                       value    = -10))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(liability(time     = 1L,
                                     currency = "CHF",
                                     value    = -10))),
               "NULL")

})
