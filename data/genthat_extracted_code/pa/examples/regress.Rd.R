library(pa)


### Name: regress
### Title: Create an object of either class regress or class regressMulti
### Aliases: regress
### Keywords: file

### ** Examples


## Single-period regression analysis

data(jan)

r1 <-regress(x = jan, date.var = "date", ret.var = "return", reg.var =
c("sector", "value", "growth"), benchmark.weight = "benchmark",
portfolio.weight = "portfolio")

summary(r1)

## Multi-period regression analysis

data(quarter)

r2 <-regress(x = quarter, date.var = "date", ret.var = "return", reg.var
= c("sector", "value", "growth"), benchmark.weight = "benchmark",
portfolio.weight = "portfolio")

summary(r2)




