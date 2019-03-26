# unit tests for S3 class asset
context("cashflow: valuation")

test_that("cashflow: valInfo method is ok", {

  ## false inputs
  expect_error(valInfo.cashflow())
  expect_error(valInfo.cashflow(asset(type     = "hedgeFund",
                                      currency = "CHF",
                                      value    = 10)))
  expect_error(valInfo.cashflow(asset(type     = "hedgeFund",
                                      currency = "CHF",
                                      value    = 10),
                                market.risk = list(1, 2, 3)))


  ## a first example
  cov.mat <- diag(rep(4, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"


  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
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

  initial.values$initial.rate <- data.frame(time             = c(1L, 2L),
                                            currency         = c("CHF", "EUR"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = c(1L, 2L), mapping = c("k", "k"), stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.cashflow(cashflow(time     = 1L,
                                 currency = "CHF",
                                 rating   = "AAA",
                                 spread   = 0.06,
                                 value    = 100),
                         market.risk = mr)

  expect_equal(l$exposure, 100 * exp(-(0.01 + 0.06)))

  expect_equal(l$constant, as.numeric(-0.5 * t(c(0, 0, -1,- 1)) %*%
                                                 mr$cov.mat %*% c(0, 0, -1, -1)))
  expect_equal(l$risk.factor$name, c("2YCHF", "AAACHF"))
  expect_equal(l$risk.factor$id, c(3L, 4L))
  expect_equal(l$risk.factor$scale, c(-1, -1))

  ## a second example with scaled risk factors
  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA"),
                                equity(name     = "equityCHF",
                                       currency = "EUR",
                                       type     = "equity",
                                       scale    = 2))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.cashflow(cashflow(time     = 2L,
                                  currency = "EUR",
                                  rating   = "AAA",
                                  spread   = 0.04,
                                  value    = 100),
                         mr)

  expect_equal(l$exposure, 100 * exp(-2*(0.01 + 0.04)) * 1.05)

  expect_equal(l$constant, as.numeric(-0.5 * t(c(1, 0, -2, -2)) %*%
                                                 mr$cov.mat %*% c(1, 0, -2, -2)))

  expect_equal(l$risk.factor$name, c("2YCHF", "AAACHF", "EURCHF"))
  expect_equal(l$risk.factor$id, c(3L, 4L, 1L))
  expect_equal(l$risk.factor$scale, c(-2, -2, 1))

})

test_that("cashflow: valExpression method is OK", {

  ## false inputs
  expect_error(valExpression.cashflow())
  expect_error(valExpression.cashflow(asset(type     = "hedgeFund",
                                            currency = "CHF",
                                            value    = 10)))

  ## a first example
  cov.mat <- diag(rep(4, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
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

  expect_equal(valExpression(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr),
               "932.393819905948 * (exp(-1 * `2YCHF` + -1 * `AAACHF` + -4) - 1)")

  mapping.time <- data.frame(time = c(1L, 2L), mapping = c("k", "k"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L),
                                            currency         = c("CHF", "CHF"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)
  ## a second example with scaled risk factors
  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(cashflow(2L, "CHF", "AAA", 0.06, 1000), market.risk = mr),
               "869.358235398806 * (exp(-2 * `2YCHF` + -2 * `AAACHF` + -16) - 1)")

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "m",
                                     scale    = 1),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"),
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA",
                                       scale    = 3))


  mapping.time <- data.frame(time = c(1L, 2L, 10L), mapping = c("k", "k", "m"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L, 10L),
                                            currency         = c("CHF", "CHF", "EUR"),
                                            rate             = c(0.01, 0.01, 0.03),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(cashflow(10L, "EUR", "AAA", 0.01, 1000), market.risk = mr),
               "703.836048337421 * (exp(-10 * `2YCHF` + -30 * `AAACHF` + `EURCHF` + -2002) - 1)")

  ## a third example with scaled risk factor (scale = 0)
  expect_warning(mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "m",
                                     scale    = 0),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"),
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA",
                                       scale    = 0)))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(cashflow(10L, "EUR", "AAA", 0.01, 1000), market.risk = mr),
               "703.836048337421 * (exp(`EURCHF` + -2) - 1)")
})


