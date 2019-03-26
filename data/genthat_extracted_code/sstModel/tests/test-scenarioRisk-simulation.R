# unit tests for scenarioRisk simulations
context("scenarioRisk simulation")

test_that("scenarioRisk: simulation/compute methods are OK", {

  # a valid input
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

  d <- scenarioRisk(name        = c("terrorism", "eiffel tower collapse", "market crash"),
                    probability = c(0.1, 0.05, 0.2),
                    currency    = c("CHF", "CHF", "CHF"),
                    effect      = c(-100, -300, -50))

  # input values checks (simulate)
  expect_error(simulate(d, nsim = 2, market.risk = list()),
               "types")

  expect_error(simulate(d, nsim = "a", market.risk = mr),
               "types")
  expect_error(simulate(d, nsim = 2, seed = "a", market.risk = mr),
               "types")

  expect_error(simulate(d, nsim = c(1, 2), market.risk = mr),
               "dimensions")
  expect_error(simulate(d, nsim = 2, seed = c(1, 2), market.risk = mr),
               "dimensions")

  expect_error(simulate(d, nsim = as.integer(NA), market.risk = mr),
               "Missing")
  expect_error(simulate(d, nsim = 2, seed = as.integer(NA), market.risk = mr),
               "Missing")

  # input values checks (compute)
  expect_error(compute(d, nsim = 2, market.risk = list()),
               "types")

  expect_error(compute(d, nsim = "a", market.risk = mr),
               "types")
  expect_error(compute(d, nsim = 2, seed = "a", market.risk = mr),
               "types")

  expect_error(compute(d, nsim = c(1, 2), market.risk = mr),
               "dimensions")
  expect_error(compute(d, nsim = 2, seed = c(1, 2), market.risk = mr),
               "dimensions")

  expect_error(compute(d, nsim = as.integer(NA), market.risk = mr),
               "Missing")
  expect_error(compute(d, nsim = 2, seed = as.integer(NA), market.risk = mr),
               "Missing")

  # validation: battery of tests
  d <- scenarioRisk(name        = c("terrorism", "eiffel tower collapse", "market crash"),
                    probability = c(0.1, 0.05, 0.2),
                    currency    = c("CHF", "CHF", "CHF"),
                    effect      = c(-100, -300, -50))
  expect_equal({simulate(d, nsim = 50, seed = 10, market.risk = mr)},
               {set.seed(10); sample(x       = c(-100, -300, -50, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0.05, 0.2, 0.65))})
  expect_equal({compute(d, nsim = 50, seed = 11, market.risk = mr)$scenarioRisk},
               {set.seed(11); sample(x       = c(-100, -300, -50, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0.05, 0.2, 0.65))})

  expect_warning(d <- scenarioRisk(name = c("terrorism", "eiffel tower collapse",
                                            "market crash", "norman"),
                    probability = c(0.1, 0, 0.2, 0.6),
                    currency    = c("CHF", "CHF", "CHF", "CHF"),
                    effect      = c(-100, -300, -50, 0)))
  expect_equal({simulate(d, nsim = 50, seed = 11, market.risk = mr)},
               {set.seed(11); sample(x       = c(-100, -300, -50, 0, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0, 0.2, 0.6, 0.1))})
  expect_equal({compute(d, nsim = 50, seed = 11,  market.risk = mr)$scenarioRisk},
               {set.seed(11); sample(x       = c(-100, -300, -50, 0, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0, 0.2, 0.6, 0.1))})

  expect_warning(d <- scenarioRisk(name = c("terrorism", "eiffel tower collapse", "market crash"),
                    probability = c(0.1, 0, 0.2),
                    currency    = c("CHF", "CHF", "CHF"),
                    effect      = c(100, 300, 50)))
  expect_equal({simulate(d, nsim = 50, seed = 10, market.risk = mr)},
               {set.seed(10); sample(x       = c(100, 300, 50, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0, 0.2, 0.7))})
  expect_equal({compute(d, nsim = 50, seed = 10, market.risk = mr)$scenarioRisk},
               {set.seed(10); sample(x       = c(100, 300, 50, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0, 0.2, 0.7))})

  expect_warning(d <- scenarioRisk(name        = c("terrorism", "eiffel tower collapse", "market crash", "norman"),
                    probability = c(0.1, 0, 0.2, 0.6),
                    currency    = c("CHF", "CHF", "CHF", "CHF"),
                    effect      = c(100, 300, 50, 0)))
  expect_equal({simulate(d, nsim = 50, seed = 11, market.risk = mr)},
               {set.seed(11); sample(x       = c(100, 300, 50, 0, 0),
                                     size    = 50,
                                     replace = T,
                                     prob    = c(0.1, 0, 0.2, 0.6, 0.1))})
  expect_equal({compute(d, nsim = 50, seed = 11, market.risk = mr)$scenarioRisk},
               {set.seed(11); sample(x       = c(100, 300, 50, 0, 0),
                                    size    = 50,
                                    replace = T,
                                    prob    = c(0.1, 0, 0.2, 0.6, 0.1))})
})
