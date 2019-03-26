library(crqa)


### Name: calcphi
### Title: Extract the phi-coefficient observed between the two time-series
###   on a specific state k.
### Aliases: calcphi
### Keywords: ts

### ** Examples


## simulate two dichotomous series
tS = simts(0.25, 0.05, 0.2, 0.2, 0.25, 100)
ts1 = tS[1,]; ts2 = tS[2,]

## k = 1, as series are dichotomous
## check data(crqa) for alternative data (RDts1, RDts2)

k = 1; ws = 40
res = calcphi(ts1, ts2, ws, k)




