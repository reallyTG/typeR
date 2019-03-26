library(TTR)


### Name: TRIX
### Title: Triple Smoothed Exponential Oscillator
### Aliases: TRIX
### Keywords: ts

### ** Examples


data(ttrc)
trix  <- TRIX(ttrc[,"Close"])
trix4 <- TRIX(ttrc[,"Close"],
maType=list(list(SMA), list(EMA, wilder=TRUE), list(SMA), list(DEMA)))




