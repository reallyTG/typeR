library(lfstat)


### Name: tyearsS
### Title: Calculate Low-Flow Quantiles for given Return Periods
### Aliases: tyearsS
### Keywords: low-flow fitting

### ** Examples
data("ngaruroro")
rp <- c(1.3, 3, 5, 35)
sumD <- tyearsS(ngaruroro, event = rp, dist = "wei",
                variable = "d", aggr = sum)
sumD
summary(sumD)



