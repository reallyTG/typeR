library(GAS)


### Name: FZLoss
### Title: Fissler and Ziegel (2016) (FZ) joint loss function for Value at
###   Risk and Expected Shortfall.
### Aliases: FZLoss

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

vVaR = quantile(Forecast, alpha)
vES  = ES(Forecast, alpha)

FZ = FZLoss(OutSampleData, vVaR, vES, alpha)





