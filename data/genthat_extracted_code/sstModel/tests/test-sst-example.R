# this is a complete example on how to simulate the target capital from the
# Swiss solvency test with the standalone sstModel package

# load package
library(sstModel)


# first step: define the market risks

## define the names of the base risk factors (Risiko Treiber).
name <- c("EURCHF", "USDCHF",                        # the fx rate risks
          "equityCHF", "equityEUR", "equityUSD",     # the equity risks
          "kYCHF", "mYCHF",                          # the interest rate risks
          "kYEUR", "mYEUR",
          "PC1RateUSD", "PC2RateUSD",                # here we use two PCA components
          "AAACHF", "AAAEUR", "AAAUSD")              # the spread risks

## then we need to define an appropriate correlation matrix
corr.mat <- diag(rep(1, 14))
colnames(corr.mat) <- name
rownames(corr.mat) <- name

## and the respective volatilities
volatility <- rep(0.05, 14)

# create cov mat
cov.mat <- diag(volatility, length(volatility), length(volatility)) %*%
           corr.mat  %*%  diag(volatility, length(volatility), length(volatility))

colnames(cov.mat) <- rownames(cov.mat) <- colnames(corr.mat)
attr(cov.mat, "base.currency") <- "CHF"

## we should then build the mapping table of market risks
mapping.table <- mappingTable(currency(name = "EURCHF",
                                       from = "EUR",
                                       to   = "CHF"),
                              currency(name = "USDCHF",
                                       from = "USD",
                                       to   = "CHF"),

                              equity(name     = "equityCHF",
                                     type     = "equity",
                                     currency = "CHF"),
                              equity(name     = "equityEUR",
                                     type     = "equity",
                                     currency = "EUR"),
                              equity(name     = "equityEUR",
                                     type     = "equity",
                                     currency = "USD",
                                     scale    = 0.4694625),

                              pcRate(name   = c("PC1RateUSD"),
                                     currency = "USD"),
                              pcRate(name   = c("PC2RateUSD"),
                                     currency = "USD"),
                              pcRate(name   = c("PC1RateUSD"),
                                     currency = "EUR",
                                     scale = 1),
                              pcRate(name   = c("PC2RateUSD"),
                                     currency = "EUR",
                                     scale = 1),

                              rate(name     = "kYCHF",
                                   currency = "CHF",
                                   horizon  = "k"),

                              rate(name     = c("PC1RateUSD",
                                                "PC2RateUSD"),
                                   currency = "EUR",
                                   horizon  = "k",
                                   scale    = c(0.1,
                                                0.7)),

                              rate(name     = c("PC1RateUSD",
                                                "PC2RateUSD"),
                                   currency = "USD",
                                   horizon  = "k",
                                   scale    = c(0.2,
                                                0.5)),

                              rate(name     = "mYCHF",
                                   currency = "CHF",
                                   horizon  = "m"),

                              rate(name     = c("PC1RateUSD",
                                                "PC2RateUSD"),
                                   currency = "EUR",
                                   horizon  = "m",
                                   scale    = c(0.05,
                                                0.6)),
                              rate(name     = c("PC1RateUSD",
                                                "PC2RateUSD"),
                                   currency = "USD",
                                   horizon  = "m",
                                   scale    = c(0.1,
                                                0.9)),

                              spread(name     = "AAACHF",
                                     currency = "CHF",
                                     rating   = "AAA"),
                              spread(name     = "AAAEUR",
                                     currency = "EUR",
                                     rating   = "AAA"),
                              spread(name     = "AAAUSD",
                                     currency = "USD",
                                     rating   = "AAA"))

## and provide the initial values for the risks factors
initial.values <- list()

## initial fx
initial.values$initial.fx <- data.frame(from             = c("EUR", "USD"),
                                        to               = c("CHF", "CHF"),
                                        fx               = c(1.05,1.02),
                                        stringsAsFactors = F)

## initial rates
initial.values$initial.rate <- data.frame(time             = c(2L, 2L, 2L, 10L, 10L, 10L),
                                          currency         = c("CHF", "EUR", "USD"),
                                          rate             = c(0.01, 0.01, 0.01, 0.03, 0.03, 0.03),
                                          stringsAsFactors = F)


