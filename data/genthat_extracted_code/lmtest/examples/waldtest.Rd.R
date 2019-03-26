library(lmtest)


### Name: waldtest
### Title: Wald Test of Nested Models
### Aliases: waldtest waldtest.formula waldtest.default waldtest.lm
### Keywords: htest

### ** Examples

## fit two competing, non-nested models and their encompassing
## model for aggregate consumption, as in Greene (1993),
## Examples 7.11 and 7.12

## load data and compute lags
data(USDistLag)
usdl <- na.contiguous(cbind(USDistLag, lag(USDistLag, k = -1)))
colnames(usdl) <- c("con", "gnp", "con1", "gnp1")

## C(t) = a0 + a1*Y(t) + a2*C(t-1) + u
fm1 <- lm(con ~ gnp + con1, data = usdl)

## C(t) = b0 + b1*Y(t) + b2*Y(t-1) + v
fm2 <- lm(con ~ gnp + gnp1, data = usdl)

## Encompassing model
fm3 <- lm(con ~ gnp + con1 + gnp1, data = usdl)

## a simple ANOVA for fm3 vs. fm2
waldtest(fm3, fm2)
anova(fm3, fm2)
## as df = 1, the test is equivalent to the corresponding t test in
coeftest(fm3)

## various equivalent specifications of the two models
waldtest(fm3, fm2)
waldtest(fm3, 2)
waldtest(fm3, "con1")
waldtest(fm3, . ~ . - con1)

## comparing more than one model
## (equivalent to the encompassing test)
waldtest(fm1, fm3, fm2)
encomptest(fm1, fm2)

## using the asymptotic Chisq statistic
waldtest(fm3, fm2, test = "Chisq")
## plugging in a HC estimator
if(require(sandwich)) waldtest(fm3, fm2, vcov = vcovHC)  



