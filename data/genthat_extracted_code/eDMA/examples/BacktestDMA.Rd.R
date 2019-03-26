library(eDMA)


### Name: BacktestDMA
### Title: Backtest measures for Dynamic Model Averaging and comparison
###   with Dynamic Model Selection
### Aliases: BacktestDMA

### ** Examples


library(eDMA)

## load data
data("USData")

## do DMA, keep the first three predictors fixed and the intercept
Fit <- DMA(GDPDEF ~ Lag(GDPDEF, 1) + Lag(GDPDEF, 2) + Lag(GDPDEF, 3) +
            Lag(ROUTP, 1) + Lag(UNEMP, 1), data = USData, vDelta = c(0.9, 0.95, 0.99),
            vKeep = c(1, 2, 3))

BacktestDMA(Fit, iBurnPeriod = 32)




