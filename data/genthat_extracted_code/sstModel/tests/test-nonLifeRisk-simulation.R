# unit tests for healthRisk simulation
context("nonLifeRisk simulation")

test_that("simulation for nonLifeRisk is OK", {

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

  nl1 <- nonLifeRisk(type     = "simulations",
                     param    = list(simulations=c(1, 2, 3, 4)),
                     currency = "CHF")

  expect_error(simulate(nl1, nsim = "a"), "type")
  expect_error(simulate(nl1, nsim = 2L, seed = "a"), "type")
  expect_error(compute(nl1, market.risk = 2,
                                  nsim = 2L), "type")

  expect_equal({set.seed(10); simulate(nl1, nsim = 2L)},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 2)})

  expect_equal({set.seed(10); simulate(nl1, nsim = 4L)},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 4)})

  expect_equal({set.seed(10); simulate(nl1, nsim = 10L)},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 10, replace = T)})

  expect_equal({set.seed(10); compute(nl1, market.risk = mr, nsim = 2L)$nonLifeRisk},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 2)})

  expect_equal({set.seed(10); compute(nl1, market.risk = mr, nsim = 4L)$nonLifeRisk},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 4)})

  expect_equal({set.seed(10); compute(nl1, market.risk = mr, nsim = 10L)$nonLifeRisk},
               {set.seed(10); sample(c(1, 2, 3, 4), size = 10, replace = T)})

  nl3 <- nonLifeRisk(type = "log-normal", param = list(mu = 1, sigma = 2), currency = "CHF")

  expect_equal({set.seed(10); simulate(nl3, market.risk = mr, nsim = 3L)},
               {set.seed(10); rnorm(3, 1, 2)})

  expect_equal({set.seed(10); compute(nl3, market.risk = mr, nsim = 3L)$nonLifeRisk},
               {set.seed(10); -(exp(rnorm(3, 1, 2)) - exp(1 + 2))})

  nl4 <- nonLifeRisk(type = "cdf", param = list(cdf = data.frame(x = c(0,1,2,3), cdf = c(0.3,0.7,0.9, 1))), currency = "CHF")

  expect_equal({set.seed(10); simulate(nl4, market.risk = mr, nsim = 3L)},
               c(0, 1, 0))

  expect_equal({set.seed(10); compute(nl4, market.risk = mr, nsim = 3L)$nonLifeRisk},
               c(0, 1, 0))

})

