## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- include = FALSE----------------------------------------------------
library(sstModel)

## ------------------------------------------------------------------------
# define the market vocabulary
name <- c("EURCHF",                           # currency risk 
          "MSCI_CHF", "MSCI_EUR",             # equity risks
          "2Y_CHF", "10Y_CHF", "30Y_CHF",     # interest rate risks in CHF
          "2Y_EUR", "10Y_EUR", "30Y_EUR",     # interest rate risks in EUR
          "SNB_IND", "AA_EUR_Spread",         # the spread risks
          "Rued_Blass")                       # real estate

## ------------------------------------------------------------------------
# define the correlation matrix of base market risk factor changes
corr.mat <- matrix(c(
  1,0.34161024,0.14725368,0.32600072,0.23891105,0.15829093,
  0.33053628,0.2120393,0.22398321,-0.238861,-0.1888347,0.00871576, # EURCHF
  0.34161024,1,0.80390297,0.36492975,0.2296897,0.14789193,
  0.39493016,0.22665597,0.16277712,-0.4181629,-0.4711875,0.14542951, # MSCI_CHF
  0.14725368,0.80390297,1,0.25113843,0.2195543,0.21116258,
  0.50130346,0.30194514,0.23652861,-0.4573374,-0.497173,0.222605, # MSCI_EUR
  0.32600072,0.36492975,0.25113843,1,0.54235597,0.34141452,
  0.63987172,0.42851556,0.26727693,-0.3639534,-0.2760417,-0.0754334, # 2Y_CHF
  0.23891105,0.2296897,0.2195543,0.54235597,1,0.85134549,
  0.53410699,0.79149277,0.69474163,-0.4059395,-0.2140168,-0.0550199, # 10Y_CHF
  0.15829093,0.14789193,0.21116258,0.34141452,0.85134549,1,
  0.40118418,0.74668904,0.72843346,-0.1943058,-0.2089049,-0.1116269, # 30Y_CHF
  0.33053628,0.39493016,0.50130346,0.63987172,0.53410699,0.40118418,
  1,0.63153892,0.45730512,-0.4195621,-0.3505668,0.08683017, # 2Y_EUR 
  0.2120393,0.22665597,0.30194514,0.42851556,0.79149277,0.74668904,
  0.63153892,1,0.90211566,-0.2619321,-0.3121842,-0.0739692, # 10Y_EUR 
  0.22398321,0.16277712,0.23652861,0.26727693,0.69474163,0.72843346,
  0.45730512,0.90211566,1,-0.1365209,-0.2398577,-0.0437529, # 20Y_EUR_3 
  -0.238861,-0.4181629,-0.4573374,-0.3639534,-0.4059395,-0.1943058,
  -0.4195621,-0.2619321,-0.1365209,1,0.31807203,-0.1240017, # SNB_IND
  -0.1888347,-0.4711875,-0.497173,-0.2760417,-0.2140168,-0.2089049,
  -0.3505668,-0.3121842,-0.2398577,0.31807203,1,-0.187089, # AA_EUR_Spread
  0.00871576,0.14542951,0.222605,-0.0754334,-0.0550199,-0.1116269,
  0.08683017,-0.0739692,-0.0437529,-0.1240017,-0.187089,1 # Rued_Blass
), byrow = T, ncol = length(name))

# name the columns and rows of this correlation matrix
colnames(corr.mat) <- name
rownames(corr.mat) <- name

# define the associated volatilities
volatility <- c(0.002473,                      # fx EURCHF
                0.1281, 0.1674,                # stocks (CHF, EUR)
                0.0048876, 0.004994, 0.005203, # rate CHF
                0.006247, 0.006575, 0.007183,  # rate EUR 
                0.002979, 0.003496,            # spreads
                0.0739)                        # commercial real estate

# compute thr covariance matrix
cov.mat <- diag(volatility, length(volatility), length(volatility)) %*% corr.mat %*% diag(volatility, length(volatility), length(volatility))

# add the names to the columns and rows
colnames(cov.mat) <- rownames(cov.mat) <- colnames(corr.mat)

# we additionally should specify the base currency (equal indeed to the reporting currency) in which the covariance matrix is expressed as an attribute of the covariance matrix.
attr(cov.mat, "base.currency") <- "CHF"

## ------------------------------------------------------------------------
# the exchange rates (here only one), always assuming that exchange rates should map into the reporting (base currency) and be coherent with the covariance matrix of base market risk factors.
list.currency <- list(currency(name = "EURCHF",
                               from = "EUR",
                               to   = "CHF"))

# the asset risks (with direct market price).
list.equity <- list(equity(name     = "MSCI_CHF",
                           type     = "equity",
                           currency = "CHF"),
                    equity(name     = "MSCI_EUR",
                           type     = "equity",
                           currency = "EUR"))

