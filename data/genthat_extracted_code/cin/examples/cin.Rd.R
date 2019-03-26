library(cin)


### Name: cin
### Title: inference under interference
### Aliases: cin
### Keywords: nonparametric ts

### ** Examples

## simulation from the null
fmri.ts <- arima.sim(list(order = c(1,1,0), ar = 0.7), n = 1000)
events <- sample(1000, 400)
stimt <- sample(events, 100)
stimc <- setdiff(events, stimt)
cin(list(list(fmri=fmri.ts, stimc=stimc, stimt=stimt)), TR=2)



