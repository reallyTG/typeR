library(lmtest)


### Name: lrtest
### Title: Likelihood Ratio Test of Nested Models
### Aliases: lrtest lrtest.formula lrtest.default
### Keywords: htest

### ** Examples

## with data from Greene (1993):
## load data and compute lags
data("USDistLag")
usdl <- na.contiguous(cbind(USDistLag, lag(USDistLag, k = -1)))
colnames(usdl) <- c("con", "gnp", "con1", "gnp1")

fm1 <- lm(con ~ gnp + gnp1, data = usdl)
fm2 <- lm(con ~ gnp + con1 + gnp1, data = usdl)

## various equivalent specifications of the LR test
lrtest(fm2, fm1)
lrtest(fm2, 2)
lrtest(fm2, "con1")
lrtest(fm2, . ~ . - con1)



