library(backtest)


### Name: backtest-class
### Title: Class "backtest"
### Aliases: backtest-class show,backtest-method summary,backtest-method
###   summaryStats,backtest-method means,backtest-method
###   counts,backtest-method totalCounts,backtest-method
###   marginals,backtest-method naCounts,backtest-method
###   turnover,backtest-method ci,backtest-method
###   plot,backtest,missing-method means counts summaryStats totalCounts
###   marginals naCounts turnover ci plot
### Keywords: classes

### ** Examples


data(starmine)
bt <- backtest(starmine, in.var = "smi", ret.var = "ret.0.1.m", by.period = FALSE)

## Summary for a pooled backtest

summary(bt)

## A natural backtest

bt <- backtest(starmine, in.var = "smi", ret.var = "ret.0.1.m",
               date.var = "date", id.var = "id", natural = TRUE, by.period = FALSE)

## Summary for a natural backtest

summary(bt)

## Other access methods

means(bt)
counts(bt)
marginals(bt)
naCounts(bt)

## Plotting methods

plot(bt, type = "turnover")
plot(bt, type = "return")
plot(bt, type = "cumreturn")




