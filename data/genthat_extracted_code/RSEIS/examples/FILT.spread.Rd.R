library(RSEIS)


### Name: FILT.spread
### Title: Filter trace with a spread of filters
### Aliases: FILT.spread
### Keywords: hplot

### ** Examples

data(KH)
dt  <-  KH$dt[1]

y  <-   KH$JSTR[[1]]

x  <-   seq(from=0, by=dt, length=length(y))



fl <- rep(1/100, 5)
fh <- 1/c(1,2,5,10,20)

FILT.spread(x, y, dt, fl = fl, fh = fh, sfact = 1,
   WIN = NULL, PLOT = TRUE, TIT = NULL, TAPER = 0.05)





