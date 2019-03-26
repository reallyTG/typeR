# unit tests for S3 class asset
context("asset: valuation")

test_that("asset: valInfo method is ok", {

  ## false inputs
  expect_error(valInfo.asset())
  expect_error(valInfo(cashflow(time     = 1L,
                                currency = "CHF",
                                rating   = "AAA",
                                value    = 10)))

  ## a first example without scaled factors
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

  l <- valInfo.asset(asset(type     = "equity",
                           currency = "CHF",
                           value    = 100),
                     market.risk = mr)

  expect_equal(l$exposure, 100)
  expect_equal(l$constant, as.numeric(-0.5 * t(c(0, 1, 0, 0) %*%
                                                 mr$cov.mat %*% c(0, 1, 0, 0))))
  expect_equal(l$risk.factor$name, "equityCHF")
  expect_equal(l$risk.factor$id, 2L)
  expect_equal(l$risk.factor$scale, 1)

  ## a second example with scaled risk factors
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
                                equity(name     = "equityCHF",
                                       currency = "EUR",
                                       type     = "equity",
                                       scale    = 2))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.asset(asset(type     = "equity",
                           currency = "EUR",
                           value    = 100),
                     market.risk = mr)

  expect_equal(l$exposure, 100 * 1.05)
  expect_equal(l$constant, as.numeric(-0.5 * t(c(1, 2, 0, 0) %*%
                                                 mr$cov.mat %*% c(1, 2, 0, 0))))
  expect_equal(l$risk.factor$name, c("equityCHF", "EURCHF"))
  expect_equal(l$risk.factor$id, c(2L,1L))
  expect_equal(l$risk.factor$scale, c(2, 1))

})

test_that("asset: valExpression method is OK", {

  ## false inputs
  expect_error(valExpression.asset())
  expect_error(valExpression.asset(cashflow(time     = 1L,
                                      currency = "CHF",
                                      rating   = "AAA",
                                      value    = 10)))


  ## a first example without scaled factors
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

  expect_equal(valExpression.asset(asset("equity", "CHF", 1000), market.risk = mr),
               "1000 * (exp(`equityCHF` + -2) - 1)")

  ## a second example with scaled risk factors (with scale = 3)
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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 3))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression.asset(asset("equity", "EUR", 1000), market.risk = mr),
               "1050 * (exp(3 * `equityCHF` + `EURCHF` + -20) - 1)")

  # a third example with scaled risk factors (with scale=1)
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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 1))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression.asset(asset("equity", "EUR", 1000), market.risk = mr),
               "1050 * (exp(`equityCHF` + `EURCHF` + -4) - 1)")

  # a fourth example with scaled risk factors (with scale = 0)
  expect_warning(mapping.table <- mappingTable(currency(name = "EURCHF",
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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 0)))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression.asset(asset("equity", "EUR", 1000), market.risk = mr),
               "1050 * (exp(`EURCHF` + -2) - 1)")



})

test_that("asset: valExpression method with standalones is OK", {

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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 0.5))
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


  expect_true(is.na(valExpression(object = asset("equity", "CHF", 1000),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        equity(name     = "equityCHF",
                                               type     = "equity",
                                               currency = "EUR")))))

  expect_equal(valExpression(object = asset("equity", "EUR", 1000),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        currency(name = "EURCHF",
                                                 from = "EUR",
                                                 to   = "CHF"))),
               "1050 * (exp(`EURCHF` + -2) - 1)")

  vi <- valInfo(object = asset("equity", "EUR", 1000),
               market.risk = mr,
               standalone = standalone(name = "a name",
                                       currency(name = "EURCHF",
                                       from = "EUR",
                                       to   = "CHF")))

  expect_equal(vi$constant, as.numeric(-0.5 * t(c(1, 0, 0, 0) %*%
                                                  mr$cov.mat %*% c(1, 0, 0, 0))))

})

test_that("asset: valFunction method is OK", {

  ## false inputs
  expect_error(valFunction.asset())
  expect_error(valFunction.asset(cashflow(time     = 1L,
                                          currency = "CHF",
                                          rating   = "AAA",
                                          value    = 10)))
  expect_error(valFunction.asset(cashflow(time     = 1L,
                                          currency = "CHF",
                                          rating   = "AAA",
                                          value    = 10),
                                 market.risk = list(1, 2, 3)))


  ## a first example without scaled factors
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

  # type checks (with constant)
  simulations <- matrix(c("a", "b", "c", "d"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr)(simulations),
               "types")

  simulations <- c(1,2,3)
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr)(simulations),
               "Missing")

  # type checks (without constant)
  simulations <- matrix(c("a", "b", "c", "d"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = F)(simulations),
               "types")

  simulations <- c(1,2,3)
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = F)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = F)(simulations),
               "Missing")

  ## validation: battery of tests
  simulations <- matrix(c(10,5,4,3), nrow=1)
  colnames(simulations) <- name

  expect_equal(valFunction(asset("equity", "CHF", 1000), market.risk = mr)(simulations),
               1000 * (exp(5 + -2) - 1))

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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 3))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)


  expect_equal(valFunction(asset("equity", "EUR", 1000), market.risk = mr)(simulations),
               1050 * (exp(3 * 5 + 10 + -20) - 1))

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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 1))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(asset("equity", "EUR", 1000), market.risk = mr)(simulations),
               1050 * (exp(5 + 10 + -4) - 1))

  expect_warning(mapping.table <- mappingTable(currency(name = "EURCHF",
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
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "EUR",
                                       scale    = 0)))

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(asset("equity", "EUR", 1000), market.risk = mr)(simulations),
               1050 * (exp(10 + -2) - 1))


  # checks with vector instead of matrix
  simulations.vec <- c(10,5,4,3)

  expect_equal(valFunction(asset("equity", "CHF", 1000), market.risk = mr)(simulations.vec),
               1000 * (exp(5 + -2) - 1))
  expect_equal(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = F)(simulations.vec),
               1000 * (exp(5) - 1))

  # checks with wrong colnames
  simulations <- matrix(c(10,5,4,3), nrow=1)
  colnames(simulations) <- c("a", "b", "c", "d")

  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = T)(simulations),
               "names")
  expect_error(valFunction(asset("equity", "CHF", 1000), market.risk = mr, with.constant = F)(simulations),
               "names")

  expect_error(valFunction(asset("equity", "GBP", 1000), market.risk = mr, with.constant = F)(simulations),
               "Invalid")

})
