library(strucchange)


### Name: DJIA
### Title: Dow Jones Industrial Average
### Aliases: DJIA
### Keywords: datasets

### ** Examples

data("DJIA")
## look at log-difference returns
djia <- diff(log(DJIA))
plot(djia)

## convenience functions
## set up a normal regression model which
## explicitely also models the variance
normlm <- function(formula, data = list()) {
  rval <- lm(formula, data = data)
  class(rval) <- c("normlm", "lm")
  return(rval)
}
estfun.normlm <- function(obj) {
  res <- residuals(obj)
  ef <- NextMethod(obj)
  sigma2 <- mean(res^2)
  rval <- cbind(ef, res^2 - sigma2)
  colnames(rval) <- c(colnames(ef), "(Variance)")
  return(rval)
}

## normal model (with constant mean and variance) for log returns
m1 <- gefp(djia ~ 1, fit = normlm, vcov = meatHAC, sandwich = FALSE)
plot(m1, aggregate = FALSE)
## suggests a clear break in the variance (but not the mean)

## dating
bp <- breakpoints(I(djia^2) ~ 1)
plot(bp)
## -> clearly one break
bp
time(djia)[bp$breakpoints]

## visualization
plot(djia)
abline(v = time(djia)[bp$breakpoints], lty = 2)
lines(time(djia)[confint(bp)$confint[c(1,3)]], rep(min(djia), 2), col = 2, type = "b", pch = 3)



