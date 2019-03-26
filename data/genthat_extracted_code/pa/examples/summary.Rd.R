library(pa)


### Name: summary
### Title: Provide a summary for Brinson or regression analysis
### Aliases: summary
### Keywords: file

### ** Examples


## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

summary(p1)

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

summary(p2)




