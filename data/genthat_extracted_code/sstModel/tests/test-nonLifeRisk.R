# unit tests for S3 class nonLifeRisk
context("nonLifeRisk S3 class")

# checking constructor
test_that("nonLifeRisk: checks at construction are ok", {

  # error when some parameters are missing
  expect_error(nonLifeRisk(type = "cdf"))
  expect_error(nonLifeRisk(param = list("cdf")))
  expect_error(nonLifeRisk(currency = "CHF"))

  # general checks
  expect_error(nonLifeRisk(type = 1, param = list(simulations = c(1,2)),
                           currency = c("CHF")),
               "type")
  expect_error(nonLifeRisk(type = c("simulations", "cdf"), param = list(simulations = c(1,2)),
                           currency = c("CHF")),
               "type")
  expect_error(nonLifeRisk(type = "density", param = list(simulations = c(1,2)),
                           currency = c("CHF")),
               "type")

  expect_error(nonLifeRisk(type = "simulations", param = c(1,2),
                           currency = c("CHF")),
               "list")
  expect_error(nonLifeRisk(type = "simulations", param = data.frame(simulations = c(1,2)),
                           currency = c("CHF")),
               "list")
  expect_error(nonLifeRisk(type = "simulations", param = list(c(1,2)),
                           currency = c("CHF")),
               "named")

  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,2)),
                           currency = c(1)),
               "type")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,2)),
                           currency = c("CHF", "EUR")),
               "type")

  # type == "simulations" param checks
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,2), other = c(1,2)),
                           currency = c("CHF")),
               "dimensions")
  expect_error(nonLifeRisk(type = "simulations", param = list(other = c(1,2)),
                           currency = c("CHF")),
               "param")
  expect_error(nonLifeRisk(type = "simulations", param = list(other = c(1,2)),
                           currency = c("CHF")),
               "param")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c()),
                           currency = c("CHF")),
               "simulations")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c("a")),
                           currency = c("CHF")),
               "types")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(NA,1)),
                           currency = c("CHF")),
               "Missing")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,NaN)),
                           currency = c("CHF")),
               "Missing")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,2)),
                           currency = as.character(NA)),
               "Missing")
  expect_error(nonLifeRisk(type = "simulations", param = list(simulations = c(1,-Inf)),
                           currency = c("CHF")),
               "finite")

  # type == "log-normal" param checks
  expect_error(nonLifeRisk(type = "log-normal", param = list(mu=3),
                           currency = c("CHF")),
               "dimensions")
  expect_error(nonLifeRisk(type = "log-normal", param = list(mu = 3, var = 2),
                           currency = c("CHF")),
               "param")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = c(1,2),
                                                              mu = 3),
                           currency = c("CHF")),
               "dimensions")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = 1,
                                                             mu = "a"),
                           currency = c("CHF")),
               "Invalid mu")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = 1,
                                                             mu = NA),
                           currency = c("CHF")),
               "Invalid mu")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = 1,
                                                             mu    = Inf),
                           currency = c("CHF")),
               "Invalid mu")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = "a",
                                                             mu = 1),
                           currency = c("CHF")),
               "Invalid sigma")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = NA,
                                                             mu = 1),
                           currency = c("CHF")),
               "Invalid sigma")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = Inf,
                                                             mu = 1),
                           currency = c("CHF")),
               "Invalid sigma")
  expect_error(nonLifeRisk(type = "log-normal", param = list(sigma = 0,
                                                             mu = 1),
                           currency = c("CHF")),
               "Invalid sigma")

  # type == "cdf" param checks
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = c(1,2), x = c(1,2)),
                           currency = c("CHF")),
               "dimensions")
  expect_error(nonLifeRisk(type = "cdf", param = list(x = c(1,2)),
                           currency = c("CHF")),
               "param")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = c(1,2)),
                           currency = c("CHF")),
               "data.frame")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1), y = c(2))),
                           currency = c("CHF")),
               "data.frame")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c("a","b"), cdf = c(2,1))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,NA), cdf = c(2,1))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,Inf), cdf = c(2,1))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c("a", "b"))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c(0.1, NA))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c(0.1, Inf))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(2,1), cdf = c(0,0.3))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c(0,1.5))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c(0.1,0.5))),
                           currency = c("CHF")),
               "Invalid column")
  expect_error(nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(1,2), cdf = c(0.5,0))),
                           currency = c("CHF")),
               "Invalid column")

})

test_that("nonLifeRisk: internal structure is ok", {

  # a valid object
  d <- nonLifeRisk(type = "simulations", param = list(simulations = rnorm(100)),
                   currency = "CHF")

  # checking class membership
  expect_equal(is.nonLifeRisk(d), TRUE)
  expect_equal(is.insuranceRisk(d), TRUE)
  expect_equal(is.risk(d), TRUE)
  expect_equal(is.list(d), TRUE)
})

test_that("nonLifeRisk: check method is OK", {

  # a valid object
  d <- nonLifeRisk(type     = "simulations",
                   param    = list(simulations = c(1, 1, 2, 3, 4)),
                   currency = "CHF")

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

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  expect_true(check(d, mr))


  d <- nonLifeRisk(type        = "simulations",
                   param       =  list(simulations=c(1, 1, 2, 3, 4)),
                   currency    = "USD")

  expect_false(check(d, mr))

})


test_that("nonLifeRisk: standard methods are ok", {

  # format
  expect_equal(class(format(nonLifeRisk(type        = "simulations",
                                        param       =  list(simulations=c(1, 1, 2, 3, 4)),
                                        currency    = "USD"))),
               "character")
  expect_equal(class(format(nonLifeRisk(type = "cdf",
                                        param = list(cdf = data.frame(x = c(1), cdf = c(1))),
                                        currency = c("CHF")))),
               "character")
  expect_equal(class(format(nonLifeRisk(type = "log-normal",
                                        param = list(sigma = 2,
                                                     mu    = 1),
                                        currency = c("CHF")))),
               "character")

  # summary
  expect_equal(class(summary(nonLifeRisk(type        = "simulations",
                                         param       =  list(simulations=c(1, 1, 2, 3, 4)),
                                         currency    = "USD"))),
               c("summaryDefault", "table"))
  expect_equal(class(summary(nonLifeRisk(type = "cdf",
                                         param = list(cdf = data.frame(x = c(1), cdf = c(1))),
                                         currency = c("CHF")))),
               c("summaryDefault", "table"))
  expect_equal(class(summary(nonLifeRisk(type = "log-normal",
                                          param = list(sigma = 2,
                                                       mu    = 1),
                                          currency = c("CHF")))),
               c("summaryDefault", "table"))

  # print
  expect_equal(class(print(nonLifeRisk(type        = "simulations",
                                       param       =  list(simulations=c(1, 1, 2, 3, 4)),
                                       currency    = "USD"))),
               "NULL")
  expect_equal(class(print(nonLifeRisk(type = "cdf",
                                       param = list(cdf = data.frame(x = c(1), cdf = c(1))),
                                       currency = c("CHF")))),
               "NULL")
  expect_equal(class(print(nonLifeRisk(type = "log-normal",
                                       param = list(sigma = 2,
                                                    mu    = 1),
                                       currency = c("CHF")))),
               "NULL")

})
