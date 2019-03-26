library(pa)


### Name: exposure
### Title: Calculate and display the sector exposure of a portfolio
### Aliases: exposure
### Keywords: file

### ** Examples


## Single-period brinson analysis

data(jan)

p1 <- brinson(x = jan, date.var = "date", cat.var = "sector",
    bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var
    = "return")

exposure(p1, var = "size")

## Multi-period brinson analysis

data(quarter)

p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var =
"return")

exposure(p2, var = "sector")