# define the mapped times for rates
mapping.time <- data.frame(time = c(2L, 10L), mapping = c("k","m"), stringsAsFactors = F)

## we are finally in shape to build the full market risk
mr <- marketRisk(cov.mat        = cov.mat,
                 mapping.table  = mapping.table,
                 base.currency  = "CHF",
                 initial.values = initial.values,
                 mapping.time   = mapping.time)


# second step: define the health and life risks
M <- matrix(c(1, 1, 1, 1), 2)
colnames(M) <- c("storno", "invalidity")
rownames(M) <- colnames(M)

lr <- lifeRisk(corr.mat  = M,
               quantile = c(0.995, 0.995))

hr <- healthRisk(corr.mat  = M)



# third step: build the portfolio

list.assets <- list(asset(type = "equity", currency = "CHF", value = 30000000),
                    asset(type = "equity", currency = "EUR", value = 20000000),
                    asset(type = "equity", currency = "USD", value = 5000000))

list.liabilities <- list(liability(time = 2L, currency = "CHF", value = 400000),
                         liability(time = 2L, currency = "EUR", value = 700000),
                         liability(time = 2L, currency = "USD", value = 340000),
                         liability(time = 10L, currency = "CHF", value = 500000),
                         liability(time = 10L, currency = "EUR", value = 100000),
                         liability(time = 10L, currency = "USD", value = 240000))

list.asset.forward <- list(assetForward(type = "equity",
                                        currency = "CHF",
                                        time = 10L,
                                        exposure = 10000,
                                        price = 45000,
                                        position = "long"))


list.marketItems <- append(append(append(append(list(), list.assets), list.liabilities),list.asset.forward),
                           list(delta(name = "EURCHF", currency = "CHF", sensitivity = 1000)))

valid.param <- list(mvm = list(mvm.life = 2, mvm.health = 4, mvm.nonlife = 3),
                    rtkr = 0,
                    rtkg = 0,
                    correction.term = 2,
                    credit.risk = 3,
                    expected.insurance.result =  10^6,
                    expected.financial.result =  10^5)


p <- portfolio(market.items = list.marketItems,
               participation.item = participation(currency = "CHF", value = 3000),
               life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(100, 2000)),
               health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(230, 500)),
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


## third step: define the sstModel
model <- sstModel(portfolio = p,
                  market.risk = mr,
                  life.risk = lr,
                  health.risk = hr,
                  nonlife.risk = nonLifeRisk(type     = "simulations",
                                             param    = list(simulations = c(1, 2, 3, 4)),
                                             currency = "CHF"),
                  nhmr = 0.06,
                  reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                  scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                  participation.risk = participationRisk(volatility = 0.5),
                  standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                           type     = "equity",
                                                                           currency = "CHF")),
                                     standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                              currency = "CHF",
                                                                              rating   = "AAA")),
                                     standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                        currency = "CHF",
                                                                        horizon  = "k"))
                  ))

output <- compute(object = model, nsim = as.integer(100), nested.market.computations = T)

# life is null
p2 <- portfolio(market.items = list.marketItems,
                participation.item = participation(currency = "CHF", value = 3000),
                health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(230, 500)),
                base.currency = "CHF",
                portfolio.parameters = valid.param)

model2 <- sstModel(portfolio = p2,
                   market.risk = mr,
                   health.risk = hr,
                   nonlife.risk = nonLifeRisk(type     = "simulations",
                                              param    = list(simulations = c(1, 2, 3, 4)),
                                              currency = "CHF"),
                   nhmr = 0.06,
                   reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                   scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                   participation.risk = participationRisk(volatility = 0.5),
                   standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                            type     = "equity",
                                                                            currency = "CHF")),
                                      standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                               currency = "CHF",
                                                                               rating   = "AAA")),
                                      standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                         currency = "CHF",
                                                                         horizon  = "k"))
                   ))

output2 <- compute(object = model2, nsim = as.integer(100))

# health is null
p3 <- portfolio(market.items = list.marketItems,
                participation.item = participation(currency = "CHF", value = 3000),
                life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(100, 2000)),
                base.currency = "CHF",
                portfolio.parameters = valid.param)

