library(secrdesign)


### Name: summary.secrdesign
### Title: Generic Methods for secrdesign Objects
### Aliases: summary.secrdesign summary.rawdata summary.estimatetables
###   summary.selectedstatistics plot.selectedstatistics header
### Keywords: Generic

### ** Examples


## collect raw counts
scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2)
traps1 <- make.grid()
tmp1 <- run.scenarios(nrepl = 50, trapset = traps1, scenarios = scen1,
    fit = FALSE)

opar <- par(mfrow=c(2,3))
plot(tmp1, statistic = 1:3)
par(opar)

summary(tmp1)

summary(tmp1, field=c('q025', 'median', 'q975'))




