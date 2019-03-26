# unit tests for S3 class asset
context("liability: valuation")

test_that("liability: valInfo method is ok", {

  ## false inputs
  expect_error(valInfo.liability())
  expect_error(valInfo.liability(asset(type     = "hedgeFund",
                                       currency = "CHF",
                                       value    = 10)))
  expect_error(valInfo.liability(asset(type     = "hedgeFund",
                                       currency = "CHF",
                                       value    = 10),
                                 market.risk = list(1, 2, 3)))

  ## a first example
  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4)) %*% diag(2, 4, 4)
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

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.liability(liability(time     = 1L,
                                   currency = "CHF",
                                   value    = -100),
                         market.risk = mr)

  expect_equal(l$exposure, 100 * exp(-0.01))
  expect_equal(l$constant, as.numeric(-0.5 * t(c(0, 0, -1, 0) %*%
                                                 mr$cov.mat %*% c(0, 0, -1, 0))))
  expect_equal(l$risk.factor$name, "2YCHF")
  expect_equal(l$risk.factor$id, 3L)
  expect_equal(l$risk.factor$scale, -1)

  ## a second example
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
                                       currency = "CHF",
                                       rating   = "AAA"),
                                equity(name     = "equityCHF",
                                       currency = "EUR",
                                       type     = "equity",
                                       scale    = 2))

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  l <- valInfo.liability(liability(time     = 2L,
                                   currency = "EUR",
                                   value    = -100),
                         market.risk = mr)

  expect_equal(l$exposure, 100 * exp(-2*0.01) * 1.05)
  expect_equal(l$constant, as.numeric(-0.5 * t(c(1, 0, -2, 0) %*%
                                                 mr$cov.mat %*% c(1, 0, -2, 0))))

  expect_equal(l$risk.factor$name, c("2YCHF", "EURCHF"))
  expect_equal(l$risk.factor$id, c(3L,1L))
  expect_equal(l$risk.factor$scale, c(-2, 1))

  l <- valInfo.liability(liability(time     = 2L,
                                   currency = "EUR",
                                   value    = 100),
                         market.risk = mr)

  expect_equal(l$exposure, -100 * exp(-2*0.01) * 1.05)
  expect_equal(l$constant, as.numeric(-0.5 * t(c(1, 0, -2, 0) %*%
                                                 mr$cov.mat %*% c(1, 0, -2, 0))))

})

test_that("liability: valExpression method is OK", {

  ## a first example
  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4)) %*% diag(2, 4, 4)
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

  expect_equal(valExpression(liability(1L, "CHF", -1000), market.risk = mr),
               "990.049833749168 * (exp(-1 * `2YCHF` + -2) - 1)")

  ## a second example
  mapping.time <- data.frame(time = c(1L, 2L), mapping = c("k", "k"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L),
                                            currency         = c("CHF", "CHF"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(liability(2L, "CHF", -1000), market.risk = mr),
               "980.198673306755 * (exp(-2 * `2YCHF` + -8) - 1)")

  ## a third example
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
                                     horizon  = "m",
                                     scale    = 3))

  mapping.time <- data.frame(time = c(1L, 2L, 10L), mapping = c("k", "k", "m"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L, 10L),
                                            currency         = c("CHF", "CHF", "EUR"),
                                            rate             = c(0.01, 0.01, 0.03),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(liability(10L, "EUR", -1000), market.risk = mr),
               "777.859131715804 * (exp(-30 * `2YCHF` + `EURCHF` + -1802) - 1)")

  ## a fourth example
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
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "m",
                                     scale    = 0)))

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valExpression(liability(10L, "EUR", -1000), market.risk = mr),
               "777.859131715804 * (exp(`EURCHF` + -2) - 1)")

  expect_equal(valExpression(liability(10L, "EUR", 1000), mr),
               "-777.859131715804 * (exp(`EURCHF` + -2) - 1)")
})

