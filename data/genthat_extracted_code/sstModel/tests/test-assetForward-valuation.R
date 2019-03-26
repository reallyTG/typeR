# unit tests for S3 class assetForward
context("assetForward: valuation")

test_that("assetForward: valInfo method is ok", {

  ## a first example
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


  l <- valInfo.assetForward(assetForward(type      = "equity",
                                      currency  = "CHF",
                                      time      = 1L,
                                      exposure  = 10,
                                      price     = 100,
                                      position  = "long"),
                         mr)

  expect_equal(l$asset.term$type, "equity")
  expect_equal(l$liability.term$currency, "CHF")

})

test_that("assetForward: valExpression is OK", {

  ## a first example
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


  expect_equal(valExpression(assetForward(type      = "equity",
                             currency  = "CHF",
                             time      = 1L,
                             exposure  = 10,
                             price     = 100,
                             position  = "long"),
                mr),
               "10 * (exp(`equityCHF` + -2) - 1) + -99.0049833749168 * (exp(-1 * `2YCHF` + -2) - 1)")

  expect_equal(valExpression(assetForward(type      = "equity",
                                          currency  = "CHF",
                                          time      = 1L,
                                          exposure  = 10,
                                          price     = 100,
                                          position  = "short"),
                             mr),
               "-10 * (exp(`equityCHF` + -2) - 1) + 99.0049833749168 * (exp(-1 * `2YCHF` + -2) - 1)")
})

test_that("assetForward: valExpression with standalones is ok", {

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

  expect_true(is.na(valExpression(object = assetForward(type      = "equity",
                                                        currency  = "CHF",
                                                        time      = 1L,
                                                        exposure  = 10,
                                                        price     = 100,
                                                        position  = "short"),
                                  market.risk = mr,
                                  standalone = standalone(name = "a name",
                                                          equity(name     = "AAACHF",
                                                                 currency = "EUR",
                                                                 type     = "equity")))))


  expect_equal(valExpression(object = assetForward(type      = "equity",
                                      currency  = "CHF",
                                      time      = 1L,
                                      exposure  = 10,
                                      price     = 100,
                                      position  = "short"),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        equity(name     = "AAACHF",
                                               currency = "CHF",
                                               type     = "equity"))),
               "-10 * (exp(`equityCHF` + -2) - 1)")

               expect_equal(valExpression(object = assetForward(type      = "equity",
                                      currency  = "CHF",
                                      time      = 1L,
                                      exposure  = 10,
                                      price     = 100,
                                      position  = "long"),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        equity(name     = "AAACHF",
                                               currency = "CHF",
                                               type     = "equity"))),
                "10 * (exp(`equityCHF` + -2) - 1)")

                expect_equal(valExpression(object = assetForward(type      = "equity",
                                      currency  = "CHF",
                                      time      = 1L,
                                      exposure  = 10,
                                      price     = 100,
                                      position  = "short"),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        rate(name     = "2YCHF",
                                             horizon  = "k",
                                             currency = "CHF"))),
                "99.0049833749168 * (exp(-1 * `2YCHF` + -2) - 1)")

                expect_equal(valExpression(object = assetForward(type      = "equity",
                                      currency  = "CHF",
                                      time      = 1L,
                                      exposure  = 10,
                                      price     = 100,
                                      position  = "long"),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        rate(name     = "2YCHF",
                                             horizon  = "k",
                                             currency = "CHF"))),
                "-99.0049833749168 * (exp(-1 * `2YCHF` + -2) - 1)")

})

test_that("assetForward: valFunction is OK", {

  ## a first example
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

  # type checks (with constant)
  simulations <- matrix(c("a", "b", "c"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr)(simulations),
               "types")

  simulations <- c(1,2)
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr)(simulations),
               "Missing")

  # type checks (without constant)
  simulations <- matrix(c("a", "b", "c"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr, with.constant = F)(simulations),
               "types")

  simulations <- c(1,2)
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr, with.constant = F)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "long"), market.risk = mr, with.constant = F)(simulations),
               "Missing")

  # validation: battery of tests
  simulations <- matrix(c(1, 2, 3), nrow = 1)
  colnames(simulations) <- name

  expect_equal(valFunction(assetForward(type      = "equity",
                                          currency  = "CHF",
                                          time      = 1L,
                                          exposure  = 10,
                                          price     = 100,
                                          position  = "long"),
                             mr)(simulations),
               10 * (exp(2 + -2) - 1) - 99.0049833749168 * (exp(-1 * 1 + -2) - 1))

  expect_equal(valFunction(assetForward(type      = "equity",
                                          currency  = "CHF",
                                          time      = 1L,
                                          exposure  = 10,
                                          price     = 100,
                                          position  = "short"),
                             mr)(simulations),
               99.0049833749168 * (exp(-1 * 1 + -2) - 1) - 10 * (exp(2 + -2) - 1))


  # wrong input
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           list(1, 2, 3))(simulations),
               "assetForward")

  # vector input
  simulations.vec <- c(1, 2, 3)
  expect_equal(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr)(simulations.vec),
               99.0049833749168 * (exp(-1 * 1 + -2) - 1) - 10 * (exp(2 + -2) - 1))
  expect_equal(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr, with.constant = F)(simulations.vec),
               99.0049833749168 * (exp(-1 * 1) - 1) - 10 * (exp(2) - 1))

  # invalid types
  simulations.vec <- c("a", "b", "c", "d")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr)(simulations.vec),
               "types")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr, with.constant = F)(simulations.vec),
               "types")

  # invalid dimensions
  simulations.vec <- c(2, 5, 5, 6)
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr)(simulations.vec),
               "dimensions")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr, with.constant = F)(simulations.vec),
               "dimensions")

  # missing values
  simulations <- matrix(c(NA, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr)(simulations),
               "Missing")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr, with.constant = F)(simulations),
               "Missing")

  # wrong names
  simulations <- matrix(c(2, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr)(simulations),
               "names")
  expect_error(valFunction(assetForward(type      = "equity",
                                        currency  = "CHF",
                                        time      = 1L,
                                        exposure  = 10,
                                        price     = 100,
                                        position  = "short"),
                           mr, with.constant = F)(simulations),
               "names")
})
