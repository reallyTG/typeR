library(crqa)


### Name: crqa
### Title: Cross recurrence measures of two time-series, time-delayed and
###   embedded in higher dimensional space
### Aliases: crqa
### Keywords: ts

### ** Examples


## simulate two dichotomous series
tS = simts(0.25, 0.05, 0.2, 0.2, 0.25, 100)
ts1 = tS[1,]; ts2 = tS[2,]

## check data(crqa) for alternative data
## (e.g., RDts1, RDts2)

## initialize the parameters

delay = 1; embed = 1; rescale = 1; radius = 0.001;
normalize = 0; mindiagline = 2; minvertline = 2;
tw = 0; whiteline = FALSE; recpt = FALSE; side = "both"
checkl = list(do = FALSE, thrshd = 3, datatype = "categorical",
    pad = TRUE)

ans = crqa(ts2, ts1, delay, embed, rescale, radius, normalize,
mindiagline, minvertline, tw, whiteline, recpt, side, checkl)

print(ans[1:9]) ## last argument of list is the cross-recurrence plot
RP = ans$RP ## take out RP




