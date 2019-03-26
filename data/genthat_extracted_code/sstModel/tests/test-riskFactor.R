# unit tests for riskFactor
context("S3 classes inheriting from riskFactor")

# checking constructor
test_that("riskFactor is ok", {

  #----- currency
  expect_error(currency())
  expect_error(currency(from = "CHF"))

  ## types
  expect_error(currency(name = "jack", from = 1, to = "CHF"),
               "types")
  expect_error(currency(name = 1, from = "1", to = "CHF"),
               "types")

  expect_error(currency(name = "1", from = "1", to = TRUE),
               "types")
  expect_error(currency(name = list("CHFUSD"), from = "CHF", to = "USD"),
               "types")

  ## dimensions
  expect_error(currency(name = character(), from = "CHF", to = "USD"),
               "dimensions")
  expect_error(currency(name = c("CHFUSD", "CHFEUR"), from = "CHF",
                        to = "USD"),
               "dimensions")

  ## Missing values
  expect_error(currency(name = "CHFUSD", from = as.character(NA), to = "USD"),
               "Missing values")

  expect_error(currency(name = "CHFUSD", from = "CHF", to = as.character(NA)),
               "Missing values")

  ## Same currency
  expect_error(currency(name = "CHFCHF", from = "CHF", to = "CHF"),
               "Invalid")

  ## valid currency
  d <- currency(name = "CHFUSD", from = "CHF", to = "USD")

  ## checking internal representation of attributes
  expect_equal(length(d), 9)
  expect_equal(is.data.frame(d), TRUE)
  expect_equal(names(d), c("name", "scale", "scaled", "type", "currency",
                           "from", "to", "horizon", "rating"))
  expect_equal(all(sapply(list(d$scale, d$currency, d$horizon, d$rating),
                          is.na)), TRUE)
  expect_equal(d$scaled, FALSE)
  expect_equal(c(d$name, d$from, d$to), c("CHFUSD", "CHF", "USD"))

  ## checking class membership
  expect_equal(is.currency(d), TRUE)
  expect_equal(is.riskFactor(d), TRUE)



  #----- rate
  expect_error(rate())
  expect_error(rate(name = "CHF2Y"))

  ## types
  expect_error(rate(name = "jack", currency = 1, horizon = "l"),
               "types")
  expect_error(rate(name = 1, currency = "CHF", horizon = "l"),
               "types")

  expect_error(rate(name = "jack", currency = "CHF", horizon = T),
               "types")
  expect_error(rate(name = "jack", currency = list("CHF"), horizon = "l"),
               "types")
  expect_error(rate(name = "jack", currency = "CHF", horizon = "l",
                    scale = "b"),
               "types")
  expect_error(rate(name = "jack", currency = "CHF", horizon = "l",
                    scale = list(1)),
               "types")

  ## dimensions
  expect_error(rate(name = character(), currency = "CHF", horizon = "l"),
               "dimensions")
  expect_error(rate(name = "jack", currency = c("CHF", "USD"), horizon = "l"),
               "dimensions")
  expect_error(rate(name = "jack", currency = c("CHF", "USD"), horizon = "l"),
               "dimensions")
  expect_error(rate(name = "jack", currency = "CHF", horizon = character()),
               "dimensions")
  expect_error(rate(name = "jack", currency = "CHF", horizon = "l",
                    scale = c(1, 2)),
               "dimensions")
  expect_error(rate(name = "jack", currency = "CHF", horizon = "l",
                    scale = numeric()),
               "dimensions")
  expect_error(rate(name = c("PC1","PC2"), currency = "CHF", horizon = "l"),
               "linear")
  expect_error(rate(name = c("PC1","PC2"), currency = "CHF", horizon = "l",
                    scale = c(0.1)),
               "dimensions")

  ## Missing values
  expect_error(rate(name = "jack", currency = "CHF", horizon = "l",
                    scale = as.numeric(NA)),
               "Missing values")

  expect_error(rate(name = as.character(NA), currency = "CHF", horizon = "l",
                    scale = 2),
               "Missing values")
  expect_error(rate(name = "jack", currency = as.character(NA), horizon = "l",
                    scale = 2),
               "Missing values")
  expect_error(rate(name = "jack", currency = "CHF",
                    horizon = as.character(NA),
                    scale = 2),
               "Missing values")

  ## Warning
  expect_warning(rate(name = "jack", currency = "CHF",
                      horizon = "l",
                      scale = 0),
                 "efficiency")

  ## valid rates
  d <- rate(name = "CHF2Y", currency = "CHF", horizon = "l")
  ds <- rate(name = "CHF2Y", currency = "CHF", horizon = "l", scale = 0.5)
  dm <- rate(name = c("PC1RateCHF", "PC2RateCHF"),
             currency = c("CHF"),
             horizon = c("l"),
             scale = c(0.5, 0.2))

  ## checking internal representation of attributes
  expect_equal(length(d), 9)
  expect_equal(is.data.frame(d), TRUE)
  expect_equal(names(d), c("name", "scale", "scaled", "type", "currency",
                           "from", "to", "horizon", "rating"))

  expect_equal(length(ds), 9)
  expect_equal(is.data.frame(ds), TRUE)
  expect_equal(names(ds), c("name", "scale", "scaled", "type", "currency",
                            "from", "to", "horizon", "rating"))

  expect_equal(length(dm), 9)
  expect_equal(is.data.frame(dm), TRUE)
  expect_equal(names(dm), c("name", "scale", "scaled", "type", "currency",
                            "from", "to", "horizon", "rating"))

  expect_equal(all(sapply(list(d$scale, d$from, d$to, d$rating),
                          is.na)), TRUE)
  expect_equal(d$scaled, FALSE)
  expect_equal(c(d$name, d$currency, d$horizon), c("CHF2Y", "CHF", "l"))

  expect_equal(all(sapply(list(ds$from, ds$to, ds$rating),
                          is.na)), TRUE)
  expect_equal(ds$scaled, TRUE)
  expect_equal(c(ds$name, ds$scale, ds$currency, ds$horizon),
               c("CHF2Y", 0.5, "CHF", "l"))

  expect_equal(all(sapply(list(dm$from, dm$to, dm$rating),
                          is.na)), TRUE)
  expect_equal(dm$scaled, c(TRUE,TRUE))
  expect_equal(c(dm$name, dm$scale, dm$currency, dm$horizon),
               c("PC1RateCHF", "PC2RateCHF",
                 0.5, 0.2,
                 "CHF", "CHF",
                 "l", "l"))

  ## checking class membership
  expect_equal(is.rate(d), TRUE)
  expect_equal(is.riskFactor(d), TRUE)

  expect_equal(is.rate(ds), TRUE)
  expect_equal(is.riskFactor(ds), TRUE)

  expect_equal(is.rate(dm), TRUE)
  expect_equal(is.riskFactor(dm), TRUE)

  #----- pcRate
  expect_error(pcRate())
  expect_error(pcRate(name = "CHF2Y"))

  ## types
  expect_error(pcRate(name = c("pc1", "pc2"), currency = 1),
               "types")
  expect_error(pcRate(name = c(1,2), currency = c("CHF", "CHF")),
               "types")

  expect_error(pcRate(name = c("pc1", "pc2"), currency = list("CHF", "CHF")),
               "types")
  expect_error(pcRate(name = c("pc1", "pc2"), currency = c("CHF", "CHF"),
                    scale = c("a","b")),
               "types")
  expect_error(pcRate(name = c("pc1", "pc2"), currency = c("CHF", "CHF"),
                    scale = list(1)),
               "types")

  ## dimensions
  expect_error(pcRate(name = character(), currency = c("CHF")),
               "dimensions")
  expect_error(pcRate(name = c("pc1", "pc2"), currency = c("USD"),
                    scale = c(1)),
               "dimensions")
  expect_error(pcRate(name = c("pc1", "pc2"), currency = c("CHF", "CHF"),
                    scale = numeric()),
               "dimensions")

  ## Missing values
  expect_error(pcRate(name = c("pc1"), currency = c("CHF"),
                    scale = as.numeric(c(NA))),
               "Missing values")

  expect_error(pcRate(name = as.character(c(NA)), currency = c("CHF"),
                    scale = c(2)),
               "Missing values")
  expect_error(pcRate(name = c("pc1"), currency = as.character(c(NA)),
                    scale = c(2)),
               "Missing values")

  ## Warning
  expect_warning(pcRate(name = c("pc1"), currency = c("CHF"),
                      scale = c(0)),
                 "efficiency")

  ## valid pcRates
  dm <- pcRate(name = c("PC1RateCHF"),
             currency = c("CHF"))

  ## checking internal representation of attributes
  expect_equal(length(dm), 9)
  expect_equal(is.data.frame(dm), TRUE)
  expect_equal(names(dm), c("name", "scale", "scaled", "type", "currency",
                            "from", "to", "horizon", "rating"))

  expect_equal(all(sapply(list(dm$from, dm$to, dm$rating),
                          is.na)), TRUE)
  expect_equal(dm$scaled, c(FALSE))
  expect_equal(c(dm$name, dm$scaled, dm$currency),
               c("PC1RateCHF",
                 FALSE,
                 "CHF"))

  ## checking class membership
  expect_equal(is.pcRate(dm), TRUE)
  expect_equal(is.riskFactor(dm), TRUE)



  #----- spread
  expect_error(spread())
  expect_error(spread(name = "CHF2Y"))

  ## types
  expect_error(spread(name = "jack", currency = 1, rating = "l"),
               "types")
  expect_error(spread(name = 1, currency = "CHF", rating = "l"),
               "types")

  expect_error(spread(name = "jack", currency = "CHF", rating = T),
               "types")
  expect_error(spread(name = "jack", currency = list("CHF"), rating = "l"),
               "types")
  expect_error(spread(name = "jack", currency = "CHF", rating = "l",
                    scale = "b"),
               "types")
  expect_error(spread(name = "jack", currency = "CHF", rating = "l",
                    scale = list(1)),
               "types")

  ## dimensions
  expect_error(spread(name = character(), currency = "CHF", rating = "l"),
               "dimensions")
  expect_error(spread(name = "jack", currency = c("CHF", "USD"), rating = "l"),
               "dimensions")
  expect_error(spread(name = "jack", currency = c("CHF", "USD"), rating = "l"),
               "dimensions")
  expect_error(spread(name = "jack", currency = "CHF", rating = character()),
               "dimensions")
  expect_error(spread(name = "jack", currency = "CHF", rating = "l",
                    scale = c(1, 2)),
               "dimensions")
  expect_error(spread(name = "jack", currency = "CHF", rating = "l",
                    scale = numeric()),
               "dimensions")
  expect_error(spread(name = c("PC1","PC2"), currency = "CHF", rating = "l"),
               "dimensions")
  expect_error(spread(name = c("PC1","PC2"), currency = "CHF", rating = "l",
                      scale = c(0.1)),
               "dimensions")

  ## Missing values
  expect_error(spread(name = "jack", currency = "CHF", rating = "l",
                    scale = as.numeric(NA)),
               "Missing values")

  expect_error(spread(name = as.character(NA), currency = "CHF", rating = "l",
                    scale = 2),
               "Missing values")
  expect_error(spread(name = "jack", currency = as.character(NA), rating = "l",
                    scale = 2),
               "Missing values")
  expect_error(spread(name = "jack", currency = "CHF",
                      rating = as.character(NA),
                      scale = 2),
               "Missing values")

  ## valid spreads
  d <- spread(name = "CHF2Y", currency = "CHF", rating = "l")
  ds <- spread(name = "CHF2Y", currency = "CHF", rating = "l", scale = 0.5)

  ## checking internal representation of attributes
  expect_equal(length(d), 9)
  expect_equal(is.data.frame(d), TRUE)
  expect_equal(names(d), c("name", "scale", "scaled", "type", "currency",
                           "from", "to", "horizon", "rating"))

  expect_equal(length(ds), 9)
  expect_equal(is.data.frame(ds), TRUE)
  expect_equal(names(ds), c("name", "scale", "scaled", "type", "currency",
                            "from", "to", "horizon", "rating"))

  expect_equal(all(sapply(list(d$scale, d$from, d$to, d$horizon),
                          is.na)), TRUE)
  expect_equal(d$scaled, FALSE)
  expect_equal(c(d$name, d$type, d$currency, d$rating), c("CHF2Y", "spread", "CHF", "l"))

  expect_equal(all(sapply(list(ds$from, ds$to, ds$horizon),
                          is.na)), TRUE)
  expect_equal(ds$scaled, TRUE)
  expect_equal(c(ds$name, ds$scale, ds$type, ds$currency, ds$rating), c("CHF2Y", 0.5, "spread","CHF", "l"))

  ## checking class membership
  expect_equal(is.spread(d), TRUE)
  expect_equal(is.riskFactor(d), TRUE)

  expect_equal(is.spread(ds), TRUE)
  expect_equal(is.riskFactor(ds), TRUE)


  #----- equity
  expect_error(equity())
  expect_error(equity(name = "CHF2Y"))

  ## types
  expect_error(equity(name = "jack", currency = 1, type = "l"),
               "types")
  expect_error(equity(name = 1, currency = "CHF", type = "l"),
               "types")

  expect_error(equity(name = "jack", currency = "CHF", type = T),
               "types")
  expect_error(equity(name = "jack", currency = list("CHF"), type = "l"),
               "types")
  expect_error(equity(name = "jack", currency = "CHF", type = "l",
                      scale = "b"),
               "types")
  expect_error(equity(name = "jack", currency = "CHF", type = "l",
                      scale = list(1)),
               "types")

  ## dimensions
  expect_error(equity(name = character(), currency = "CHF", type = "l"),
               "dimensions")
  expect_error(equity(name = "jack", currency = c("CHF", "USD"), type = "l"),
               "dimensions")
  expect_error(equity(name = "jack", currency = c("CHF", "USD"), type = "l"),
               "dimensions")
  expect_error(equity(name = "jack", currency = "CHF", type = character()),
               "dimensions")
  expect_error(equity(name = "jack", currency = "CHF", type = "l",
                      scale = c(1, 2)),
               "dimensions")
  expect_error(equity(name = "jack", currency = "CHF", type = "l",
                      scale = numeric()),
               "dimensions")
  expect_error(equity(name = c("PC1","PC2"), currency = "CHF", type = "l"),
               "dimensions")
  expect_error(equity(name = c("PC1","PC2"), currency = "CHF", type = "l",
                      scale = c(0.1)),
               "dimensions")

  ## Missing values
  expect_error(equity(name = "jack", currency = "CHF", type = "l",
                      scale = as.numeric(NA)),
               "Missing values")

  expect_error(equity(name = as.character(NA), currency = "CHF", type = "l",
                      scale = 2),
               "Missing values")
  expect_error(equity(name = "jack", currency = as.character(NA), type = "l",
                      scale = 2),
               "Missing values")
  expect_error(equity(name = "jack", currency = "CHF",
                      type = as.character(NA),
                      scale = 2),
               "Missing values")

  ## Warning
  expect_warning(equity(name = "jack", currency = "CHF",
                        type = "l",
                        scale = 0),
                 "efficiency")

  ## valid equitys
  d <- equity(name = "CHF2Y", currency = "CHF", type = "l")
  ds <- equity(name = "CHF2Y", currency = "CHF", type = "l", scale = 0.5)

  ## checking internal representation of attributes
  expect_equal(length(d), 9)
  expect_equal(is.data.frame(d), TRUE)
  expect_equal(names(d), c("name", "scale", "scaled", "type", "currency",
                           "from", "to", "horizon", "rating"))

  expect_equal(length(ds), 9)
  expect_equal(is.data.frame(ds), TRUE)
  expect_equal(names(ds), c("name", "scale", "scaled", "type", "currency",
                            "from", "to", "horizon", "rating"))

  expect_equal(all(sapply(list(d$scale, d$from, d$to, d$horizon, d$rating),
                          is.na)), TRUE)
  expect_equal(d$scaled, FALSE)
  expect_equal(c(d$name, d$currency, d$type), c("CHF2Y", "CHF", "l"))

  expect_equal(all(sapply(list(ds$from, ds$to, ds$horizon, d$rating),
                          is.na)), TRUE)
  expect_equal(ds$scaled, TRUE)
  expect_equal(c(ds$name, ds$scale, ds$currency, ds$type),
               c("CHF2Y", 0.5, "CHF", "l"))

  ## checking class membership
  expect_equal(is.equity(d), TRUE)
  expect_equal(is.riskFactor(d), TRUE)

  expect_equal(is.equity(ds), TRUE)
  expect_equal(is.riskFactor(ds), TRUE)


  #---- mapping Table
  expect_error(mappingTable())

  ## some scaled risk-factors undefined mapping
  expect_error(mappingTable(equity(name = "EC", type = "HF",
                                   currency = "CHF", scale = 0.5)),
               "undefined")
  expect_error(mappingTable(equity(name = "EC", type = "HF",
                                   currency = "CHF", scale = 0.5),
                            equity(name = "EC2", type = "EQ",
                                   currency = "CHF")),
               "undefined")


  ## duplicates
  expect_error(mappingTable(equity(name = "EC", type = "HF",
                                   currency = "CHF"),
                            equity(name = "EC2", type = "HF",
                                   currency = "CHF")),
               "Duplicated")

  expect_error(mappingTable(rate(name = "2YCHF", currency = "CHF",
                                 horizon = "k"),
                            rate(name = "2YCHF", currency = "CHF",
                                 horizon = "k", scale = 0.5)),
               "Duplicated")

  expect_error(mappingTable(rate(name = "2YCHF", currency = "CHF",
                                 horizon = "k"),
                            rate(name = "2YCHF", currency = "CHF",
                                 horizon = "l")),
               "more than once")


  ## scaled from currency
  expect_error(mappingTable(currency(name = "CHFUSD", from = "CHF",
                                     to = "USD"),
                            rate(name = "CHFUSD", currency = "CHF",
                                 horizon = "k", scale = 0.5)),
               "currency")

  ## defining in undefined currency
  expect_error(mappingTable(currency(name = "CHFUSD", from = "CHF",
                                     to = "USD"),
                            rate(name = "2YEUR", currency = "EUR",
                                 horizon = "k")),
               "currencies")

  expect_error(mappingTable(rate(name = "2YUSD", currency = "USD",
                                     horizon = "k"),
                            rate(name = "2YEUR", currency = "EUR",
                                 horizon = "k")),
               "currencies")

  ## multiple to currencies
  expect_error(mappingTable(currency(name = "CHFUSD", from = "CHF",
                                     to = "USD"),
                            currency(name = "JPYEUR", from = "JPY",
                                 to = "EUR")),
               "currency")

  ## issues with pca
  expect_error(mappingTable(pcRate(name = c("PC1"),
                                   currency = c("CHF")),
                            pcRate(name = c("PC2"),
                                   currency = c("CHF")),
                            rate(name = c("PC1", "PC2", "PC3"),
                                 currency = c("CHF"),
                                 horizon = c("m"),
                                 scale = c(0.9, 0.1, sqrt(1- (0.1^2 + 0.9^2))))), "undefined")

  ## valid mappingTable
  m <- mappingTable(currency(name = "CHFUSD", from = "CHF", to = "USD"),
                    rate(name = "2YCHF", currency = "CHF", horizon = "k"),
                    equity(name = "hf", currency = "CHF", type = "hf"),
                    equity(name = "hf", currency = "USD", type = "hf",
                           scale = 0.5))

  ## checking internal representation of attributes
  expect_equal(length(m), 9)
  expect_equal(is.data.frame(m), TRUE)
  expect_equal(names(m), c("name", "scale", "scaled", "type", "currency",
                           "from", "to", "horizon", "rating"))

  ## checking class membership
  expect_equal(is.mappingTable(m), TRUE)

})

