library(lmtest)


### Name: bondyield
### Title: Bond Yield
### Aliases: bondyield
### Keywords: datasets

### ** Examples

data(bondyield)

## page 134, fit Cook-Hendershott OLS model and Yawitz-Marshall OLS model
## third and last line in Table 6.5

modelCH <- RAARUS ~ MOOD + EPI + EXP + RUS
lm(modelCH, data=bondyield)
dwtest(modelCH, data=bondyield)
## wrong sign of RUS coefficient

modelYM <- RAARUS ~ MOOD + Y + K
lm(modelYM, data=bondyield)
dwtest(modelYM, data=bondyield)
## coefficient of Y and K differ by factor 100


## page 135, fit test statistics in Table 6.6 b)
################################################

## Chow 1971(1)
if(require(strucchange, quietly = TRUE)) {
sctest(modelCH, point=c(1971,1), data=bondyield, type="Chow") }

## Breusch-Pagan
bptest(modelCH, data=bondyield, studentize=FALSE)
bptest(modelCH, data=bondyield)

## Fluctuation test
if(require(strucchange, quietly = TRUE)) {
sctest(modelCH, type="fluctuation", data=bondyield, rescale=FALSE)}

## RESET
reset(modelCH, data=bondyield)
reset(modelCH, power=2, type="regressor", data=bondyield)
reset(modelCH, type="princomp", data=bondyield)

## Harvey-Collier
harvtest(modelCH, order.by= ~ MOOD, data=bondyield)
harvtest(modelCH, order.by= ~ EPI, data=bondyield)
harvtest(modelCH, order.by= ~ EXP, data=bondyield)
harvtest(modelCH, order.by= ~ RUS, data=bondyield)

## Rainbow
raintest(modelCH, order.by = "mahalanobis", data=bondyield)


## page 136, fit test statistics in Table 6.6 d)
################################################

## Chow 1966(1)
if(require(strucchange, quietly = TRUE)) {
sctest(modelYM, point=c(1965,4), data=bondyield, type="Chow") }

## Fluctuation test
if(require(strucchange, quietly = TRUE)) {
sctest(modelYM, type="fluctuation", data=bondyield, rescale=FALSE) }

## RESET
reset(modelYM, data=bondyield)
reset(modelYM, power=2, type="regressor", data=bondyield)
reset(modelYM, type="princomp", data=bondyield)

## Harvey-Collier
harvtest(modelYM, order.by= ~ MOOD, data=bondyield)
harvtest(modelYM, order.by= ~ Y, data=bondyield)
harvtest(modelYM, order.by= ~ K, data=bondyield)

## Rainbow
raintest(modelYM, order.by = "mahalanobis", data=bondyield)



