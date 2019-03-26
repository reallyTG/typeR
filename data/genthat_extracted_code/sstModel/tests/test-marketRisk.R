# unit tests for marketRisk
context("S3 class marketRisk")

# checking constructor
test_that("marketRisk: checks at construction are ok", {

  ## a valid input
  cov.mat <- diag(rep(1, 4))
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

  expect_true(is.marketRisk(mr))
  expect_true(is.list(mr))
  expect_equal(length(mr), 7)

  # covariance matrix checks
  cov.mat <- matrix(c(1,0,0,1,0,0), ncol=3)
  name <- c("EURCHF", "equityCHF")
  rownames(cov.mat) <- name
  colnames(cov.mat) <- c(name, "add")
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = list(),
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "covariance")
  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  cov.mat <- diag(rep(NA, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  cov.mat <- diag(rep(-1, 4))

  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  cov.mat <- diag(rep(1, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  cov.mat <- diag(rep(1, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  cov.mat <- diag(rep(1, 4))
  cov.mat[2,3] <- 1
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"


  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time),
               "Invalid covariance")


  cov.mat <- diag(rep(1, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time),
               "Invalid covariance")

  cov.mat <- diag(c(rep(2, 3), Inf))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time),
               "Invalid covariance")

  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"))

  # volas checks
  cov.mat <- diag(1000000, 4)
  colnames(cov.mat) <- name
  rownames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_warning(marketRisk(cov.mat        = cov.mat,
                            mapping.table  = mapping.table,
                            initial.values = initial.values,
                            base.currency  = "CHF",
                            mapping.time   = mapping.time),
                 "infinite")


  # number of risk-factor checks
  cov.mat <- matrix(numeric(), ncol=0)
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                            mapping.table  = mapping.table,
                            initial.values = initial.values,
                            base.currency  = "CHF",
                            mapping.time   = mapping.time),
                 "Invalid covariance")

  # name checks
  cov.mat <- diag(rep(1, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  rownames(cov.mat) <- name
  rownames(cov.mat)[1] <- ""
  colnames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "Invalid covariance")

  # mapping.table checks
  cov.mat <- diag(rep(1, 4))
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  rownames(cov.mat) <- name
  colnames(cov.mat) <- name
  attr(cov.mat, "base.currency") <- "CHF"

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = list(),
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "mapping.table")

  # names are well defined & risk-factors are exactly defined once
  mapping.table <- mappingTable(currency(name = "EURCHF",
                                         from = "EUR",
                                         to   = "CHF"),
                                equity(name     = "equityCHF",
                                       type     = "equity",
                                       currency = "CHF"),
                                rate(name     = "2YCHF",
                                     currency = "CHF",
                                     horizon  = "k"),
                                rate(name     = "2YEUR",
                                     currency = "EUR",
                                     horizon  = "k"),
                                spread(name     = "AAACHF",
                                       currency = "CHF",
                                       rating   = "AAA"))

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "mapping.table")

  # initial values checks
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

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = c(),
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "initial.values")

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = list(initial.fx = c()),
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "initial.values")

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = list(c(1,2,3), c(3,4,5)),
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "initial.values")

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = list(initial.fx=c(1,2,3), b=c(3,4,5)),
                          mapping.time   = mapping.time,
                          base.currency  = "CHF"),
               "initial.values")

  # initial fx checks
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

  initial.values$initial.fx <- data.frame(from             = NULL,
                                          to               = NULL,
                                          fx               = NULL,
                                          stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          mapping.time   = mapping.time),
               "initial.fx")

  initial.values$initial.fx <- data.frame(from             = "JPY",
                                          to               = "CHF",
                                          fx               = 1.1,
                                          stringsAsFactors = F)

  expect_error(marketRisk(cov.mat       = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "initial.fx")

  initial.values$initial.fx <- data.frame(from             = "JPY",
                                          to               = "CHF",
                                          fx               = -1.1,
                                          stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "positive")

  # initial rates checks
  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = as.character(NA),
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "initial.rate")

  initial.values$initial.rate <- data.frame(time             = Inf,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "finite")

  initial.values$initial.rate <- data.frame(time             = 1,
                                            currency         = 1,
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "types")

  initial.values$initial.rate <- data.frame(time             = 1.1,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "integer")

  initial.values$initial.rate <- data.frame(time             = -1,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  expect_error(marketRisk(cov.mat       = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "positive")

  initial.values$initial.rate <- data.frame(time             = 1,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)


  ## mapping.time checks
  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = 1, stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "types")

  mapping.time <- data.frame(time = 1L, mapping = as.character(NA),
                             stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "Missing values")

  mapping.time <- data.frame(time = 1.1, mapping = "k", stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "integer")

  mapping.time <- data.frame(time = -1, mapping = "k", stringsAsFactors = F)

  expect_error(marketRisk(cov.mat        = cov.mat,
                          mapping.table  = mapping.table,
                          initial.values = initial.values,
                          base.currency  = "CHF",
                          mapping.time   = mapping.time),
               "positive")

  mapping.time <- data.frame(time = 1, mapping = "k", stringsAsFactors = F)

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = "CHF",
                                            rate             = 0.01,
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  # getInitialFX
  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  expect_equal(getInitialFX(marketRisk(cov.mat        = cov.mat,
                                       mapping.table  = mapping.table,
                                       initial.values = initial.values,
                                       base.currency  = "CHF",
                                       mapping.time   = mapping.time),
                            from = "EUR",
                            to   = "CHF"),
               1.05)


  expect_equal(getInitialRate(marketRisk(cov.mat      = cov.mat,
                                       mapping.table  = mapping.table,
                                       initial.values = initial.values,
                                       base.currency  = "CHF",
                                       mapping.time   = mapping.time),
                              currency = "CHF",
                              time     = 1L),
               0.01)

  expect_equal(getMappingTime(marketRisk(cov.mat        = cov.mat,
                                         mapping.table  = mapping.table,
                                         initial.values = initial.values,
                                         base.currency  = "CHF",
                                         mapping.time   = mapping.time),
                              time = 1L),
               "k")

  expect_equal(getEquityName(marketRisk(cov.mat        = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                             type = "equity",
                             currency = "CHF"),
               "equityCHF")

  expect_equal(getEquityId(marketRisk(cov.mat        = cov.mat,
                                      mapping.table  = mapping.table,
                                      initial.values = initial.values,
                                      base.currency  = "CHF",
                                      mapping.time   = mapping.time),
                           type = "equity",
                           currency = "CHF"),
               2)

  expect_equal(getEquityScale(marketRisk(cov.mat       = cov.mat,
                                         mapping.table  = mapping.table,
                                         initial.values = initial.values,
                                         base.currency  = "CHF",
                                         mapping.time   = mapping.time),
                             type = "equity",
                             currency = "CHF"),
               1)

  expect_equal(getCurrencyName(marketRisk(cov.mat       = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                             from = "EUR",
                             to = "CHF"),
               "EURCHF")

  expect_equal(getCurrencyId(marketRisk(cov.mat       = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                               from = "EUR",
                               to = "CHF"),
               1L)

  expect_equal(getCurrencyScale(marketRisk(cov.mat       = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                             from = "EUR",
                             to = "CHF"),
               1)

  expect_equal(getRateName(marketRisk(cov.mat       = cov.mat,
                                      mapping.table  = mapping.table,
                                      initial.values = initial.values,
                                      base.currency  = "CHF",
                                      mapping.time   = mapping.time),
                            currency = "CHF",
                            horizon = "k"),
               "2YCHF")


  expect_equal(getRateId(marketRisk(cov.mat       = cov.mat,
                                      mapping.table  = mapping.table,
                                      initial.values = initial.values,
                                    base.currency  = "CHF",
                                      mapping.time   = mapping.time),
                           currency = "CHF",
                           horizon = "k"),
               3L)

  expect_equal(getRateScale(marketRisk(cov.mat       = cov.mat,
                                    mapping.table  = mapping.table,
                                    initial.values = initial.values,
                                    base.currency  = "CHF",
                                    mapping.time   = mapping.time),
                         currency = "CHF",
                         horizon = "k"),
               1)

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

  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(getSpreadName(marketRisk(cov.mat       = cov.mat,
                                      mapping.table  = mapping.table,
                                      initial.values = initial.values,
                                      base.currency  = "CHF",
                                      mapping.time   = mapping.time),
                           currency = "CHF",
                           rating = "AAA"),
               "AAACHF")

  expect_equal(getSpreadId(marketRisk(cov.mat       = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                             currency = "CHF",
                             rating = "AAA"),
               4L)

  expect_equal(getSpreadScale(marketRisk(cov.mat       = cov.mat,
                                        mapping.table  = mapping.table,
                                        initial.values = initial.values,
                                        base.currency  = "CHF",
                                        mapping.time   = mapping.time),
                             currency = "CHF",
                             rating = "AAA"),
               1)

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
                                spread(name     = "AAACHF",
                                       currency = "EUR",
                                       rating   = "AAA",
                                       scale    = 0.5))
  mr <- marketRisk(cov.mat       = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_equal(getSpreadScale(marketRisk(cov.mat       = cov.mat,
                                         mapping.table  = mapping.table,
                                         initial.values = initial.values,
                                         base.currency  = "CHF",
                                         mapping.time   = mapping.time),
                              currency = "EUR",
                              rating = "AAA"),
               0.5)

  expect_equal(getDeltaId(marketRisk(cov.mat       = cov.mat,
                                         mapping.table  = mapping.table,
                                         initial.values = initial.values,
                                         base.currency  = "CHF",
                                         mapping.time   = mapping.time),
                              name=c("2YCHF", "AAACHF")),
               c(3,4))


})


test_that("marketRisk: standard methods are ok", {

  ## a valid input
  cov.mat <- diag(rep(1, 4))
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

  # format
  expect_equal(class(format(mr)),
               "character")

  # summary
  expect_equal(class(summary(mr)),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(mr)),
               "NULL")

})

