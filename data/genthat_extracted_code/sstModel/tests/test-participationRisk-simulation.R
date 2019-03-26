# unit tests for participation simulation
context("participationRisk simulation")

test_that("participationRisk: simulation/compute methods are OK", {

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

  # create item and risk
  p  <- participation(currency = "CHF", value = 10000)
  pr <- participationRisk(volatility = 0.5)

  # input values checks (simulate)
  expect_error(simulate(pr, nsim = list()),
               "types")
  expect_error(simulate(pr, nsim = 2, seed = list()),
               "types")

  expect_error(simulate(pr, nsim = "a"),
               "types")
  expect_error(simulate(pr, nsim = 2, seed = "a"),
               "types")

  expect_error(simulate(pr, nsim = c(1, 2)),
               "dimensions")
  expect_error(simulate(pr, nsim = 2, seed = c(1, 2)),
               "dimensions")

  expect_error(simulate(pr, nsim = as.integer(NA)),
               "Missing")
  expect_error(simulate(pr, nsim = 2, seed = as.integer(NA)),
               "Missing")

  expect_error(simulate(pr, nsim = -2),
               "positive")
  expect_error(simulate(pr, nsim = 2, seed = -1),
               "positive")

  # input values checks (compute)
  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = list()),
               "types")
  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = 2, seed = list()),
               "types")

  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = "a"),
               "types")
  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = 2, seed = "a"),
               "types")

  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = as.integer(NA)),
               "Missing")
  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = 2, seed = as.integer(NA)),
               "Missing")

  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = -2),
               "positive")
  expect_error(compute(pr, market.risk = mr, participation.item = p, nsim = 2, seed = -1),
               "positive")

  # validation: randomization
  set.seed(0)
  for(s in 0:10) {


  # random values
  r.value      <- sample(x = 1:10000, size = 1, replace = F)
  r.volatility <- rexp(n = 1, rate = 1)

  p  <- participation(currency = "CHF", value = r.value)
  pr <- participationRisk(volatility = r.volatility)

  expect_equal({simulate(pr, nsim = 2, seed = s)},
               {set.seed(s); rnorm(n = 2, sd = r.volatility)})

  expect_equal({set.seed(s); compute(pr, market.risk = mr, participation.item = p, nsim = 2, seed = s)$participation},
               {set.seed(s); r.value*(exp(rnorm(2, sd = r.volatility) - 0.5 * r.volatility^2) - 1)})
  }

})
