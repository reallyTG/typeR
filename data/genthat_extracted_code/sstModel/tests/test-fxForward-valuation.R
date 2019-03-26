# unit tests for S3 class fxForward
context("fxForward: valuation")

test_that("fxForward: valInfo method is ok", {

  ## a first example
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

  l <- valInfo.fxForward(fxForward(domestic = "CHF",
            foreign  = "EUR",
            time     = 1L,
            nominal  = 10,
            rate     = 1.1,
            position = "long"),
            mr)

  expect_equal(l$fx.rate.liability.term$currency, "EUR")
  expect_equal(l$fixed.rate.liability.term$currency, "CHF")

})


test_that("fxForward: valExpression method is OK", {

  ## a first example
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

  expect_equal(valExpression(fxForward(domestic = "CHF",
                                       foreign  = "EUR",
                                       time     = 1L,
                                       nominal  = 10,
                                       rate     = 1.1,
                                       position = "long"),
                              mr),
               "10.3955232543663 * (exp(-0.75 * `2YCHF` + `EURCHF` + -3.125) - 1) + -10.8905481712408 * (exp(-1 * `2YCHF` + -2) - 1)")

  expect_equal(valExpression(fxForward(domestic = "CHF",
                                       foreign  = "EUR",
                                       time     = 1L,
                                       nominal  = 10,
                                       rate     = 1.1,
                                       position = "short"),
                             mr),
               "-10.3955232543663 * (exp(-0.75 * `2YCHF` + `EURCHF` + -3.125) - 1) + 10.8905481712408 * (exp(-1 * `2YCHF` + -2) - 1)")

})


test_that("fxForward: valExpression method with standalones is ok", {

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

  expect_true(is.na(valExpression(object = fxForward(domestic = "CHF",
                                                                   foreign  = "EUR",
                                                                   time     = 1L,
                                                                   nominal  = 10,
                                                                   rate     = 1.1,
                                                                   position = "short"),
                                  market.risk = mr,
                                  standalone = standalone(name = "a name",
                                                          equity(name     = "AAACHF",
                                                                 currency = "EUR",
                                                                 type     = "equity")))))

  expect_equal(valExpression(object = fxForward(domestic = "CHF",
                                   foreign  = "EUR",
                                   time     = 1L,
                                   nominal  = 10,
                                   rate     = 1.1,
                                   position = "short"),
                market.risk = mr,
                standalone = standalone(name = "a name",
                                        rate(name     = "2YCHF",
                                               currency = "EUR",
                                               horizon     = "k",
                                             scale = 0.75))),
               "-10.3955232543663 * (exp(-0.75 * `2YCHF` + -1.125) - 1)")

  expect_equal(valExpression(object = fxForward(domestic = "CHF",
                                                foreign  = "EUR",
                                                time     = 1L,
                                                nominal  = 10,
                                                rate     = 1.1,
                                                position = "long"),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     rate(name     = "2YCHF",
                                                          currency = "EUR",
                                                          horizon     = "k",
                                                          scale = 0.75))),
               "10.3955232543663 * (exp(-0.75 * `2YCHF` + -1.125) - 1)")

  expect_equal(valExpression(object = fxForward(domestic = "CHF",
                                                foreign  = "EUR",
                                                time     = 1L,
                                                nominal  = 10,
                                                rate     = 1.1,
                                                position = "short"),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     rate(name     = "2YCHF",
                                                          currency = "EUR",
                                                          horizon     = "k",
                                                          scale = 0.75),
                                                     currency(name = "EURCHF",
                                                              from = "EUR",
                                                              to   = "CHF"))),
               "-10.3955232543663 * (exp(-0.75 * `2YCHF` + `EURCHF` + -3.125) - 1)")

  expect_equal(valExpression(object = fxForward(domestic = "CHF",
                                                foreign  = "EUR",
                                                time     = 1L,
                                                nominal  = 10,
                                                rate     = 1.1,
                                                position = "long"),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     rate(name     = "2YCHF",
                                                          currency = "CHF",
                                                          horizon     = "k"))),
               "-10.8905481712408 * (exp(-1 * `2YCHF` + -2) - 1)")

  expect_equal(valExpression(object = fxForward(domestic = "CHF",
                                                foreign  = "EUR",
                                                time     = 1L,
                                                nominal  = 10,
                                                rate     = 1.1,
                                                position = "short"),
                             market.risk = mr,
                             standalone = standalone(name = "a name",
                                                     rate(name     = "2YCHF",
                                                          currency = "CHF",
                                                          horizon     = "k"))),
               "10.8905481712408 * (exp(-1 * `2YCHF` + -2) - 1)")


})

test_that("fxForward: valFunction method is OK", {

  ## a first example
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

  simulations <- matrix(c(1,2), nrow=1)
  colnames(simulations) <- name

  expect_equal(valFunction(fxForward(domestic = "CHF",
                                       foreign  = "EUR",
                                       time     = 1L,
                                       nominal  = 10,
                                       rate     = 1.1,
                                       position = "long"),
                             mr)(simulations),
               10.3955232543663 * (exp(-0.75 * 1 + 2 + -3.125) - 1) - 10.8905481712408 * (exp(-1 * 1 + -2) - 1))

  expect_equal(valFunction(fxForward(domestic = "CHF",
                                       foreign  = "EUR",
                                       time     = 1L,
                                       nominal  = 10,
                                       rate     = 1.1,
                                       position = "short"),
                             mr)(simulations),
               10.8905481712408 * (exp(-1 * 1 + -2) - 1) - 10.3955232543663 * (exp(-0.75 * 1 + 2 + -3.125) - 1))

  # wrong input
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           list(1, 2, 3))(simulations),
               "fxForward")

  # vector input
  simulations.vec <- c(1, 2)
  expect_equal(valFunction(fxForward(domestic = "CHF",
                                      foreign  = "EUR",
                                      time     = 1L,
                                      nominal  = 10,
                                      rate     = 1.1,
                                      position = "short"),
                           mr)(simulations.vec),
               10.8905481712408 * (exp(-1 * 1 + -2) - 1) - 10.3955232543663 * (exp(-0.75 * 1 + 2 + -3.125) - 1))

  expect_equal(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr, with.constant = F)(simulations.vec),
               10.8905481712408 * (exp(-1 * 1) - 1) - 10.3955232543663 * (exp(-0.75 * 1 + 2) - 1))

  # invalid types
  simulations.vec <- c("a", "b", "c", "d")

  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr)(simulations.vec),
               "types")
  
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr, with.constant = F)(simulations.vec),
               "types")

  # invalid dimensions
  simulations.vec <- c(2, 5, 5, 6)
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr)(simulations.vec),
               "dimensions")
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr, with.constant = F)(simulations.vec),
               "dimensions")

  # missing values
  simulations <- matrix(c(NA, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr)(simulations),
               "Missing")
  
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr, with.constant = F)(simulations),
               "Missing")

  # wrong names
  simulations <- matrix(c(2, 5), nrow = 1)
  colnames(simulations) <- c("a", "b")
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr)(simulations),
               "names")
  expect_error(valFunction(fxForward(domestic = "CHF",
                                     foreign  = "EUR",
                                     time     = 1L,
                                     nominal  = 10,
                                     rate     = 1.1,
                                     position = "short"),
                           mr, with.constant = F)(simulations),
               "names")

})
