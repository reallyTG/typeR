library(pa)


### Name: regression-class
### Title: Class "regression"
### Aliases: regression-class exposure,regression-method
###   plot,regression-method returns,regression-method
###   show,regression-method summary,regression-method
### Keywords: classes

### ** Examples


## Single-period regression analysis

data(jan)

r1 <-regress(x = jan, date.var = "date", ret.var = "return", reg.var = c("sector",
"value", "growth"), benchmark.weight = "benchmark", portfolio.weight =
"portfolio")

summary(r1)




