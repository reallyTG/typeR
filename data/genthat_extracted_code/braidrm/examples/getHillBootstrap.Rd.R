library(braidrm)


### Name: getHillBootstrap
### Title: Bootstrap Hill Equation Parameter Confidence Intervals
### Aliases: getHillBootstrap
### Keywords: regression

### ** Examples

data(es8olatmz)
drv <- es8olatmz$compound2=="DMSO"
hfit <- findBestHill(act~conc1,es8olatmz[drv,],defaults=c(0,-2.7))
hfit1 <- getHillBootstrap(hfit)

# Setting 'mi' to 4 constructs a confidence interval on the four-
# parameter Hill model, overriding the 'best' model index
hfit2 <- getHillBootstrap(hfit,ciLevs=c(0.05,0.95),mi=4)



