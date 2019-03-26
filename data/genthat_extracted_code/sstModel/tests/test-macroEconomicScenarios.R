# unit tests for macroEconomicScenarios
context("S3 class macroEconomicScenarios")

# checking constructor
test_that("macroEconomicScenarios: checks at construction are ok", {

  # economic.scenario.table checks
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = list()),
               "types")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = c(1,2,3)),
               "types")

  e <- matrix(c(1,2,3,4),nrow=1)
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Missing")

  e <- matrix(c(1,2,3,4),nrow=1)
  colnames(e) <- c("a","b","c","d")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Missing")

  e <- matrix(c(1,2,3,4),nrow=4)
  rownames(e) <- c("a","b","c","d")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Missing")

  e <- matrix(c(1,2,NA,4),nrow=4)
  rownames(e) <- c("a","b","c","d")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Missing")

  e <- matrix(c(1,2,NA,4),nrow=1)
  colnames(e) <- c("a","a","c","d")
  rownames(e) <- c("sc1")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Duplicated")

  e <- matrix(c(1,2,NA,4),nrow=4)
  colnames(e) <- c("a")
  rownames(e) <- c("sc1", "sc1", "sc2", "sc3")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Duplicated")

  e <- matrix(c("a", "b", "c", "d"),nrow=4)
  colnames(e) <- c("a")
  rownames(e) <- c("sc1", "sc2", "sc3", "sc4")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "type")

  e <- matrix(c(1, 2, 3, NA),nrow=4)
  colnames(e) <- c("a")
  rownames(e) <- c("sc1", "sc2", "sc3", "sc4")
  expect_error(macroEconomicScenarios(macro.economic.scenario.table = e), "Missing")

})

test_that("macroEconomicScenarios: internal structure is ok", {

  # a valid economicScenarios
  e <- matrix(c(1,2,3,4),nrow=4)
  rownames(e) <- c("a","b","c","d")
  colnames(e) <- c("e")
  eco <- macroEconomicScenarios(macro.economic.scenario.table = e)

  expect_equal(dim(eco$macro.economic.scenario.table), c(4,1))
  expect_equal(eco$risk.factor.names, "e")
  expect_equal(eco$macro.economic.scenario.names, c("a","b","c","d"))

})