# the real estates, here we assume that private real estate is a scaling 
# of commercial real estate (implying a perfect correlation of riskFactor changes in the Monte-Carlo simulations).
list.real.estate <- list(equity(name      = "Rued_Blass",
                                type      = "commercial real estate",
                                currency  = "CHF"),
                         equity(name      = "Rued_Blass",
                                type      = "private real estate", 
                                currency  = "CHF",
                                scale     = 0.4694626))

# the interests rates (specififying the mapping)
list.rates <- list(rate(name     = "2Y_CHF",
                        currency = "CHF",
                        horizon  = "k"),
                   rate(name     = "10Y_CHF",
                        currency = "CHF",
                        horizon  = "m"),
                   rate(name     = "30Y_CHF",
                        currency = "CHF",
                        horizon  = "l"),
                   rate(name     = "2Y_EUR",
                        currency = "EUR",
                        horizon  = "k"),
                   rate(name     = "10Y_EUR",
                        currency = "EUR",
                        horizon  = "m"),
                   rate(name     = "30Y_EUR",
                        currency = "EUR",
                        horizon  = "l"))

# the spread risks (attached with a rating)
list.spread <- list(spread(name     = "SNB_IND",
                           currency = "CHF",
                           rating   = "AAA"),
                    spread(name     = "AA_EUR_Spread",
                           currency = "EUR",
                           rating   = "AA"))

# we finally bind all these risks in a mapping table of market risks
mapping.table <- mappingTable(c(list.currency, list.equity, 
                                list.real.estate, list.rates, 
                                list.spread),
                              list.arg = T)

## ---- include=FALSE------------------------------------------------------
# initial rates, here we hide due to the length of this part.
initial.rates.values <- c(-0.006365914,
                                                               -0.007963744,
                                                               -0.008412061,
                                                               -0.007746863,
                                                               -0.006567033,
                                                               -0.005277651,
                                                               -0.004071154,
                                                               -0.003014354,
                                                               -0.002114523,
                                                               -0.001355653,
                                                               -0.000782016,
                                                               -0.000319637,
                                                                0.000107197,
                                                                0.000548635,
                                                                0.001038672,
                                                                0.001592859,
                                                                0.002192119,
                                                                0.002816192,
                                                                0.003450816,
                                                                0.004085938,
                                                                0.004714505,
                                                                0.005331612,
                                                                0.005933911,
                                                                0.006519185,
                                                                0.007086044,
                                                                0.007633703,
                                                                0.008161818,
                                                                0.008670368,
                                                                0.009159561,
                                                                0.009629775,
                                                                0.010081502,
                                                                0.010515311,
                                                                0.010931826,
                                                                0.011331698,
                                                                0.011715593,
                                                                0.01208418,
                                                                0.01243812,
                                                                0.012778065,
                                                                0.013104648,
                                                                0.013418483,
                                                                0.013720161,
                                                                0.014010251,
                                                                0.014289299,
                                                                0.014557824,
                                                                0.014816325,
                                                                0.015065273,
                                                                0.01530512,
                                                                0.015536293,
                                                                0.0157592,
                                                                0.015974225,
                                                               -0.005052744,
                                                               -0.004620659,
                                                               -0.004018062,
                                                               -0.003255293,
                                                               -0.002242513,
                                                               -0.001100605,
                                                                0.00013999,
                                                                0.001399021,
                                                                0.002596626,
                                                                0.003703135,
                                                                0.004687785,
                                                                0.00555598,
                                                                0.006319785,
                                                                0.0069889,
                                                                0.007571265,
                                                                0.008070831,
                                                                0.008481634,
                                                                0.008798154,
                                                                0.009017379,
                                                                0.00913812,
                                                                0.009168589,
                                                                0.009145482,
                                                                0.009102996,
                                                                0.009066255,
                                                                0.009053527,
                                                                0.009077994,
                                                                0.009149129,
                                                                0.009273778,
                                                                0.009457009,
                                                                0.009702775,
                                                                0.01001101,
                                                                0.010368994,
                                                                0.010763743,
                                                                0.011185029,
                                                                0.011624774,
                                                                0.012076582,
                                                                0.012535388,
                                                                0.012997182,
                                                                0.013458793,
                                                                0.013917724,
                                                                0.014372021,
                                                                0.014820162,
                                                                0.015260981,
                                                                0.015693594,
                                                                0.01611735,
                                                                0.016531783,
                                                                0.016936578,
                                                                0.017331545,
                                                                0.01771659,
                                                                0.0180917)

## ------------------------------------------------------------------------
# initial values list
initial.values <- list()

# initial fx values
initial.values$initial.fx <- initialFX(from = c("EUR"),
                                       to   = c("CHF"),
                                       fx   = c(1.07209)) 

