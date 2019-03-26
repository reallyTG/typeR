library(strucchange)


### Name: sctest.formula
### Title: Structural Change Tests in Linear Regression Models
### Aliases: sctest.formula
### Keywords: htest

### ** Examples

## Example 7.4 from Greene (1993), "Econometric Analysis"
## Chow test on Longley data
data("longley")
sctest(Employed ~ Year + GNP.deflator + GNP + Armed.Forces, data = longley,
  type = "Chow", point = 7)

## which is equivalent to segmenting the regression via
fac <- factor(c(rep(1, 7), rep(2, 9)))
fm0 <- lm(Employed ~ Year + GNP.deflator + GNP + Armed.Forces, data = longley)
fm1 <- lm(Employed ~ fac/(Year + GNP.deflator + GNP + Armed.Forces), data = longley)
anova(fm0, fm1)

## estimates from Table 7.5 in Greene (1993)
summary(fm0)
summary(fm1)



