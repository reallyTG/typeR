# unit tests for S3 class scenarioRisk
context("scenarioRisk S3 class")

# checking constructor
test_that("scenarioRisk: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(scenarioRisk(name = "terrorism"))
  expect_error(scenarioRisk(effect = 10))
  expect_error(scenarioRisk(probability = 0.6))

  # type checks
  expect_error(scenarioRisk(name        = list("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "types")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = list(),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "types")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = list("CHF"),
                            effect      = c(100, 150)),
               "types")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = list(100, 150)),
               "types")

  expect_error(scenarioRisk(name        = c(1, 1),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "types")
  expect_error(scenarioRisk(name       = c("terrorism", "market crash"),
                           probability = c("a", 0.2),
                           currency    = c("CHF", "CHF"),
                           effect      = c(100, 150)),
              "types")
  expect_error(scenarioRisk(name       = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c(1, 2),
                            effect      = c(-100, -150)),
               "types")
  expect_error(scenarioRisk(name       = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = factor(c(100, 1))),
               "types")

  # dimensions checks
  expect_error(scenarioRisk(name        = c("market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "length")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = 0.9,
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "length")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = character(),
                            effect      = c(100, 150)),
               "length")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, NA, 300)),
               "length")

  # input values checks
  expect_error(scenarioRisk(name        = c(NA, "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "Missing")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, NaN),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 150)),
               "Missing")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", NA),
                            effect      = c(100, 150)),
               "Missing")
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(NaN, 150)),
               "Missing")

  # effect, name, probability checks
  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "USD"),
                            effect      = c(100, Inf)),
               "finite")

  expect_error(scenarioRisk(name        = c("terrorism", "terrorism"),
                            probability = c(0.1, 0.2),
                            currency    = c("CHF", "CHF"),
                            effect      = c(100, 50)),
               "once")

  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(-0.1, 0.2),
                            currency    = c("CHF", "USD"),
                            effect      = c(100, 50)),
               "Probabilities")

  expect_error(scenarioRisk(name        = c("terrorism", "market crash"),
                            probability = c(0.1, 0.95),
                            currency    = c("CHF", "USD"),
                            effect      = c(100, 50)),
               "Probabilities")

  expect_warning(scenarioRisk(name        = c("terrorism", "market crash"),
                              probability = c(0.1, 0.2),
                              currency    = c("CHF", "USD"),
                              effect      = c(100, 0)),
                 "efficiency")

  expect_warning(scenarioRisk(name        = c("terrorism", "market crash"),
                              probability = c(0.1, 0.2),
                              currency    = c("CHF", "USD"),
                              effect      = c(100, 50)),
                 "positive")

  expect_warning(scenarioRisk(name        = c("terrorism", "market crash"),
                              probability = c(0, 0.2),
                              currency    = c("CHF", "USD"),
                              effect      = c(100, 50)),
                 "efficiency")

})

test_that("scenarioRisk: internal structure is ok", {

  # a valid data.frame object
  d <- scenarioRisk(name = c("terrorism", "market crash"),
                    probability = c(0.1, 0.2),
                    currency    = c("CHF", "USD"),
                    effect      = c(-100, -50))

  # checking internal representation of attributes
  expect_equal(length(d), 4)
  expect_equal(names(d), c("name", "probability", "currency", "effect"))

  # checking class membership
  expect_equal(is.scenarioRisk(d), TRUE)
  expect_equal(is.risk(d), TRUE)
  expect_equal(is.list(d), TRUE)
  expect_equal(is.data.frame(d), TRUE)

})


test_that("scenarioRisk: check method is OK", {

  d <- scenarioRisk(name = c("terrorism", "market crash"),
                    probability = c(0.1, 0.2),
                    currency    = c("CHF", "CHF"),
                    effect      = c(-100, -50))

  ## a valid input
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

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check(d, mr))

})



test_that("scenarioRisk: standard methods are ok", {

  # format
  expect_equal(class(format(scenarioRisk(name = c("terrorism", "market crash"),
                                         probability = c(0.1, 0.2),
                                         currency    = c("CHF", "CHF"),
                                         effect      = c(-100, -50)))),
               "character")

  # summary
  expect_equal(class(summary(scenarioRisk(name = c("terrorism", "market crash"),
                                          probability = c(0.1, 0.2),
                                          currency    = c("CHF", "CHF"),
                                          effect      = c(-100, -50)))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(scenarioRisk(name = c("terrorism", "market crash"),
                                        probability = c(0.1, 0.2),
                                        currency    = c("CHF", "CHF"),
                                        effect      = c(-100, -50)))),
               "NULL")

})