# initial rates values, please note that initial.rates.values are defined in the document but not shown on the PDF version due to its length.
initial.values$initial.rate <- initialRate(time     = c(c(1:10, 11:20, 21:50),
                                                        c(1:10, 11:20, 21:50)),
                                           currency = c(rep("CHF", 50),
                                                        rep("EUR", 50)),
                                           rate     = initial.rates.values)


# define the time-to-maturity projections for rates
mapping.time <- mappingTime(time    = c(1:10, 11:20, 21:50), 
                            mapping = c(rep("k", 10), rep("m", 10), rep("l", 30)))


## ------------------------------------------------------------------------
# symmetrize the covariance matrix (to avoid numerical errors)
cov.mat <- (cov.mat + t(cov.mat)) / 2

# we build the full market risk
market.risk <-   marketRisk(cov.mat        = cov.mat,
                            mapping.table  = mapping.table,
                            initial.values = initial.values,
                            base.currency  = "CHF",
                            mapping.time   = mapping.time)

## ------------------------------------------------------------------------
# define the names of life insurance risk-factors.
life.risk.name <- c("Sterblichkeit", "Langlebigkeit", "Invaliditat",
                    "Reaktivierung","Kosten", "Storno", "Kapitaloption", 
                    "KostenBVG", "StornoBVG")

## ------------------------------------------------------------------------
# define the life correlation matrix
life.corr.mat <- matrix(c(1,-0.75,0.25,0,0,0,0,0,0,
                   -0.75,1,0,0,0,0,0.25,0,0,
                   0.25,0,1,-0.75,0.25,0,0,0.25,0,
                   0,0,-0.75,1,0,0,0,0,0,
                   0,0,0.25,0,1,0.5,0,0.5,0.5,
                   0,0,0,0,0.5,1,0,0.5,0.5,
                   0,0.25,0,0,0,0,1,0,-0.5,
                   0,0,0.25,0,0.5,0.5,0,1,0.5,
                   0,0,0,0,0.5,0.5,-0.5,0.5,1), ncol = 9, byrow = T)

# add names
colnames(life.corr.mat) <- life.risk.name
rownames(life.corr.mat) <- life.risk.name

# choose the life quantiles
life.quantiles <- rep(0.995, 9)

# define a lifeRisk
life.risk <- lifeRisk(corr.mat = life.corr.mat, 
                      quantile = life.quantiles)

## ------------------------------------------------------------------------
# define the names of health insurance risk-factors.
health.risk.name <- c("Langzeit Verpflichtungen", "Kollektiv Taggeld")

## ------------------------------------------------------------------------
# define the life correlation matrix
health.corr.mat <- diag(1, 2)

# add names
colnames(health.corr.mat) <- health.risk.name
rownames(health.corr.mat) <- health.risk.name

# define a healthRisk
health.risk <- healthRisk(corr.mat = health.corr.mat)

## ------------------------------------------------------------------------
# define a nonLifeRisk
nonlife.risk <- nonLifeRisk(type     = "log-normal", 
                            param    = list(mu = 10, sigma = 2),
                            currency = "CHF")

## ------------------------------------------------------------------------
# define a participarion risk
participation.risk <- participationRisk(volatility = 0.25)

## ------------------------------------------------------------------------
# define a scenario risk
scenario.risk <- scenarioRisk(name        = c("terrorism", "financial distress"), 
                              probability = c(0.05, 0.01), 
                              currency    = c("CHF", "CHF"), 
                              effect      = c(-2*10^6, -10^6))

## ------------------------------------------------------------------------

# cashflows items (please note that spread is the initial spread value for this cashflow)
list.fixed.income <- list( # cashflow in CHF and EUR
                             cashflow(time = 1L, currency = "CHF", 
                                      rating = "AAA", spread = 0.05, value = 10^6),
                             cashflow(time = 5L, currency = "CHF",
                                      rating = "AAA", spread = 0.03, value = 10^6),
                             cashflow(time = 1L, currency = "EUR", 
                                      rating = "AA", spread = -0.05, value = 10^6),
                             cashflow(time = 5L, currency = "EUR",
                                      rating = "AA", spread = -0.03, value = 10^6),
                      
                          # liabilities in CHF
                            liability(time = 2L, currency = "CHF", value = 20*10^6))
                        

## ------------------------------------------------------------------------
# asset items
list.assets <- list( # stock assets
                     asset(type = "equity", 
                           currency = "CHF", value = 30*10^6),
                     asset(type = "equity", 
                           currency = "EUR", value = 20*10^6),
                     
                     # real estate assets
                     asset(type = "commercial real estate", 
                           currency = "CHF", value = 10*10^6),
                     asset(type = "private real estate", 
                           currency = "CHF", value = 5*10^6))

