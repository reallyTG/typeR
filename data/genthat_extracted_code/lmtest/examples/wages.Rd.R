library(lmtest)


### Name: wages
### Title: Wages
### Aliases: wages
### Keywords: datasets

### ** Examples

data(wages)

## data transformation to include lagged series
mywages <- cbind(wages, lag(wages[,2], k = -1), lag(wages[,2], k = -2))
colnames(mywages) <- c(colnames(wages), "CPI2", "CPI3")
mywages <- window(mywages, start=1962, end=1979)

## page 142, fit Nichols OLS model
## equation (6.10)

modelNichols <- w ~ CPI + CPI2 + CPI3 + u + mw
lm(modelNichols, data = mywages)

## page 143, fit test statistics in table 6.11
##############################################

if(require(strucchange, quietly = TRUE)) {
## Chow 1972
sctest(modelNichols, point=c(1971,1), data=mywages, type="Chow") }

## Breusch-Pagan
bptest(modelNichols, data=mywages, studentize=FALSE)
bptest(modelNichols, data=mywages)

## RESET (a)-(b)
reset(modelNichols, data=mywages)
reset(modelNichols, power=2, type="regressor", data=mywages)

## Harvey-Collier
harvtest(modelNichols, order.by = ~ CPI, data=mywages)
harvtest(modelNichols, order.by = ~ CPI2, data=mywages)
harvtest(modelNichols, order.by = ~ CPI3, data=mywages)
harvtest(modelNichols, order.by = ~ u, data=mywages)

## Rainbow
raintest(modelNichols, order.by = "mahalanobis", data=mywages)