model3 <- sstModel(portfolio = p3,
                   market.risk = mr,
                   life.risk = lr,
                   nonlife.risk = nonLifeRisk(type     = "simulations",
                                              param    = list(simulations = c(1, 2, 3, 4)),
                                              currency = "CHF"),
                   nhmr = 0.06,
                   reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                   scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                   participation.risk = participationRisk(volatility = 0.5),
                   standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                            type     = "equity",
                                                                            currency = "CHF")),
                                      standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                               currency = "CHF",
                                                                               rating   = "AAA")),
                                      standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                         currency = "CHF",
                                                                         horizon  = "k"))
                   ))

output3 <- compute(object = model3, nsim = as.integer(100))


# participation is null
p4 <- portfolio(market.items = list.marketItems,
                life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(100, 2000)),
                health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(230, 500)),
                base.currency = "CHF",
                portfolio.parameters = valid.param)

model4 <- sstModel(portfolio = p4,
                   market.risk = mr,
                   life.risk = lr,
                   health.risk = hr,
                   nonlife.risk = nonLifeRisk(type     = "simulations",
                                              param    = list(simulations = c(1, 2, 3, 4)),
                                              currency = "CHF"),
                   nhmr = 0.06,
                   reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                   scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                   standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                            type     = "equity",
                                                                            currency = "CHF")),
                                      standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                               currency = "CHF",
                                                                               rating   = "AAA")),
                                      standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                         currency = "CHF",
                                                                         horizon  = "k"))
                   ))

output4 <- compute(object = model4, nsim = as.integer(100))

# only one market item with participation
p5 <- portfolio(market.items = list(list.marketItems[[1]]),
                participation.item = participation(currency = "CHF", value = 3000),
                life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(100, 2000)),
                health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(230, 500)),
                base.currency = "CHF",
                portfolio.parameters = valid.param)

model5 <- sstModel(portfolio = p5,
                   market.risk = mr,
                   life.risk = lr,
                   health.risk = hr,
                   participation.risk = participationRisk(volatility = 0.5),
                   nonlife.risk = nonLifeRisk(type     = "simulations",
                                              param    = list(simulations = c(1, 2, 3, 4)),
                                              currency = "CHF"),
                   nhmr = 0.06,
                   reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                   scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                   standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                                type     = "equity",
                                                                                currency = "CHF")),
                                      standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                                   currency = "CHF",
                                                                                   rating   = "AAA")),
                                      standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                             currency = "CHF",
                                                                             horizon  = "k"))
                   ))

output5 <- compute(object = model5, nsim = as.integer(100))

# only one market item without participation
p6 <- portfolio(market.items = list(list.marketItems[[1]]),
                life.item = life(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(100, 2000)),
                health.item = health(name = c("storno", "invalidity"), currency = c("CHF", "CHF"), sensitivity = c(230, 500)),
                base.currency = "CHF",
                portfolio.parameters = valid.param)

model6 <- sstModel(portfolio = p6,
                   market.risk = mr,
                   life.risk = lr,
                   health.risk = hr,
                   nonlife.risk = nonLifeRisk(type     = "simulations",
                                              param    = list(simulations = c(1, 2, 3, 4)),
                                              currency = "CHF"),
                   nhmr = 0.06,
                   reordering.parameters = list(list.correlation.matrix = list(base=list.correlation.matrix[[1]])),
                   scenario.risk = scenarioRisk("tornado", 0.08, "CHF", -10000),
                   standalones = list(standalone(name = "std_equityCHF", equity(name     = "equityCHF",
                                                                                type     = "equity",
                                                                                currency = "CHF")),
                                      standalone(name = "std_spreadAAACHF", spread(name     = "AAACHF",
                                                                                   currency = "CHF",
                                                                                   rating   = "AAA")),
                                      standalone(name = "std_ratekCHF", rate(name     = "kYCHF",
                                                                             currency = "CHF",
                                                                             horizon  = "k"))
                   ))

output6 <- compute(object = model6, nsim = as.integer(100))



