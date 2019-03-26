library(strucchange)


### Encoding: UTF-8

### Name: GermanM1
### Title: German M1 Money Demand
### Aliases: GermanM1 historyM1 monitorM1
### Keywords: datasets

### ** Examples

data("GermanM1")
## Lütkepohl et al. (1999) use the following model
LTW.model <- dm ~ dy2 + dR + dR1 + dp + m1 + y1 + R1 + season
## Zeileis et al. (2005) use
M1.model <- dm ~ dy2 + dR + dR1 + dp + ecm.res + season


## historical tests
ols <- efp(LTW.model, data = GermanM1, type = "OLS-CUSUM")
plot(ols)
re <- efp(LTW.model, data = GermanM1, type = "fluctuation")
plot(re)
fs <- Fstats(LTW.model, data = GermanM1, from = 0.1)
plot(fs)

## monitoring
M1 <- historyM1
ols.efp <- efp(M1.model, type = "OLS-CUSUM", data = M1)
newborder <- function(k) 1.5778*k/118
ols.mefp <- mefp(ols.efp, period = 2)
ols.mefp2 <- mefp(ols.efp, border = newborder)
M1 <- GermanM1
ols.mon <- monitor(ols.mefp)
ols.mon2 <- monitor(ols.mefp2)
plot(ols.mon)
lines(boundary(ols.mon2), col = 2)

## dating
bp <- breakpoints(LTW.model, data = GermanM1)
summary(bp)
plot(bp)

plot(fs)
lines(confint(bp))



