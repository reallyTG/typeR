library(crqa)


### Name: optimizeParam
### Title: Optimal parameters value for CRQA on continuous time-series data
### Aliases: optimizeParam
### Keywords: ts

### ** Examples


## initialize the parameters

par = list(lgM =  20, steps = seq(1, 6, 1), 
radiusspan = 100, radiussample = 40, 
normalize = 0, rescale = 1, mindiagline = 2, 
minvertline = 2, tw = 0, whiteline = FALSE, 
recpt = FALSE, fnnpercent = 10, typeami = "mindip")


## generate two random uniform series

ts1 = runif(100)
ts2 = runif(100)

ans = optimizeParam(ts1, ts2, par, min.rec = 2, max.rec = 5)
print(ans)

## utilize leftmov, rightmov for an application to real-data
## reduce radiussample to increase computational speed

## data(crqa)
## ans = optimizeParam(leftmov, rightmov, par)
## print(ans)




