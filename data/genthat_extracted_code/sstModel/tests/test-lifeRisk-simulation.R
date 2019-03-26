# unit tests for healthRisk simulation
context("lifeRisk simulation")

test_that("lifehRisk: simulation/compute methods are OK", {

  # create a market risk
  cov.mat <- diag(2, 2, 2) %*% diag(rep(1, 2)) %*% diag(2, 2, 2)
  name <- c("2YCHF","EURCHF")
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

  # create a life risk and life item
  corr.mat <- diag(c(1, 1))
  colnames(corr.mat) <- c("storno", "invalidity")
  rownames(corr.mat) <- colnames(corr.mat)

  lr <- lifeRisk(corr.mat = corr.mat, quantile = c(0.995, 0.995))
  l <- life(name        = c("storno", "invalidity"),
            currency    = c("CHF", "CHF"),
            sensitivity = c(12, 25))

  # input values checks (simulate)
  expect_error(simulate(lr, nsim = "a"),
               "types")
  expect_error(simulate(lr, nsim = 2, seed = "a"),
               "types")

  expect_error(simulate(lr, nsim = c(1, 2)),
               "dimensions")
  expect_error(simulate(lr, nsim = 2, seed = c(1, 2)),
               "dimensions")

  expect_error(simulate(lr, nsim = as.integer(NA)),
               "Missing")
  expect_error(simulate(lr, nsim = 2, seed = as.integer(NA)),
               "Missing")

  # input values checks (compute)
  expect_error(compute(lr, nsim = 2, market.risk = list(), life.item = l),
               "types")
  expect_error(compute(lr, nsim = 2, market.risk = mr, life.item = list()),
               "types")

  expect_error(compute(lr, nsim = "a", market.risk = mr, life.item = l),
               "types")
  expect_error(compute(lr, nsim = 2, seed = "a", market.risk = mr, life.item = l),
               "types")

  expect_error(compute(lr, nsim = c(1, 2), market.risk = mr, life.item = l),
               "dimensions")
  expect_error(compute(lr, nsim = 2, seed = c(1, 2), market.risk = mr, life.item = l),
               "dimensions")

  expect_error(compute(lr, nsim = as.integer(NA), market.risk = mr, life.item = l),
               "Missing")
  expect_error(compute(lr, nsim = 2, seed = as.integer(NA), market.risk = mr, life.item = l),
               "Missing")

  # validation: battery of tests
  expect_equal({simulate(lr, seed = 10, nsim = 50)},
               {set.seed(10); rnorm(n = 50)})
  expect_equal({simulate(lr, nsim = 50, seed = 10, sd = 5)},
               {set.seed(10); rnorm(n = 50, sd = 5)})

  expect_equal({compute(lr, market.risk = mr, life.item =  l, nsim = 50, seed = 10)$lifeRisk},
               {set.seed(10); rnorm(n = 50, sd = valInfo(l, market.risk = mr, life.risk = lr))})

})

