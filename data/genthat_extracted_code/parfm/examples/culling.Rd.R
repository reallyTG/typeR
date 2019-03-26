library(parfm)


### Name: culling
### Title: Culling of dairy heifer cows
### Aliases: culling
### Keywords: datasets culling cows frailty

### ** Examples

## No test: 
data(culling)
head(culling)
culling <- culling[culling$Time > 0,]
culling$TimeMonths <- culling$Time * 12 / 365.25

coxmod <- parfm(Surv(TimeMonths, Status) ~ LogSCC, data = culling,
                dist = "exponential", frailty = "none")
coxmod

pfmod <- parfm(Surv(TimeMonths, Status) ~ LogSCC, data = culling,
               cluster = "Herd", dist = "exponential", frailty = "gamma")
pfmod
## End(No test)



