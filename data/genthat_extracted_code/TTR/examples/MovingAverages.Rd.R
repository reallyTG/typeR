library(TTR)


### Name: SMA
### Title: Moving Averages
### Aliases: SMA MovingAverages EMA WMA DEMA GD T3 EVWMA ZLEMA VWAP VWMA
###   VMA MA EMA DEMA WMA EVWMA ZLEMA VWAP VMA HMA ALMA
### Keywords: ts

### ** Examples


data(ttrc)
ema.20 <-   EMA(ttrc[,"Close"], 20)
sma.20 <-   SMA(ttrc[,"Close"], 20)
dema.20 <-  DEMA(ttrc[,"Close"], 20)
evwma.20 <- EVWMA(ttrc[,"Close"], ttrc[,"Volume"], 20)
zlema.20 <- ZLEMA(ttrc[,"Close"], 20)
alma <- ALMA(ttrc[,"Close"])
hma <- HMA(ttrc[,"Close"])

## Example of Tim Tillson's T3 indicator
T3 <- function(x, n=10, v=1) DEMA(DEMA(DEMA(x,n,v),n,v),n,v)
t3 <- T3(ttrc[,"Close"])

## Example of short-term instability of EMA
## (and other indicators mentioned above)
x <- rnorm(100)
tail( EMA(x[90:100],10), 1 )
tail( EMA(x[70:100],10), 1 )
tail( EMA(x[50:100],10), 1 )
tail( EMA(x[30:100],10), 1 )
tail( EMA(x[10:100],10), 1 )
tail( EMA(x[ 1:100],10), 1 )




