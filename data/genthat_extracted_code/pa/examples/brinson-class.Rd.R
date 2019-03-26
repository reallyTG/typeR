library(pa)


### Name: brinson-class
### Title: Class "brinson"
### Aliases: brinson-class exposure,brinson-method plot,brinson-method
###   returns,brinson-method show,brinson-method summary,brinson-method
### Keywords: classes

### ** Examples


data(jan)

## Single-period brinson analysis

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

summary(p1)

exposure(p1, var = "sector")

returns(p1)

plot(p1, var = "sector", type = "exposure")

plot(p1, var = "sector", type = "return")




