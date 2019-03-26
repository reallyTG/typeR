library(AER)


### Name: FrozenJuice
### Title: Price of Frozen Orange Juice
### Aliases: FrozenJuice
### Keywords: datasets

### ** Examples

## load data
data("FrozenJuice")

## Stock and Watson, p. 594
library("dynlm")
fm_dyn <- dynlm(d(100 * log(price/ppi)) ~ fdd, data = FrozenJuice)
coeftest(fm_dyn, vcov = vcovHC(fm_dyn, type = "HC1"))

## equivalently, returns can be computed 'by hand'
## (reducing the complexity of the formula notation)
fj <- ts.union(fdd = FrozenJuice[, "fdd"],
  ret = 100 * diff(log(FrozenJuice[,"price"]/FrozenJuice[,"ppi"])))
fm_dyn <- dynlm(ret ~ fdd, data = fj)

## Stock and Watson, p. 595
fm_dl <- dynlm(ret ~ L(fdd, 0:6), data = fj)
coeftest(fm_dl, vcov = vcovHC(fm_dl, type = "HC1"))

## Stock and Watson, Table 15.1, p. 620, numbers refer to columns
## (1) Dynamic Multipliers 
fm1 <- dynlm(ret ~ L(fdd, 0:18), data = fj)
coeftest(fm1, vcov = NeweyWest(fm1, lag = 7, prewhite =  FALSE))
## (2) Cumulative Multipliers
fm2 <- dynlm(ret ~ L(d(fdd), 0:17) + L(fdd, 18), data = fj)
coeftest(fm2, vcov = NeweyWest(fm2, lag = 7, prewhite =  FALSE))
## (3) Cumulative Multipliers, more lags in NW
coeftest(fm2, vcov = NeweyWest(fm2, lag = 14, prewhite =  FALSE))
## (4) Cumulative Multipliers with monthly indicators
fm4 <- dynlm(ret ~ L(d(fdd), 0:17) + L(fdd, 18) + season(fdd), data = fj)
coeftest(fm4, vcov = NeweyWest(fm4, lag = 7, prewhite =  FALSE))
## monthly indicators needed?
fm4r <- update(fm4, . ~ . - season(fdd))
waldtest(fm4, fm4r, vcov= NeweyWest(fm4, lag = 7, prewhite = FALSE)) ## close ...



