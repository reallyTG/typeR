library(bmd)


### Name: bmd
### Title: Calculation of benchmark doses
### Aliases: bmd
### Keywords: models nonlinear

### ** Examples


## Fitting log-logistic two-parameter model to binomial data
deguelin.m1 <- drm(r/n~dose, weights=n, data=deguelin, fct=LL.2(), type="binomial")

## Estimated EC values for comparison
ED(deguelin.m1, c(5, 10, 50), interval = "delta")

## Excess risk with BMR=5% and background 0
bmd(deguelin.m1, 0.05)

## Additional risk BMR=5% and with background 0
bmd(deguelin.m1, 0.05, def = "additional")

## Excess risk with BMR=5% and known background
bmd(deguelin.m1, 0.05, backg = 0.05)

## Additional risk with BMR=5% and known background
## similar but not identical to excess risk
bmd(deguelin.m1, 0.05, backg = 0.05, def = "additional", display = TRUE)

## Model-average BMD using additional risk
bmd(deguelin.m1, 0.05, backg = 0.05, def = "additional", ma = TRUE, display = TRUE)


## Benchmark doses for a continuous response
ryegrass.m1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.4())

## Standard single-model BMD using relative values (background level cannot be incorporated)
bmd(ryegrass.m1, 0.05, def = "relative", display = TRUE)

## Standard single-model BMD using the hybrid method (background level can be incorporated)
bmd(ryegrass.m1, 0.05, backg = 0.05, def = "hybrid", display = TRUE)

## Model avaraged BMD using relative values (background level cannot be incorporated)
bmd(ryegrass.m1, 0.05, def = "relative", ma = TRUE, display = TRUE)

## Model avaraged BMD using the "hybrid" method
bmd(ryegrass.m1, 0.05, backg = 0.05, def = "hybrid", ma = TRUE, display = TRUE)
 

## Example from p. 41 in: EFSA (2009). Guidance of the Scientific Committee on a request from EFSA 
##  on the use of the benchmark dose approach in risk assessment
##  The EFSA Journal, 1150, 1-72 
efsa2009p41 <- data.frame(dose=c(0,3,12,30), number=c(6,6,34,42), total=rep(50,4))
efsa2009p41.LL2 <- drm(number/total~dose, weights=total, data=efsa2009p41, type="binomial", fct=LL.2())
plot(efsa2009p41.LL2)  # no great fit close to the control group

efsa2009p41.LL3u <- drm(number/total~dose, weights=total, data=efsa2009p41, type="binomial", fct=LL.3u())
plot(efsa2009p41.LL3u)
modelFit(efsa2009p41.LL3u)
summary(efsa2009p41.LL3u)  # background level is 0.096477

bmd(efsa2009p41.LL3u, 0.1, backg = coef(efsa2009p41.LL3u)[2])
# using a background level of 0.096477
# not far from the estimates reported by EFSA: BMD=3.23, BMDL=1.9


## Example from Hwang et al. (2009)
hwang2009 <- data.frame(dose = c(0, 2.68, 10.34, 37.03), number = c(1,0,2,9), total = c(50,50,50,50))
hwang2009.LN2 <- drm(number/total ~ dose, weights = total, data = hwang2009, type = "binomial", fct = LN.2())

plot(hwang2009.LN2)
summary(hwang2009.LN2)

bmd(hwang2009.LN2, 0.1)  # BMR=0.1
# BMD=21.94894, BMDL=13.34339 (smaller than the estimates reported by Piegorsch (2010))
#  but the models also differ as here log-transformed dose is implicitly used
# additional and extra risks are identical for this model (because the background p0 is 0)

hwang2009.N2 <- glm(number/total~dose, weights=total, data=hwang2009, family=binomial("probit"))
summary(hwang2009.N2)  # same estimates as in Piegorsch (2010)
# a model implicitly assuming a non-zero background p0=pnorm(-2.252)=0.012





