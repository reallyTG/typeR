library(pscl)


### Name: hurdle
### Title: Hurdle Models for Count Data Regression
### Aliases: hurdle print.hurdle
### Keywords: regression

### ** Examples

## data
data("bioChemists", package = "pscl")

## logit-poisson
## "art ~ ." is the same as "art ~ . | .", i.e.
## "art ~ fem + mar + kid5 + phd + ment | fem + mar + kid5 + phd + ment"
fm_hp1 <- hurdle(art ~ ., data = bioChemists)
summary(fm_hp1)

## geometric-poisson
fm_hp2 <- hurdle(art ~ ., data = bioChemists, zero = "geometric")
summary(fm_hp2)

## logit and geometric model are equivalent
coef(fm_hp1, model = "zero") - coef(fm_hp2, model = "zero")

## logit-negbin
fm_hnb1 <- hurdle(art ~ ., data = bioChemists, dist = "negbin")
summary(fm_hnb1)

## negbin-negbin
## (poorly conditioned zero hurdle, note the standard errors)
fm_hnb2 <- hurdle(art ~ ., data = bioChemists, dist = "negbin", zero = "negbin")
summary(fm_hnb2)



