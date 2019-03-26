library(rPraat)


### Name: tg.createNewTextGrid
### Title: tg.createNewTextGrid
### Aliases: tg.createNewTextGrid

### ** Examples

tg <- tg.createNewTextGrid(0, 5)
tg <- tg.insertNewIntervalTier(tg, 1, "word")
tg <- tg.insertInterval(tg, "word", 1, 2, "hello")
tg.plot(tg)



