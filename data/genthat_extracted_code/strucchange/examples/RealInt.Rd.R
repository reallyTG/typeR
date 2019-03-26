library(strucchange)


### Name: RealInt
### Title: US Ex-post Real Interest Rate
### Aliases: RealInt
### Keywords: datasets

### ** Examples

## load and plot data
data("RealInt")
plot(RealInt)

## estimate breakpoints
bp.ri <- breakpoints(RealInt ~ 1, h = 15)
plot(bp.ri)
summary(bp.ri)

## fit segmented model with three breaks
fac.ri <- breakfactor(bp.ri, breaks = 3, label = "seg")
fm.ri <- lm(RealInt ~ 0 + fac.ri)
summary(fm.ri)

## setup kernel HAC estimator
vcov.ri <- function(x, ...) kernHAC(x, kernel = "Quadratic Spectral",
  prewhite = 1, approx = "AR(1)", ...)

## Results from Table 1 in Bai & Perron (2003):
## coefficient estimates
coef(bp.ri, breaks = 3)
## corresponding standard errors
sapply(vcov(bp.ri, breaks = 3, vcov = vcov.ri), sqrt)
## breakpoints and confidence intervals
confint(bp.ri, breaks = 3, vcov = vcov.ri)

## Visualization
plot(RealInt)
lines(as.vector(time(RealInt)), fitted(fm.ri), col = 4)
lines(confint(bp.ri, breaks = 3, vcov = vcov.ri))