test_that("liability: valExpression and valInfo with standalones are ok", {

  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4)) %*% diag(2, 4, 4)
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
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.75),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))
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


  expect_true(is.na(valExpression(object = liability(1L, "CHF", -1000),
                                  market.risk = mr,
                                  standalone = standalone(name = "a name",
                                                          rate(name     = "2YCHF",
                                                                 horizon = "k",
                                                                 currency = "EUR")))))

  expect_equal(valExpression(object = liability(1L, "EUR", -1000),
                                  market.risk = mr,
                                  standalone = standalone(name = "a name",
                                                          rate(name     = "2YCHF",
                                                               horizon = "k",
                                                               currency = "EUR",
                                                               scale    = 0.75))),
               "1039.55232543663 * (exp(-0.75 * `2YCHF` + -1.125) - 1)")

  expect_equal(valExpression(object = liability(1L, "EUR", -1000),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     currency(name     = "EURCHF",
                                                          from = "EUR",
                                                          to   = "CHF"))),
               "1039.55232543663 * (exp(`EURCHF` + -2) - 1)")

  expect_equal(valExpression(object = liability(1L, "EUR", 1000),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     currency(name     = "EURCHF",
                                                              from = "EUR",
                                                              to   = "CHF"))),
               "-1039.55232543663 * (exp(`EURCHF` + -2) - 1)")

  vi <- valInfo(object = liability(1L, "EUR", -1000),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        currency(name = "EURCHF",
                                                 from = "EUR",
                                                 to   = "CHF")))

  expect_equal(vi$constant, as.numeric(-0.5 * t(c(1, 0, 0, 0) %*%
                                       mr$cov.mat %*% c(1, 0, 0, 0))))
})

test_that("liability: liability:valFunction is OK", {

  ## a first example
  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4)) %*% diag(2, 4, 4)
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
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr)(simulations),
               "types")

  simulations <- c(1,2,3)
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr)(simulations),
               "Missing")

  # type checks (without constant)
  simulations <- matrix(c("a", "b", "c", "d"),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr, with.constant = F)(simulations),
               "types")

  simulations <- c(1,2, 3)
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr, with.constant = F)(simulations),
               "dimensions")

  simulations <- matrix(c(1, 2, NA, 4),nrow=1)
  colnames(simulations) <- name
  expect_error(valFunction(liability(1L, "CHF", -1000), market.risk = mr, with.constant = F)(simulations),
               "Missing")

  # validation: battery of tests
  simulations <- matrix(c(4,10,2,3), nrow = 1)
  colnames(simulations) <- name

  expect_equal(valFunction(liability(1L, "CHF", -1000), market.risk = mr)(simulations),
               990.049833749168 * (exp(-1 * 2 + -2) - 1))

  ## a second example
  mapping.time <- data.frame(time = c(1L, 2L), mapping = c("k", "k"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L),
                                            currency         = c("CHF", "CHF"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(liability(2L, "CHF", -1000), market.risk = mr)(simulations),
               980.198673306755 * (exp(-2 * 2 + -8) - 1))

  ## a third example
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
                                     horizon  = "m",
                                     scale    = 3))

  mapping.time <- data.frame(time = c(1L, 2L, 10L), mapping = c("k", "k", "m"), stringsAsFactors = F)
  initial.values$initial.rate <- data.frame(time             = c(1L, 2L, 10L),
                                            currency         = c("CHF", "CHF", "EUR"),
                                            rate             = c(0.01, 0.01, 0.03),
                                            stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(liability(10L, "EUR", -1000), market.risk = mr)(simulations),
               777.859131715804 * (exp(-30 * 2 + 4 + -1802) - 1))

  ## a fourth example
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
                                               rate(name     = "2YCHF",
                                                    currency = "EUR",
                                                    horizon  = "m",
                                                    scale    = 0)))

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(valFunction(liability(10L, "EUR", -1000), market.risk = mr)(simulations),
               777.859131715804 * (exp(4 + -2) - 1))

  expect_equal(valFunction(liability(10L, "EUR", 1000), mr)(simulations),
               -777.859131715804 * (exp(4 + -2) - 1))


  # checks with vector instead of matrix
  simulations.vec <- c(4, 10, 2, 3)

  expect_equal(valFunction(liability(10L, "EUR", 1000), mr)(simulations.vec),
               -777.859131715804 * (exp(4 + -2) - 1))
  expect_equal(valFunction(liability(10L, "EUR", 1000), mr, with.constant = F)(simulations.vec),
               -777.859131715804 * (exp(4) - 1))

  # checks with wrong colnames
  simulations <- matrix(c(4, 10, 2, 3), nrow = 1)
  colnames(simulations) <- c("a", "b", "c", "d")

  expect_error(valFunction(liability(10L, "EUR", 1000), market.risk = mr, with.constant = T)(simulations),
               "names")
  expect_error(valFunction(liability(10L, "EUR", 1000), market.risk = mr, with.constant = F)(simulations),
               "names")
})