test_that("macroEconomicScenarios: compute method is OK", {

  ## building marketRisk
  cov.mat <- diag(1, 4, 4) %*% diag(rep(1, 4)) %*% diag(1, 4, 4)
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
                                       rating   = "AAA"),
                                rate(name     = "2YCHF",
                                     currency = "EUR",
                                     horizon  = "k",
                                     scale    = 0.8))
  initial.values <- list()

  initial.values$initial.fx <- data.frame(from             = "EUR",
                                          to               = "CHF",
                                          fx               = 1.05,
                                          stringsAsFactors = F)

  initial.values$initial.rate <- data.frame(time             = 1L,
                                            currency         = c("CHF", "EUR"),
                                            rate             = c(0.01, 0.01),
                                            stringsAsFactors = F)

  mapping.time <- data.frame(time = 1L, mapping = "k", stringsAsFactors = F)

  ## define an economic scenario
  eco.table <- matrix(c(1,1,1,1,2,2,1,4,2,3),nrow=2)
  colnames(eco.table) <- c(name, "participation")
  rownames(eco.table) <- c("sc1","sc2")

  eco.scenario <- macroEconomicScenarios(macro.economic.scenario.table = eco.table)

  mr <- marketRisk(cov.mat                  = cov.mat,
                   mapping.table            = mapping.table,
                   initial.values           = initial.values,
                   base.currency            = "CHF",
                   mapping.time             = mapping.time)

  valid.param <- list(mvm  = list(mvm.life = 3, mvm.health = 1, mvm.nonlife = 3),
                      rtkr = 0,
                      rtkg = 0,
                      credit.risk = 3,
                      expected.insurance.result = 10^6,
                      expected.financial.result = 10^5,
                      correction.term = 3)

  p <- portfolio(market.items = list(asset(type = "equity", currency = "CHF", value = 1000),
                                     assetForward(type = "equity", currency = "CHF", time = 1L, exposure = 1000,
                                                  price = 600, position = "short"),
                                     fxForward(domestic = "CHF",foreign = "EUR",time = 1L, nominal = 100, rate = 1.05, position = "short"),
                                     liability(time = 1L, currency = "EUR", value = -400),
                                     cashflow(time = 1L, currency = "CHF", rating = "AAA", 0.06, value = 500),
                                     delta(name = "EURCHF", currency = "CHF", sensitivity = 30)),
                 participation.item = participation(currency = "CHF", value = 200),
                 life.item = NULL,
                 health.item = NULL,
                 base.currency = "CHF",
                 portfolio.parameters = valid.param)

  ## test the computations
  expect_equal(as.numeric(compute.macroEconomicScenarios(object = eco.scenario,
                                          portfolio = p,
                                          market.risk = mr))[1],
                    as.numeric(valFunction(p$market.items[[1]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                    valFunction(p$market.items[[2]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                    valFunction(p$market.items[[3]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                    valFunction(p$market.items[[4]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                    valFunction(p$market.items[[5]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                    valFunction(p$market.items[[6]],
                                market.risk = mr)(eco.scenario$macro.economic.scenario.table[,-5])+
                    200*(exp(eco.scenario$macro.economic.scenario.table[,"participation"])-1))[1])

   expect_equal(as.numeric(compute.macroEconomicScenarios(object = eco.scenario,
                                                     portfolio = p,
                                                     market.risk = mr))[2],
                as.numeric(valFunction(p$market.items[[1]],
                            market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                  valFunction(p$market.items[[2]],
                              market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                  valFunction(p$market.items[[3]],
                              market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                  valFunction(p$market.items[[4]],
                              market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                  valFunction(p$market.items[[5]],
                                market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                  valFunction(p$market.items[[6]],
                                market.risk = mr)(eco.scenario$macro.economic.scenario.table[,-5])+
                  200*(exp(eco.scenario$macro.economic.scenario.table[,"participation"])-1))[2])

   # without participation

   ## define an economic scenario
   eco.table <- matrix(c(1,1,1,1,2,2,1,4),nrow=2)
   colnames(eco.table) <- name
   rownames(eco.table) <- c("sc1","sc2")

   eco.scenario <- macroEconomicScenarios(macro.economic.scenario.table = eco.table)

   p <- portfolio(market.items = list(asset(type = "equity", currency = "CHF", value = 1000),
                                      assetForward(type = "equity", currency = "CHF", time = 1L, exposure = 1000,
                                                   price = 600, position = "short"),
                                      fxForward(domestic = "CHF",foreign = "EUR",time = 1L, nominal = 100, rate = 1.05, position = "short"),
                                      liability(time = 1L, currency = "EUR", value = -400),
                                      cashflow(time = 1L, currency = "CHF", rating = "AAA", 0.06, value = 500),
                                      delta(name = "EURCHF", currency = "CHF", sensitivity = 30)),
                  participation.item = NULL,
                  life.item = NULL,
                  health.item = NULL,
                  base.currency = "CHF",
                  portfolio.parameters = valid.param)

   ## test the computations
   expect_equal(as.numeric(compute.macroEconomicScenarios(object = eco.scenario,
                                                          portfolio = p,
                                                          market.risk = mr))[1],
                as.numeric(valFunction(p$market.items[[1]],
                                       market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[2]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[3]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[4]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[5]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[6]],
                                         market.risk = mr)(eco.scenario$macro.economic.scenario.table[,-5]))[1])

   expect_equal(as.numeric(compute.macroEconomicScenarios(object = eco.scenario,
                                                          portfolio = p,
                                                          market.risk = mr))[2],
                as.numeric(valFunction(p$market.items[[1]],
                                       market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[2]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[3]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[4]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[5]],
                                         market.risk = mr, with.constant = F)(eco.scenario$macro.economic.scenario.table[,-5])+
                             valFunction(p$market.items[[6]],
                                         market.risk = mr)(eco.scenario$macro.economic.scenario.table[,-5]))[2])


   ## define an incompatible economic scenario
   eco.table <- matrix(c(1,1,1,1,2,2,1,4,2,3),nrow=2)
   colnames(eco.table) <- c(name, "participation")
   rownames(eco.table) <- c("sc1","sc2")

   eco.scenario <- macroEconomicScenarios(macro.economic.scenario.table = eco.table)

   expect_error(compute(eco.scenario, market.risk = mr, portfolio = p), "marketRisk")
})
