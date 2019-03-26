library(rPraat)


### Name: tg.insertNewPointTier
### Title: tg.insertNewPointTier
### Aliases: tg.insertNewPointTier

### ** Examples

## Not run: 
##D tg <- tg.sample()
##D tg2 <- tg.insertNewPointTier(tg, 1, "POINTS")
##D tg2 <- tg.insertPoint(tg2, "POINTS", 3, "MY POINT")
##D tg2 <- tg.insertNewPointTier(tg2, Inf, "POINTS2")  # the last tier
##D tg2 <- tg.insertPoint(tg2, "POINTS2", 2, "point in the last tier")
##D tg.plot(tg2)
## End(Not run)



