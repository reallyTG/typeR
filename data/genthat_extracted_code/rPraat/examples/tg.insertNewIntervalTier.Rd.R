library(rPraat)


### Name: tg.insertNewIntervalTier
### Title: tg.insertNewIntervalTier
### Aliases: tg.insertNewIntervalTier

### ** Examples

## Not run: 
##D tg <- tg.sample()
##D tg2 <- tg.insertNewIntervalTier(tg, 1, "INTERVALS")
##D tg2 <- tg.insertBoundary(tg2, "INTERVALS", 0.8)
##D tg2 <- tg.insertBoundary(tg2, "INTERVALS", 0.1, "Interval A")
##D tg2 <- tg.insertInterval(tg2, "INTERVALS", 1.2, 2.5, "Interval B")
##D tg2 <- tg.insertNewIntervalTier(tg2, Inf, "LastTier")
##D tg2 <- tg.insertInterval(tg2, "LastTier", 1, 3, "This is the last tier")
##D tg.plot(tg2)
## End(Not run)



