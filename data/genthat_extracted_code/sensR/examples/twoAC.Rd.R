library(sensR)


### Name: twoAC
### Title: 2-AC Discrimination and Preference Protocol
### Aliases: twoAC print.twoAC
### Keywords: models

### ** Examples


## Simple:
fit <- twoAC(c(2,2,6))
fit

## Typical discrimination-difference test: 
(fit <- twoAC(data = c(2, 5, 8), d.prime0 = 0, alternative = "greater"))

## Typical discrimination-similarity test: 
(fit <- twoAC(data = c(15, 15, 20), d.prime0 = .5, alternative = "less"))

## Typical preference-difference test:
(fit <- twoAC(data = c(3, 5, 12), d.prime0 = 0,
              alternative = "two.sided"))

## Typical preference (non-)inferiority test:
(fit <- twoAC(data = c(3, 5, 12), d.prime0 = 0,
              alternative = "greater"))

## For preference equivalence tests (two-sided) use CI with alpha/2:
## declare equivalence at the 5% level if 90% CI does not contain,
## e.g, -1 or 1: 
(fit <- twoAC(data = c(15, 10, 10), d.prime0 = 0, conf.level = .90))

## The var-cov matrix and standard errors of the parameters are not
## defined in all situations. If standard errors are not
## defined, then confidence intervals are not provided directly:
(fit <- twoAC(c(5, 0, 15)))
## We may use profile and confint methods to get confidence intervals
## never the less: 
pr <- profile(fit, range = c(-1, 3))
confint(pr)
plot(pr)




