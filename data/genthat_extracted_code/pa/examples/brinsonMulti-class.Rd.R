library(pa)


### Name: brinsonMulti-class
### Title: Class "brinsonMulti"
### Aliases: brinsonMulti-class show,brinsonMulti-method
###   summary,brinsonMulti-method exposure,brinsonMulti-method
###   returns,brinsonMulti-method plot,brinsonMulti-method
### Keywords: classes

### ** Examples


## Multi-period brinson analysis
data(quarter)
p2 <- brinson(x = quarter, date.var = "date", cat.var = "sector",
bench.weight = "benchmark", portfolio.weight = "portfolio", ret.var = "return")
summary(p2)




