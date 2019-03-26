library(strucchange)


### Name: PhillipsCurve
### Title: UK Phillips Curve Equation Data
### Aliases: PhillipsCurve
### Keywords: datasets

### ** Examples

## load and plot data
data("PhillipsCurve")
uk <- window(PhillipsCurve, start = 1948)
plot(uk[, "dp"])

## AR(1) inflation model
## estimate breakpoints
bp.inf <- breakpoints(dp ~ dp1, data = uk, h = 8)
plot(bp.inf)
summary(bp.inf)

## fit segmented model with three breaks
fac.inf <- breakfactor(bp.inf, breaks = 2, label = "seg")
fm.inf <- lm(dp ~ 0 + fac.inf/dp1, data = uk)
summary(fm.inf)

## Results from Table 2 in Bai & Perron (2003):
## coefficient estimates
coef(bp.inf, breaks = 2)
## corresponding standard errors
sqrt(sapply(vcov(bp.inf, breaks = 2), diag))
## breakpoints and confidence intervals
confint(bp.inf, breaks = 2)

## Phillips curve equation
## estimate breakpoints
bp.pc <- breakpoints(dw ~ dp1 + du + u1, data = uk, h = 5, breaks = 5)
## look at RSS and BIC
plot(bp.pc)
summary(bp.pc)

## fit segmented model with three breaks
fac.pc <- breakfactor(bp.pc, breaks = 2, label = "seg")
fm.pc <- lm(dw ~ 0 + fac.pc/dp1 + du + u1, data = uk)
summary(fm.pc)

## Results from Table 3 in Bai & Perron (2003):
## coefficient estimates
coef(fm.pc)
## corresponding standard errors
sqrt(diag(vcov(fm.pc)))
## breakpoints and confidence intervals
confint(bp.pc, breaks = 2, het.err = FALSE)



