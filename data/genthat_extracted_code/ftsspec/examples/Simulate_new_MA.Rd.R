library(ftsspec)


### Name: Simulate_new_MA
### Title: Simulate a new Moving Average (MA) vector time series and return
###   the time series
### Aliases: Simulate_new_MA

### ** Examples

ma.scale1=c(-1.4,2.3,-2)
a1=Generate_filterMA(6, 6, MA.len=3, ma.scale=ma.scale1)
X=Simulate_new_MA(a1, T.len=512, noise.type='wiener')
plot.ts(X)



