library(lmtest)


### Name: growthofmoney
### Title: Growth of Money Supply
### Aliases: growthofmoney
### Keywords: datasets

### ** Examples

data(growthofmoney)

## page 137, fit Hetzel OLS model
## first/second line in Table 6.7

modelHetzel <- TG1.TG0 ~ AG0.TG0
lm(modelHetzel, data=growthofmoney)
dwtest(modelHetzel, data=growthofmoney)


## page 135, fit test statistics in Table 6.8
#############################################

if(require(strucchange, quietly = TRUE)) {
## Chow 1974(1)
sctest(modelHetzel, point=c(1973,4), data=growthofmoney, type="Chow") }

## RESET
reset(modelHetzel, data=growthofmoney)
reset(modelHetzel, power=2, type="regressor", data=growthofmoney)
reset(modelHetzel, type="princomp", data=growthofmoney)

## Harvey-Collier
harvtest(modelHetzel, order.by= ~ AG0.TG0, data=growthofmoney)

## Rainbow
raintest(modelHetzel, order.by = "mahalanobis", data=growthofmoney)


## Identification of outliers
#############################

## Figure 6.1
plot(modelHetzel, data=growthofmoney)
abline(v=0)
abline(h=0)
abline(coef(lm(modelHetzel, data=growthofmoney)), col=2)

## Table 6.7, last line
growthofmoney2 <- as.data.frame(growthofmoney[-c(5:6),])
lm(modelHetzel, data=growthofmoney2)
dwtest(modelHetzel, data=growthofmoney2)



