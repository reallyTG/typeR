library(rPraat)


### Name: tg.insertBoundary
### Title: tg.insertBoundary
### Aliases: tg.insertBoundary

### ** Examples

tg <- tg.sample()
tg2 <- tg.insertNewIntervalTier(tg, 1, "INTERVALS")
tg2 <- tg.insertBoundary(tg2, "INTERVALS", 0.8)
tg2 <- tg.insertBoundary(tg2, "INTERVALS", 0.1, "Interval A")
tg2 <- tg.insertInterval(tg2, "INTERVALS", 1.2, 2.5, "Interval B")
## Not run: 
##D tg.plot(tg2)
## End(Not run)



