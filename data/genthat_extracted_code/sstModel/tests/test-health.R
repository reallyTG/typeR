# unit tests for S3 class health
context("health S3 class")

# checking constructor
test_that("health: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(health(name = "equity"))
  expect_error(health(currency = "CHF"))
  expect_error(health(sensitivity = 1))

  # type checks
  expect_error(health(name = list(),
                     currency = "CHF", sensitivity = 100),
               "types")
  expect_error(health(name = "equity",
                     currency = list(NA), sensitivity = 100),
               "types")
  expect_error(health(name = "equity",
                     currency = "CHF", sensitivity = list(1, 2)),
               "types")

  expect_error(health(name = 1,
                     currency = "CHF", sensitivity = 100),
               "types")
  expect_error(health(name = "equity",
                     currency = 3, sensitivity = 100),
               "types")
  expect_error(health(name = "equity",
                     currency = "CHF", sensitivity = "a"),
               "types")

  # dimensions checks
  expect_error(health(name = c("equityCHF", "equityEUR"),
                     currency = "CHF", sensitivity = 100),
               "length")
  expect_error(health(name = rep("equity", 3),
                     currency = "CHF", sensitivity = rep(3, 3)),
               "length")
  expect_error(health(name = c("equityCHF", "equityEUR"),
                     currency = c("CHF", "EUR"), sensitivity = c(1, 2, 3)),
               "length")

  # input values checks
  expect_error(health(name             = c("equity", NA, "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Missing")
  expect_error(health(name             = c("equity", "equityEUR", "EURCHF"),
                     currency         = c(NA, NA, "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Missing")
  expect_error(health(name             = c("equity", "equityEUR", "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(NaN, 150, 130)),
               "Missing")

  # name checks
  expect_error(health(name             = c("equity", "equity", "EURCHF"),
                     currency         = c("CHF", "CHF", "CHF"),
                     sensitivity      = c(100, 150, 130)),
               "Sensitivities")

  # sensitivities checks
  expect_error(health(name             = c("equityCHF", "equityEUR", "EURCHF"),
                     currency         = c("CHF", "EUR", "EUR"),
                     sensitivity      = c(Inf, -Inf, 130)),
               "Sensitivities")

  expect_warning(health(name             = c("equityEUR", "equityCHF", "EURCHF"),
                       currency         = c("CHF", "CHF", "CHF"),
                       sensitivity      = c(100, 0, 130)),
                 "efficiency")

})

test_that("health: internal structure is ok", {

  # a valid data.frame object
  d <- health(name        = c("equity", "2YCHF", "EURCHF"),
              currency    = c("EUR", "CHF", "EUR"),
              sensitivity = c(100, 150, 130))

  # checking internal representation of attributes
  expect_equal(length(d), 3)
  expect_equal(names(d), c("name", "currency", "sensitivity"))

  # checking class membership
  expect_equal(is.health(d), TRUE)
  expect_equal(is.insuranceItem(d), TRUE)
  expect_equal(is.item(d), TRUE)
  expect_equal(is.list(d), TRUE)
  expect_equal(is.data.frame(d), TRUE)

})

test_that("health: check method is ok", {

  # a valid input
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

  corr.mat <- diag(c(1, 1))
  colnames(corr.mat) <- c("storno", "invalidity")
  rownames(corr.mat) <- colnames(corr.mat)
  hr <- healthRisk(corr.mat = corr.mat)

  expect_false(check.health(health(name        = c("storno", "invalidity"),
                                currency    = c("CHF", "EUR"),
                                sensitivity = c(12, 25)),
                          mr, hr))

  expect_false(check.health(health(name        = c("storno", "invalidity"),
                                 currency    = c("USD", "EUR"),
                                 sensitivity = c(12, 25)),
                           mr, hr))

  expect_true(check.health(health(name        = c("storno", "invalidity"),
                                   currency    = c("CHF", "CHF"),
                                   sensitivity = c(12, 25)),
                            mr, hr))

  expect_false(check.health(health(name        = c("Sstorno", "invalidity"),
                                 currency    = c("CHF", "EUR"),
                                 sensitivity = c(12, 25)),
                           mr, hr))
})

test_that("health: standard methods are ok", {

  # format
  expect_equal(class(format(health(name        = c("Sstorno", "invalidity"),
                                   currency    = c("CHF", "EUR"),
                                   sensitivity = c(12, 25)))),
               "character")

  # summary
  expect_equal(class(summary(health(name        = c("Sstorno", "invalidity"),
                                    currency    = c("CHF", "EUR"),
                                    sensitivity = c(12, 25)))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(health(name        = c("Sstorno", "invalidity"),
                                  currency    = c("CHF", "EUR"),
                                  sensitivity = c(12, 25)))),
               "NULL")

})
