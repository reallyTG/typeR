library(rPraat)


### Name: tg.cut0
### Title: tg.cut0
### Aliases: tg.cut0

### ** Examples

tg <- tg.sample()
tg2 <-   tg.cut(tg,  tStart = 3)
tg2_0 <- tg.cut0(tg, tStart = 3)
tg3 <-   tg.cut(tg,  tStart = 2, tEnd = 3)
tg3_0 <- tg.cut0(tg, tStart = 2, tEnd = 3)
tg4 <-   tg.cut(tg,  tEnd = 1)
tg4_0 <- tg.cut0(tg, tEnd = 1)
tg5 <-   tg.cut(tg,  tStart = -1, tEnd = 5)
tg5_0 <- tg.cut0(tg, tStart = -1, tEnd = 5)
## Not run: 
##D tg.plot(tg)
##D tg.plot(tg2)
##D tg.plot(tg2_0)
##D tg.plot(tg3)
##D tg.plot(tg3_0)
##D tg.plot(tg4)
##D tg.plot(tg4_0)
##D tg.plot(tg5)
##D tg.plot(tg5_0)
## End(Not run)