test_that("cashflow: valExpression and valInfo methods with standalones are ok", {

  ## a first example
  cov.mat <- diag(rep(4, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.5),
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA",
                                       scale    = 1))
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

  expect_true(is.na(valExpression(object = cashflow(1L, "CHF", "AAA", 0.06, 1000),
                                  market.risk = mr,
                                  standalone = standalone(name = "a name",
                                                          rate(name     = "2YCHF",
                                                               horizon  = "k",
                                                               currency = "EUR"),
                                                          spread(name     = "AAACHF",
                                                                 currency = "CHF",
                                                                 rating   = "EUR")))))

  expect_equal(valExpression(object = cashflow(1L, "EUR", "AAA", 0.04, 1000),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        rate(name     = "2YCHF",
                                             horizon  = "k",
                                             currency = "EUR"))),
               "998.79089572575 * (exp(-0.5 * `2YCHF` + -0.5) - 1)")

  expect_equal(valExpression(object = cashflow(1L, "EUR", "AAA", 0.04, 1000),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     currency(name = "EURCHF",
                                                              from = "EUR",
                                                              to   = "CHF"))),
               "998.79089572575 * (exp(`EURCHF` + -2) - 1)")

  vi <- valInfo(object = cashflow(1L, "EUR", "AAA", 0.04, 1000),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        currency(name = "EURCHF",
                                                 from = "EUR",
                                                 to   = "CHF")))

  expect_equal(vi$constant, as.numeric(-0.5 * t(c(1, 0, 0, 0) %*%
                                                  mr$cov.mat %*% c(1, 0, 0, 0))))
})

test_that("valFunction for cashflow is OK", {

  ## false inputs
  expect_error(valExpression.cashflow())
  expect_error(valExpression.cashflow(asset(type     = "hedgeFund",
                                            currency = "CHF",
                                            value    = 10)))

  ## a first example
  cov.mat <- diag(rep(4, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
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

  # type checks (with constant)
  simulations <- matrix(c("a", "b", "c", "d"), nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations),
               "types")

  simulations <- c(1,2,3)
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations),
               "Missing")

  # type checks (without constant)
  simulations <- matrix(c("a", "b", "c", "d"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = F)(simulations),
               "types")

  simulations <- c(1,2, 3)
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = F)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = F)(simulations),
               "Missing")

  # validation: battery of tests
  simulations <- matrix(c(4,10,2,3), nrow = 1)
  colnames(simulations) <- name

  expect_equal(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations),
               932.393819905948 * (exp(-1 * 2 + -1 * 3 + -4) - 1))

  mapping.time <- data.frame(time = c(1L, 2L), mapping = c("k", "k"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L),
                                            currency         = c("CHF", "CHF"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(cashflow(2L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations),
               869.358235398806 * (exp(-2 * 2 + -2 * 3 + -16) - 1))

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "m",
                                     scale    = 1),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"),
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA",
                                       scale    = 3))

  mapping.time <- data.frame(time = c(1L, 2L, 10L), mapping = c("k", "k", "m"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L, 10L),
                                            currency         = c("CHF", "CHF", "EUR"),
                                            rate             = c(0.01, 0.01, 0.03),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(cashflow(10L, "EUR", "AAA", 0.01, 1000), market.risk = mr)(simulations),
               703.836048337421 * (exp(-10 * 2 + -30 *3 + 4 + -2002) - 1))

  expect_warning(mapping.table <- mappingTable(currency(name = "EURCHF",
                                                        from = "EUR",
                                                        to   = "CHF"),
                                               equity(name     = "equityCHF",
                                                      type     = "equity",
                                                      currency = "CHF"),
                                               rate(name     = "2YCHF",
                                                    currency = "CHF",
                                                    horizon  = "k"),
                                               rate(name     = "2YCHF",
                                                    currency = "EUR",
                                                    horizon  = "m",
                                                    scale    = 0),
                                               spread(name     = "AAACHF",
                                                      currency = "CHF",
                                                      rating   = "AAA"),
                                               spread(name     = "AAACHF",
                                                      currency = "EUR",
                                                      rating   = "AAA",
                                                      scale    = 0)))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(cashflow(10L, "EUR", "AAA", 0.01, 1000), market.risk = mr)(simulations),
               703.836048337421 * (exp(4 + -2) - 1))

  # checks with vector instead of matrix
  simulations.vec <- c(4,10,2,3)

  expect_equal(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr)(simulations.vec),
               932.393819905948 * (exp(-1 * 2 + -1 * 3 + -4) - 1))
  expect_equal(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = F)(simulations.vec),
               932.393819905948 * (exp(-1 * 2 + -1 * 3 ) - 1))

  # checks with wrong colnames
  simulations <- matrix(c(4,10,2,3), nrow = 1)
  colnames(simulations) <- c("a", "b", "c", "d")

  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = T)(simulations),
               "names")
  expect_error(valFunction(cashflow(1L, "CHF", "AAA", 0.06, 1000), market.risk = mr, with.constant = F)(simulations),
               "names")
})
