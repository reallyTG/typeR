library(backtest)


### Name: backtest
### Title: Creating an Object of Class Backtest
### Aliases: backtest
### Keywords: file

### ** Examples


data(starmine)

## Backtest with 1 'in.var' and 1 'ret.var'

bt <- backtest(starmine, in.var = "smi", ret.var = "ret.0.1.m", by.period = FALSE)
summary(bt)

## Backtest with 2 'in.var' values, 1 'ret.var', and a 'by.var'

bt <- backtest(starmine, in.var = c("smi", "cap.usd"),
               ret.var = "ret.0.1.m", by.var = "sector", by.period = FALSE)
summary(bt)

## Backtest with 1 'in.var', 1 'by.var', and 1 'ret.var'.  Number of
## buckets changed from default of 5 to 4.  Change in number of buckets
## only affects the 'in.var' because the 'by.var' column in 'starmine'
## contains character data. For each value in this column there is a
## unique category.

bt <- backtest(starmine, in.var = "smi", by.var = "sector",
               ret.var = "ret.0.1.m", buckets = 4, by.period = FALSE)
summary(bt)

## Backtest with 1 'in.var', multiple 'ret.var', and a
## universe restriction

bt <- backtest(starmine, in.var = "smi",
               ret.var = c("ret.0.1.m", "ret.0.6.m"),
               universe = sector == "HiTec", by.period = FALSE)
summary(bt)

## Running a natural backtest with 2 'in.vars', 1 'ret.var'
## 10 buckets

bt <- backtest(starmine, in.var = c("smi","cap.usd"),
               ret.var = "ret.0.1.m", date.var = "date",
               id.var = "id", buckets = 10,
               natural = TRUE, by.period = FALSE)
summary(bt)

## The same backtest, but calculating quantiles within periods.

bt <- backtest(starmine, in.var = c("smi","cap.usd"),
               ret.var = "ret.0.1.m", date.var = "date",
               id.var = "id", buckets = 10,
               natural = TRUE, by.period = TRUE)
summary(bt)

plot(bt, type = "turnover")
plot(bt, type = "return")
plot(bt, type = "cumreturn")
plot(bt, type = "cumreturn.split")





