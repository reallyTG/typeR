library(crqa)


### Name: CTcrqa
### Title: Contingency Table Cross-Recurrence Quantification Analysis
### Aliases: CTcrqa

### ** Examples


## simulate two dichotomous series
tS = simts(0.25, 0.05, 0.2, 0.2, 0.25, 50)
ts1 = tS[1,]; ts2 = tS[2,]

## check data(crqa) for alternative data
## (e.g., RDts1, RDts2)

par = list(lags = seq(1, 40, 1), datatype = "categorical", thrshd = 8);
res = CTcrqa(ts1, ts2, par)

## show profile

plot(seq(1,length(res),1), res, xlab = "Delays",
ylab = "Recurrence", type = "l", lwd = 3)




