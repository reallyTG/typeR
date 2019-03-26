library(pa)


### Name: regressionMulti-class
### Title: Class "regressionMulti"
### Aliases: regressionMulti-class exposure,regressionMulti-method
###   plot,regressionMulti-method returns,regressionMulti-method
###   show,regressionMulti-method summary,regressionMulti-method
### Keywords: classes

### ** Examples


## Multi-period regression analysis

data(quarter)

r2 <-regress(x = quarter, date.var = "date", ret.var = "return", reg.var = c("sector",
"value", "growth"), benchmark.weight = "benchmark", portfolio.weight =
"portfolio")

summary(r2)




