# unit tests for S3 class portfolio
context("portfolio S3 class")

# checking constructor
test_that("constructor of portfolio is ok", {

  ## define a bunch of market, insurance and participation item
  a1 <- asset(type = "hedgeFund", currency = "CHF", value = 10)
  a2 <- asset(type = "equity", currency = "USD", value = 100)

  fxF <- fxForward(domestic = "CHF", foreign = "USD", time = 1L,
                   nominal = 100, rate = 1.1, position = "short")

  p <- participation(currency = "CHF", value=10)

  d <- life(name        = c("equity", "2YCHF", "EURCHF"),
            currency    = c("CHF", "CHF", "CHF"),
            sensitivity = c(100, 150, 130))

  h <- health(name        = c("equity", "2YCHF", "EURCHF"),
              currency    = c("CHF", "CHF", "CHF"),
              sensitivity = c(100, 150, 130))

  # valid portfolio parameters
  valid.param <- list(mvm = list(mvm.life = 1, mvm.health = 3, mvm.nonlife = 2),
                      rtkr = 0,
                      rtkg = 0,
                      correction.term = 2,
                      credit.risk = 3,
                      expected.insurance.result =  10^6,
                      expected.financial.result =  10^5)

  ## cheching types
  expect_error(portfolio())
  expect_error(portfolio(market.items    = a1,
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = valid.param),
               "Invalid types")
  expect_error(portfolio(market.items    = list(),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = valid.param),
               "Invalid dimensions")
  expect_error(portfolio(market.items    = list(1, 2),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = valid.param),
               "Invalid type")
  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = as.character(NA),
                         portfolio.parameters = valid.param),
               "Missing values")

  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = list(p, p),
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = valid.param),
               "Invalid types")

  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = list()),
               "Invalid types")

  expect_error(portfolio(market.items    = list(a1),
                        participation.item  = p,
                        life.item       = d,
                        health.item     = h,
                        base.currency  = "CHF",
                        portfolio.parameters = list(1,2,3,3,4,3,2)),
              "Invalid types")

  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = list(a=1,b=1)),
               "Missing or invalid")

  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = list(mvm = 3,
                                                     rtkr = NA,
                                                     rtkg = 0,
                                                     credit.risk = 2,
                                                     correction.term = 10^5,
                                                     expected.insurance.result =  10^6,
                                                     expected.financial.result =  10^5,
                                                     volatility.participation = 0.25)),
               "Missing")

  expect_error(portfolio(market.items    = list(a1),
                         participation.item  = p,
                         life.item       = d,
                         health.item     = h,
                         base.currency  = "CHF",
                         portfolio.parameters = list(mvm = 3,
                                                     rtkr = c(NA,NA),
                                                     rtkg = 0,
                                                     credit.risk = 3,
                                                     correction.term = 10^5,
                                                     expected.insurance.result =  10^6,
                                                     expected.financial.result =  10^5)),
               "dimensions")

  ## define a valid portfolio
  pf <- portfolio(market.items    = list(a1),
                  participation.item  = p,
                  life.item       = d,
                  health.item     = h,
                  base.currency  = "CHF",
                  portfolio.parameters = valid.param)

  ## partial inputs
  pf <- portfolio(market.items    = list(a1),
                  life.item       = d,
                  health.item     = h,
                  base.currency  = "CHF",
                  portfolio.parameters = valid.param)

  # checking internal representation of attributes
  expect_equal(length(pf), 6)
  expect_equal(names(pf), c("market.items", "participation.item",
                            "life.item", "health.item",
                            "base.currency", "portfolio.parameters"))

  # checking class membership
  expect_equal(is.portfolio(pf), TRUE)
  expect_equal(is.list(pf), TRUE)

})