## ------------------------------------------------------------------------
# assetForwards and fxForwards
list.forwards <- list( # asset forward
                     assetForward(type     = "equity", 
                                  currency = "CHF",
                                  time     = 2L,
                                  exposure = 2*10^6, 
                                  price    = 10^6, 
                                  position ="short"),
                     # fx forward
                     fxForward(domestic = "CHF", foreign = "EUR",
                                  time = 1L, nominal = 10^6, rate = 1.06,
                                    position ="short"))
                     
                    

## ------------------------------------------------------------------------
# delta remainder
list.delta <- list(delta(name = c("MSCI_CHF", "MSCI_EUR"), 
                         currency = c("CHF","CHF"), 
                         sensitivity = c(10^5, -10^5)))

## ------------------------------------------------------------------------
life.item <- life(name        = c("Sterblichkeit", "Langlebigkeit", "Invaliditat",
                                  "Reaktivierung", "Kosten", "Storno", "Kapitaloption", 
                                  "KostenBVG", "StornoBVG"), 
                  currency    = rep("CHF",9),
                  sensitivity = rep(-10^5, 9))

## ------------------------------------------------------------------------
health.item <- health(name = c("Langzeit Verpflichtungen", "Kollektiv Taggeld"), currency = rep("CHF",2), sensitivity = rep(10^5, 2))

## ------------------------------------------------------------------------
participation.item <- participation(currency = "CHF", value = 10^6)

## ------------------------------------------------------------------------
pf <- portfolio(market.items         = c(list.fixed.income, list.assets, 
                                         list.forwards, list.delta),
                base.currency = "CHF",
                life.item            = life.item,
                health.item          = health.item,
                participation.item   = participation.item,
                portfolio.parameters = list(mvm = list(mvm.life    = 10^5, 
                                                       mvm.health  = 10^5,
                                                       mvm.nonlife = 10^5),
                                            credit.risk     = 10^5,
                                            correction.term = 10^4,
                                            expected.financial.result = 3*10^6, 
                                            expected.insurance.result = 2*10^6,
                                            rtkg = 20*10^6, 
                                            rtkr = 18*10^6))


## ------------------------------------------------------------------------
# define here a macro economic scenario

# values taken by the change in market risk-factors (last in participation).
eco <- matrix(rnorm(2*13), nrow = 2)

# give names to economic scenarios and risk-factors (including participation)
colnames(eco) <- c(name, "participation")
rownames(eco) <- c("scenario_1", "scenario_2")

# create the maro.economic scenarios
macro.economic.scenarios <- macroEconomicScenarios(macro.economic.scenario.table = eco)

## ------------------------------------------------------------------------
# providing a list of correlation matrices (the first one called "base" is used for ranks generation and the following for conditional scenarios).
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

# we provide names for the correlation matrices
  list.correlation.matrix <- lapply(list.correlation.matrix, function(corr) {rownames(corr) <- colnames(corr) <- c("market", "life","health","nonlife"); corr})

  # define the region boundaries (i.e. the thresholds t under which we should reorder)
  region.boundaries <- matrix(c(0.2,0.3,0.3,0.5,
                                0.5,0.2,0.2,0.8,
                                0.6,0.8,0.8,0.2), nrow=3, byrow = T)
  
  # providing names for the regions boundaries and scenarios
  colnames(region.boundaries) <- c("market", "life","health","nonlife")
  rownames(region.boundaries) <- c("scenario1", "scenario2", "scenario3")

  # scenario and region probabilities
  scenario.probability  = c(0.01, 0.01, 0.01)
  region.probability    = c(0.023, 0.034, 0.107)

## ------------------------------------------------------------------------
# create a model instance
sst <- sstModel(portfolio                = pf, 
                market.risk              = market.risk, 
                life.risk                = life.risk, 
                health.risk              = health.risk,
                participation.risk       = participation.risk,
                scenario.risk            = scenario.risk, 
                macro.economic.scenarios = macro.economic.scenarios,
                nhmr                     = 0.06, 
                reordering.parameters = list(list.correlation.matrix  = list.correlation.matrix,
                                                 region.boundaries    = region.boundaries,
                                                 region.probability   = region.probability,
                                                 scenario.probability = scenario.probability))

## ------------------------------------------------------------------------
output <- compute(sst, 
                  nsim = as.integer(10^4), 
                  nested.market.computations = T)

## ------------------------------------------------------------------------
str(output)

## ------------------------------------------------------------------------
head(output$simulations)

## ------------------------------------------------------------------------
# market value margin
marketValueMargin(output)

# one year risk capital without scenarios
riskCapital(object = output, with.scenario = F)

# one year risk capital with scenarios
riskCapital(object = output, with.scenario = T)

# without scenarios
targetCapital(output, with.scenario = F)

# with scenarios
targetCapital(output, with.scenario = T)

# sst ratio without scenarios
sstRatio(object = output, with.scenario = F)

# sst ratio with scenarios
sstRatio(object = output, with.scenario = T)

