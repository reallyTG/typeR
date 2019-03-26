# unit tests for marketRisk simulation
context("marketRisk simulation")

test_that("marketRisk: simulate and compute methods are OK", {

  # a valid input
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


  # input values checks (simulate)
  expect_error(simulate(mr, nsim = "a"),
               "types")
  expect_error(simulate(mr, nsim = -4),
               "nsim")
  expect_error(simulate(mr, nsim = 2, seed = "a"),
               "types")

  expect_error(simulate(mr, nsim = c(1, 2)),
               "dimensions")
  expect_error(simulate(mr, nsim = 2, seed = c(1, 2)),
               "dimensions")

  expect_error(simulate(mr, nsim = as.integer(NA)),
               "Missing")
  expect_error(simulate(mr, nsim = 2, seed = as.integer(NA)),
               "Missing")

  # input values checks (compute)
  a <- list(asset(type = "equity", currency = "CHF", value = 1000))
  expect_error(compute(mr, nsim = "a", market.items = a),
               "types")
  expect_error(compute(mr, nsim = 2, seed = "a", market.items = a),
               "types")

  expect_error(compute(mr, nsim = c(1, 2), market.items = a),
               "dimensions")
  expect_error(compute(mr, nsim = 2, seed = c(1, 2), market.items = a),
               "dimensions")

  expect_error(compute(mr, nsim = as.integer(NA), market.items = a),
               "Missing")
  expect_error(compute(mr, nsim = 2, seed = as.integer(NA), market.items = a),
               "Missing")

  expect_equal({simulate(mr, 2L, seed = 10, DT = F)},
                   {set.seed(10); s <- MASS::mvrnorm(2, mu = rep(0, 4), Sigma = cov.mat);
                   colnames(s) <- name; s})

  expect_equal({simulate(mr, 2.4, seed = 10, DT = T)},
                   {set.seed(10); s <- MASS::mvrnorm(2, mu = rep(0, 4), Sigma = cov.mat);
                   colnames(s) <- name; data.table::as.data.table(s)})

  expect_equal({simulate(mr, 2L, seed = 10, DT = F)},
                   {set.seed(10); s <- MASS::mvrnorm(2, mu = rep(0, 4), Sigma = cov.mat);
                   colnames(s) <- name; s})

  market.items <- list(asset(type = "equity", currency = "CHF", value = 100),
                      liability(time = 1L, currency = "CHF", value = -10),
                      cashflow(time = 1L, currency = "CHF", rating = "AAA", spread = 0.06, value = 5))

  expect_error(compute(mr, market.items = c(1, 2), nsim = 2L), "type")
  expect_error(compute(mr, market.items = list(), nsim = "a"), "dimensions")
  expect_error(compute(mr, market.items = list(1, 2), nsim = "a"), "elements")
  expect_error(compute(mr, market.items = market.items, standalones = list(), nsim = 1L), "dimensions")
  expect_error(compute(mr, market.items = market.items, standalones = list(1,2), nsim = "a"), "elements")
  expect_error(compute(mr, market.items = market.items, standalones = NULL, nsim = -4), "nsim")
  expect_error(compute(mr, market.items = append(market.items, asset(type = "equity", currency = "JPY", value = 10)),
                                                 standalones = NULL, nsim = 2L), "market.item")
  # non-nested computations
  expect_equal({compute(mr, market.items, seed = 10, nsim = 2L)$marketRisk},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(sapply(market.items, valExpression, market.risk = mr), collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})
  expect_equal({compute(mr, market.items, seed = 10, nsim = 2.4)$marketRisk},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(sapply(market.items, valExpression, market.risk = mr), collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})

  # nested computations

  # asset
  expect_equal({compute(mr, market.items, nsim = 2L, seed = 10,
                                      nested.market.computations = T)$asset},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(sapply(list(market.items[[1]]), valExpression, market.risk = mr), collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})

  # liability
  expect_equal({compute(mr, market.items, nsim = 2L, seed = 10,
                                      nested.market.computations = T)$liability},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(sapply(list(market.items[[2]]), valExpression, market.risk = mr), collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})

  # cashflow
  expect_equal({compute(mr, market.items, nsim = 2L, seed = 10,
                                      nested.market.computations = T)$cashflow},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(sapply(list(market.items[[3]]), valExpression, market.risk = mr), collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})




})


test_that("marketRisk compute method with standalones is OK", {

  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4))%*% diag(2, 4, 4)
  name <- c("EURCHF", "equityCHF", "2YCHF", "AAACHF")
  colnames(cov.mat) <- name
  rownames( cov.mat) <- name
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
                                     scale = 0.2),
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
                                            rate             = c(0.01, 0.02),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  mr <- marketRisk(cov.mat        = cov.mat,
                   mapping.table  = mapping.table,
                   initial.values = initial.values,
                   base.currency  = "CHF",
                   mapping.time   = mapping.time)

  market.items <- list(asset(type = "equity", currency = "CHF", value = 100),
                      liability(time = 1L, currency = "EUR", value = -10),
                      cashflow(time = 1L, currency = "CHF", rating = "AAA", spread = 0.06, value = 5),
                      delta(name = c("2YCHF", "equityCHF", "EURCHF"), currency = c("CHF", "CHF", "CHF"),
                            sensitivity = c(12, 23, 45)))

  s1 <- standalone(name = "curr", currency(name = "EURCHF", "EUR", "CHF"))
  s2 <- standalone(name = "rate", rate(name = "2YCHF", "CHF", "k"))

  # inconsistent standalone
  s3 <- standalone(name = "jpy", currency(name = "JPYCHF", "JPY", "CHF"))
  expect_error(compute(mr, market.items, nsim = 2L, seed = 10, standalones = list(s3)), "Inconsistent")

  s <- list(s1, s2)

  # s1
  # in case of non-nested computations
  expect_equal({(compute(mr, market.items, nsim = 2L, seed = 10, standalones = s))$curr},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(na.rm(sapply(market.items, valExpression, market.risk = mr,
                                          standalone = s1)),
                             collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})
  # in case of nested computations
  expect_equal({(compute(mr, market.items, nsim = 2L, seed = 10, standalones = s,
                                       nested.market.computations = T))$curr},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(na.rm(sapply(market.items, valExpression, market.risk = mr,
                                          standalone = s1)),
                             collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})

  # s2
  # in case of non-nested computations
  expect_equal({(compute(mr, market.items, nsim = 2L, seed = 10, standalones = s))$rate},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(na.rm(sapply(market.items, valExpression, market.risk = mr,
                                          standalone = s2)),
                             collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})
  # in case of nested computations
  expect_equal({(compute(mr, market.items, nsim = 2L, seed = 10, standalones = s,
                                       nested.market.computations = T))$rate},
               {set.seed(10); simulation.table <- simulate(mr, DT = T, nsim = 2L);
               expr <- paste(na.rm(sapply(market.items, valExpression, market.risk = mr,
                                          standalone = s2)),
                             collapse = " + ");
               eval(parse(text = paste0("simulation.table[, ", expr, "]")))})


})
