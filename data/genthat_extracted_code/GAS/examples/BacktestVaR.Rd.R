library(GAS)


### Name: BacktestVaR
### Title: Backtest Value at Risk (VaR)
### Aliases: BacktestVaR

### ** Examples


data("StockIndices")

GASSpec = UniGASSpec(Dist = "std", ScalingType = "Identity",
                     GASPar = list(location = FALSE, scale = TRUE,
                                   shape = FALSE))

FTSEMIB = StockIndices[, "FTSEMIB"]

InSampleData  = FTSEMIB[1:1500]
OutSampleData = FTSEMIB[1501:2404]

Fit = UniGASFit(GASSpec, InSampleData)

Forecast = UniGASFor(Fit, Roll = TRUE, out = OutSampleData)

alpha = 0.05

VaR = quantile(Forecast, alpha)

BackTest = BacktestVaR(OutSampleData, VaR, alpha)



