library(strucchange)


### Name: Grossarl
### Title: Marriages, Births and Deaths in Grossarl
### Aliases: Grossarl
### Keywords: datasets

### ** Examples

data("Grossarl")

## time series of births, deaths, marriages
###########################################

with(Grossarl, plot(cbind(deaths, illegitimate + legitimate, marriages),
  plot.type = "single", col = grey(c(0.7, 0, 0)), lty = c(1, 1, 3),
  lwd = 1.5, ylab = "annual Grossarl series"))
legend("topright", c("deaths", "births", "marriages"), col = grey(c(0.7, 0, 0)),
  lty = c(1, 1, 3), bty = "n")

## illegitimate births
######################
## lm + MOSUM
plot(Grossarl$fraction)
fm.min <- lm(fraction ~ politics, data = Grossarl)
fm.ext <- lm(fraction ~ politics + morals + nuptiality + marriages,
  data = Grossarl)
lines(ts(fitted(fm.min), start = 1700), col = 2)
lines(ts(fitted(fm.ext), start = 1700), col = 4)
mos.min <- efp(fraction ~ politics, data = Grossarl, type = "OLS-MOSUM")
mos.ext <- efp(fraction ~ politics + morals + nuptiality + marriages,
  data = Grossarl, type = "OLS-MOSUM")
plot(mos.min)
lines(mos.ext, lty = 2)

## dating
bp <- breakpoints(fraction ~ 1, data = Grossarl, h = 0.1)
summary(bp)
## RSS, BIC, AIC
plot(bp)
plot(0:8, AIC(bp), type = "b")

## probably use 5 or 6 breakpoints and compare with
## coding of the factors as used by us
##
## politics                   1803      1816 1850
## morals      1736 1753 1771 1803
## nuptiality                 1803 1810 1816      1883
##
## m = 5            1753 1785           1821 1856 1878
## m = 6       1734 1754 1785           1821 1856 1878
##              6    2    5              1    4    3

## fitted models
coef(bp, breaks = 6)
plot(Grossarl$fraction)
lines(fitted(bp, breaks = 6), col = 2)
lines(ts(fitted(fm.ext), start = 1700), col = 4)


## marriages
############
## lm + MOSUM
plot(Grossarl$marriages)
fm.min <- lm(marriages ~ politics, data = Grossarl)
fm.ext <- lm(marriages ~ politics + morals + nuptiality, data = Grossarl)
lines(ts(fitted(fm.min), start = 1700), col = 2)
lines(ts(fitted(fm.ext), start = 1700), col = 4)
mos.min <- efp(marriages ~ politics, data = Grossarl, type = "OLS-MOSUM")
mos.ext <- efp(marriages ~ politics + morals + nuptiality, data = Grossarl,
  type = "OLS-MOSUM")
plot(mos.min)
lines(mos.ext, lty = 2)

## dating
bp <- breakpoints(marriages ~ 1, data = Grossarl, h = 0.1)
summary(bp)
## RSS, BIC, AIC
plot(bp)
plot(0:8, AIC(bp), type = "b")

## probably use 3 or 4 breakpoints and compare with
## coding of the factors as used by us
##
## politics                   1803      1816 1850
## morals      1736 1753 1771 1803
## nuptiality                 1803 1810 1816      1883
##
## m = 3       1738                     1813      1875
## m = 4       1738      1794           1814      1875
##              2         4              1         3

## fitted models
coef(bp, breaks = 4)
plot(Grossarl$marriages)
lines(fitted(bp, breaks = 4), col = 2)
lines(ts(fitted(fm.ext), start = 1700), col = 4)



