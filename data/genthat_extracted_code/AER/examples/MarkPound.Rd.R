library(AER)


### Name: MarkPound
### Title: DEM/GBP Exchange Rate Returns
### Aliases: MarkPound
### Keywords: datasets

### ** Examples

## data as given by Greene (2003)
data("MarkPound")
mp <- round(MarkPound, digits = 6)

## Figure 11.3 in Greene (2003)
plot(mp)

## Example 11.8 in Greene (2003), Table 11.5
library("tseries")
mp_garch <- garch(mp, grad = "numerical")
summary(mp_garch)
logLik(mp_garch)  
## Greene (2003) also includes a constant and uses different
## standard errors (presumably computed from Hessian), here
## OPG standard errors are used. garchFit() in "fGarch"
## implements the approach used by Greene (2003).

## compare Errata to Greene (2003)
library("dynlm")
res <- residuals(dynlm(mp ~ 1))^2
mp_ols <- dynlm(res ~ L(res, 1:10))
summary(mp_ols)
logLik(mp_ols)
summary(mp_ols)$r.squared * length(residuals(mp_ols))



