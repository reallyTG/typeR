library(iva)


### Name: mra
### Title: Conducting Mendelian Randomization Analysis
### Aliases: mra

### ** Examples


## This example estimates parameters in the
## following underlying models:
## 1. outcome model. A logistic regression model
##    d ~ z + x, of which the coefficient of
##    exposure z is the causal effect of interest;
## 2. exposure model. A quasi-likelihood model
##    z ~ g + x, of which g are used as instruments.
## In Mendelian randomization, those parameters
## could be estimated by fitting two working models
## with special parameterization:
## a. A logistic regression model d ~ g + x
## b. A quasi-likelihood model z ~ d + g + x

data(edata)
data(odata)

fit <- mra(d ~ x1 + x2 | g1 + g2 + g3,
           odata,
           z | d ~ x2 + x3 | g1 + g2 + g3,
           edata)

## summary tables for outcome model and exposure model
## and for testing the presence of confounder (if available)
summary(fit)

## causal effect estimate and its standard error
coef(fit)['bet']
sqrt(vcov(fit)['bet', 'bet'])

## Lagrange multiplier test
fit$lm

## model diagnosis
plot(fit)





