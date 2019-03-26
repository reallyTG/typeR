# unit tests for sstOutput
context("S3 class sstOutput")

# checking figures
test_that("sstOutput figures are ok", {

  ## building marketRisk
  cov.mat <- diag(2, 4, 4) %*% diag(rep(1, 4))  %*% diag(2, 4, 4)
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
  eco.table <- matrix(c(1,1,1,1,2,2,1,4,2,3), nrow=2)
  colnames(eco.table) <- c(name, "participation")
  rownames(eco.table) <- c("sc1","sc2")

  eco.scenario <- macroEconomicScenarios(macro.economic.scenario.table = eco.table)

  mr <- marketRisk(cov.mat                  = cov.mat,
                   mapping.table            = mapping.table,
                   initial.values           = initial.values,
                   mapping.time             = mapping.time,
                   base.currency            = "CHF")

  M <- matrix(c(1, 1, 1, 1), 2)
  colnames(M) <- c("storno", "invalidity")
  rownames(M) <- colnames(M)

  lr <- lifeRisk(corr.mat  = M,
                 quantile = c(0.995, 0.995))

  hr <- healthRisk(corr.mat  = M)

  valid.param <- list(mvm = 3,
                      rtkr = 0,
                      rtkg = 0,
                      credit.risk = 3,
                      correction.term = 3,
                      expected.insurance.result =  10^6,
                      expected.financial.result =  10^5)

  valid.param <- list(mvm = list(mvm.life = 2, mvm.health = 4, mvm.nonlife = 3),
                      rtkr = 0,
                      rtkg = 0,
                      credit.risk = 3,
                      correction.term = 3,
                      expected.insurance.result =  10^6,
                      expected.financial.result =  10^5)


  p <- portfolio(market.items = list(asset(type = "equity", currency = "CHF", value = 1000),
                                     liability(time = 1L, currency = "CHF", value = -400),
                                     cashflow(time = 1L, currency = "CHF", rating = "AAA", 0.06, value = 500),
                                     delta(name = "EURCHF", currency = "CHF", sensitivity = 30)),
                 participation.item = participation(currency = "CHF", value = 200),
                 life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(10, 10)),
                 health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(10, 10)),
                 base.currency = "CHF",
                 portfolio.parameters = valid.param)

  list.correlation.matrix <- list(base = matrix(c(1,0.15,0.075,0.15,
                                                  0.15,1,0.25,0.25,
                                                  0.075,0.25,1,0.15,
                                                  0.15,0.25,0.15,1), ncol=4, byrow = T),
                                  scenario1 = matrix(c(1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       1,1,1,0.35,
                                                       0.35,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario2 = matrix(c(1,0.6,0.5,0.25,
                                                       0.6,1,0.8,0.35,
                                                       0.5,0.8,1,0.35,
                                                       0.25,0.35,0.35,1), ncol=4, byrow = T),
                                  scenario3 = matrix(c(1,0.25,0.25,0.5,
                                                       0.25,1,0.25,0.25,
                                                       0.25,0.25,1,0.25,
                                                       0.5,0.25,0.25,1), ncol=4, byrow = T))

  list.correlation.matrix <- lapply(list.correlation.matrix, function(corr) {rownames(corr) <- colnames(corr) <- c("market", "life","health","nonlife"); corr})

  # define the region boundaries (i.e. the thresholds t)
  region.boundaries <- matrix(c(0.2,0.3,0.3,0.5,
                                0.5,0.2,0.2,0.8,
                                0.6,0.8,0.8,0.2), nrow=3, byrow = T)

  colnames(region.boundaries) <- c("market", "life","health","nonlife")
  rownames(region.boundaries) <- c("scenario1", "scenario2", "scenario3")

  # scenario and region probabilities
  scenario.probability  = c(0.01, 0.01, 0.01)
  region.probability  = c(0.023, 0.034, 0.107)


  model <- sstModel(portfolio = p,
                    market.risk = mr,
                    life.risk = lr,
                    health.risk = hr,
                    nonlife.risk =  nonLifeRisk(type     = "simulations",
                                                param    = list(simulations=c(1, 2, 3, 4)),
                                                currency = "CHF"),
                    scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10),
                    participation.risk = participationRisk(volatility = 3),
                    macro.economic.scenarios = eco.scenario,
                    nhmr = 0.06,
                    reordering.parameters = list(list.correlation.matrix = list.correlation.matrix,
                                                 region.boundaries = region.boundaries,
                                                 region.probability = region.probability,
                                                 scenario.probability = scenario.probability),
                    standalones = list(standalone(name = "equity", equity(name     = "equityCHF",
                                                                          type     = "equity",
                                                                          currency = "CHF")),
                                       standalone(name = "something", spread(name     = "AAACHF",
                                                                             currency = "CHF",
                                                                             rating   = "AAA"),
                                                  rate(name     = "2YCHF",
                                                       currency = "EUR",
                                                       horizon  = "k",
                                                       scale    = 0.8))))

  output <- compute(model, nsim = 1000, seed = 0, nested.market.computations = T)

  # check type
  expect_true(is.numeric(marketValueMargin(output)))
  expect_true(is.numeric(riskCapital(output)))
  expect_true(is.numeric(targetCapital(output)))
  expect_true(is.numeric(sstRatio(output)))
  expect_true(is.numeric(creditRisk(output)))

  expect_equal(marketValueMargin(output),
               -0.06*expectedShortfall(output$simulations$marketParticipationRisk) +
                 output$mvm.list$mvm.life + output$mvm.list$mvm.health +
                 output$mvm.list$mvm.nonlife)

  expect_equal(marketValueMargin(output, nhmr = 0.5),
               -0.5*expectedShortfall(output$simulations$marketParticipationRisk) +
                 output$mvm.list$mvm.life + output$mvm.list$mvm.health +
                 output$mvm.list$mvm.nonlife)

  expect_equal(marketValueMargin(output, alpha = 0.1),
               -0.06*expectedShortfall(output$simulations$marketParticipationRisk, alpha = 0.1) +
                 output$mvm.list$mvm.life + output$mvm.list$mvm.health +
                 output$mvm.list$mvm.nonlife)

  expect_equal(marketValueMargin(output, nhmr = 0.5, alpha = 0.1),
               -0.5*expectedShortfall(output$simulations$marketParticipationRisk, alpha = 0.1) +
                 output$mvm.list$mvm.life + output$mvm.list$mvm.health +
                 output$mvm.list$mvm.nonlife)

  expect_equal(riskCapital(output),
               -expectedShortfall(output$simulations$drbc) -
                 output$expected.financial.result -
                 output$expected.insurance.result +
                 output$credit.risk +
                 output$correction.term)

  expect_equal(riskCapital(output, with.scenario = T),
               -expectedShortfall(output$simulations$drbc.scenarioRisk) -
                 output$expected.financial.result -
                 output$expected.insurance.result +
                 output$credit.risk +
                 output$correction.term)

  expect_equal(riskCapital(output, with.scenario = T, alpha = 0.1),
               -expectedShortfall(output$simulations$drbc.scenarioRisk, alpha = 0.1) -
                 output$expected.financial.result -
                 output$expected.insurance.result +
                 output$credit.risk +
                 output$correction.term)

  expect_equal(targetCapital(output),
               riskCapital(output) + marketValueMargin(output))

  expect_equal(targetCapital(output, with.scenario = T),
               riskCapital(output, with.scenario = T) + marketValueMargin(output))

  expect_equal(targetCapital(output, with.scenario = T, nhmr = 0.5),
               riskCapital(output, with.scenario = T) + marketValueMargin(output, nhmr = 0.5))

  expect_equal(targetCapital(output, with.scenario = T, nhmr = 0.5, alpha = 0.2),
               riskCapital(output, with.scenario = T, alpha = 0.2) + marketValueMargin(output, nhmr = 0.5, alpha = 0.2))

  expect_equal(sstRatio(output),
               (output$rtkg - marketValueMargin(output))/riskCapital(output))

  expect_equal(sstRatio(output, with.scenario = T),
               (output$rtkg - marketValueMargin(output))/riskCapital(output, with.scenario = T))

  expect_equal(sstRatio(output, nhmr = 0.5),
               (output$rtkg - marketValueMargin(output, nhmr = 0.5))/riskCapital(output))
})

