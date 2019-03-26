# unit tests for S3 class delta
context("delta: valuation")

test_that("delta: valInfo method is ok", {

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

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.delta(delta(name        = c("2YCHF", "EURCHF"),
                           currency    = c("CHF", "EUR"),
                           sensitivity = c(12, 25)),
                     mr)

  expect_equal(l$sensitivity, c(12, 1.05*25))
  expect_equal(l$name, c("2YCHF", "EURCHF"))
  expect_equal(l$id, c(1L,2L))

  l <- valInfo.delta(delta(name        = c("2YCHF"),
                           currency    = c("CHF"),
                           sensitivity = c(12)),
                     mr)

  expect_equal(l$sensitivity, c(12))
  expect_equal(l$name, c("2YCHF"))
  expect_equal(l$id, c(1L))

})

test_that("delta: valExpression method is OK", {

  ## a first example
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

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression.delta(delta(name        = c("2YCHF", "EURCHF"),
                                         currency    = c("CHF", "CHF"),
                                         sensitivity = c(12, 25)),
                      mr),"`2YCHF` * 12 + `EURCHF` * 25")
  expect_equal(valExpression.delta(delta(name        = c("2YCHF"),
                                         currency    = c("CHF"),
                                         sensitivity = c(12)),
                                   mr),"`2YCHF` * 12")

})

test_that("delta: valExpression method with standalones is OK", {

  cov.mat <- diag(rep(4, 3))
  name <- c("2YCHF", "EURCHF", "equityCHF")
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
                                         to   = "CHF"),
                                equity(name = "equityCHF",
                                       type = "equity",
                                       currency = "CHF"))

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

  expect_true(is.na(valExpression(delta(name        = c("2YCHF", "EURCHF"),
        currency    = c("CHF", "CHF"),
        sensitivity = c(12, 25)),
        mr,
        standalone = standalone(name = "idk",
                                      equity("equityCHF",
                                             "equity",
                                             "CHF")))))

  expect_equal(valExpression(delta(name        = c("2YCHF", "EURCHF"),
                      currency    = c("CHF", "CHF"),
                      sensitivity = c(12, 25)),
                mr,
                standalone = standalone(name = "idk",
                                        currency(name = "EURCHF",
                                                 from = "EUR",
                                                 to   = "CHF"),
                                        rate(name = "2YCHF",
                                             currency = "CHF",
                                             horizon = "k"))),
               "`EURCHF` * 25 + `2YCHF` * 12")

  expect_equal(valExpression(delta(name        = c("2YCHF", "EURCHF"),
                                   currency    = c("CHF", "CHF"),
                                   sensitivity = c(12, 25)),
                             mr,
                             standalone = standalone(name = "idk",
                                                     rate(name = "2YCHF",
                                                          currency = "CHF",
                                                          horizon = "k"))),
               "`2YCHF` * 12")

  expect_true(is.na(valExpression(delta(name        = c("2YCHF", "EURCHF"),
                                   currency    = c("CHF", "EUR"),
                                   sensitivity = c(12, 25)),
                             mr,
                             standalone = standalone(name = "idk",
                                                     rate(name     = "2YCHF",
                                                          currency = "EUR",
                                                          horizon  = "k",
                                                          scale    = 0.75)))))

})

test_that("delta: valFunction method is OK", {

  ## a first example
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

  simulations <- matrix(c(2, 5), nrow = 1)
  colnames(simulations) <- name

  expect_equal(valFunction(delta(name        = c("2YCHF", "EURCHF"),
                                 currency    = c("CHF", "CHF"),
                                 sensitivity = c(12, 25)),
                                   mr)(simulations),
               2 * 12 + 5 * 25)
  expect_equal(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations),
               2 * 12)


  # wrong input
  expect_error(valFunction(delta(name        = c("2YCHF"),
                                currency    = c("CHF"),
                                sensitivity = c(12)),
                          list(1,2,3))(simulations),
              "delta")

  # vector input
  simulations.vec <- c(2, 5)
  expect_equal(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations.vec),
               2 * 12)

  # invalid types
  simulations.vec <- c("a", "b", "c", "d")
  expect_error(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations.vec),
               "types")

  # invalid dimensions
  simulations.vec <- c(2, 5, 5, 6)
  expect_error(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations.vec),
               "dimensions")

  # missing values
  simulations <- matrix(c(NA, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations),
               "Missing")

  # wrong names
  simulations <- matrix(c(2, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(delta(name        = c("2YCHF"),
                                 currency    = c("CHF"),
                                 sensitivity = c(12)),
                           mr)(simulations),
               "names")

})
