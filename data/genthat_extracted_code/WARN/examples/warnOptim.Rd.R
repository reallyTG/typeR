library(WARN)


### Name: warnOptim
### Title: Optimize the weaning parameters
### Aliases: warnOptim warnOptim.default
### Keywords: math

### ** Examples

## Data from the Lerna population.
nonadult <- subset(lerna, lerna$age <= 10)
adult <- subset(lerna, lerna$age > 17)
female <- subset(adult, adult$sex == "f")

## Simple optimization without probability.
(opt.lerna <- warnOptim(nonadult$age, nonadult$d15N,
  mean(female$d15N),
  control = list(maxit = 10000, ndeps = 1e-2, reltol = 1e-7)))