test_that("portfolio: standard methods are ok", {

  # inputs
  a1 <- asset(type = "hedgeFund", currency = "CHF", value = 10)

  valid.param <- list(mvm = list(mvm.life = 1, mvm.health = 3, mvm.nonlife = 2),
                      rtkr = 0,
                      rtkg = 0,
                      correction.term = 2,
                      credit.risk = 3,
                      expected.insurance.result =  10^6,
                      expected.financial.result =  10^5)


  # format
  expect_equal(class(format(portfolio(market.items    = list(a1),
                                      participation.item  = NULL,
                                      life.item       = NULL,
                                      health.item     = NULL,
                                      base.currency  = "CHF",
                                      portfolio.parameters = valid.param))),
               "character")

  # summary
  expect_equal(class(summary(portfolio(market.items    = list(a1),
                                       participation.item  = NULL,
                                       life.item       = NULL,
                                       health.item     = NULL,
                                       base.currency  = "CHF",
                                       portfolio.parameters = valid.param))),
               "summary.portfolio")

  # print
  expect_equal(class(print(portfolio(market.items    = list(a1),
                                     participation.item  = NULL,
                                     life.item       = NULL,
                                     health.item     = NULL,
                                     base.currency  = "CHF",
                                     portfolio.parameters = valid.param))),
               "NULL")

})

test_that("portfolio: generateExpression and generateFunction are ok", {

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

  valid.param <- list(mvm = list(mvm.life = 1, mvm.health = 3, mvm.nonlife = 2),
                      rtkr = 0,
                      rtkg = 0,
                      correction.term = 2,
                      credit.risk = 3,
                      expected.insurance.result =  10^6,
                      expected.financial.result =  10^5)

  p <- portfolio(market.items    = list(asset("equity", "CHF", 1000)),
            participation.item  = NULL,
            life.item       = NULL,
            health.item     = NULL,
            base.currency  = "CHF",
            portfolio.parameters = valid.param)

  # generate expression
  expect_equal(generateExpression.portfolio(p, market.risk = mr, market.item.types = "all"),
               "1000 * (exp(`equityCHF` + -2) - 1)")

  # generate function
  f <- generateFunction(p, market.item.types = "all", market.risk = mr)

  simulation.mat <- matrix(c(1, 2, 3, 4), nrow = 1)
  colnames(simulation.mat) <- mr$name

  expect_equal(f(simulation.mat), 1000 * (exp(2) - 1))

  expect_true(is.null(generateExpression(p, market.risk = mr, market.item.types = "liability")))

  p <- portfolio(market.items    = list(asset("equity", "CHF", 1000),
                                        liability(time = 1L, currency = "CHF", value = 50)),
                 participation.item  = NULL,
                 life.item       = NULL,
                 health.item     = NULL,
                 base.currency  = "CHF",
                 portfolio.parameters = valid.param)

  expect_equal(generateExpression(p, market.risk = mr, market.item.types = "all"),
               "1000 * (exp(`equityCHF` + -2) - 1) + -49.5024916874584 * (exp(-1 * `2YCHF` + -2) - 1)")

  expect_equal(generateExpression(p, market.risk = mr, market.item.types = "asset"),
               "1000 * (exp(`equityCHF` + -2) - 1)")

  expect_equal(generateExpression(p, market.risk = mr, market.item.types = "liability"),
               "-49.5024916874584 * (exp(-1 * `2YCHF` + -2) - 1)")

  g <- generateFunction(p, market.risk = mr)

  expect_equal(g(simulation.mat), 1000 * (exp(2)-1) - 50 * exp(-0.01) * (exp(-3)-1))

  p <- portfolio(market.items    = list(asset("equity", "CHF", 1000),
                                        liability(time = 1L, currency = "CHF", value = 50)),
                 participation.item  = participation(currency = "CHF", value = 45),
                 life.item       = NULL,
                 health.item     = NULL,
                 base.currency  = "CHF",
                 portfolio.parameters = valid.param)

  simulation.mat <- matrix(c(1, 2, 3, 4, 5), nrow = 1)
  colnames(simulation.mat) <- c(mr$name, "participation")

  expect_equal(generateFunction(p, market.risk = mr)(simulation.mat),
               1000 * (exp(2)-1) - 50 * exp(-0.01) * (exp(-3)-1) + 45 * (exp(5) -1))
})
