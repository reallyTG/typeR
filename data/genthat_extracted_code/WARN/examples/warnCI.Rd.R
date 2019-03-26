library(WARN)


### Name: warnCI
### Title: Calculate credible intervals for posterior probability of the
###   weaning parameters
### Aliases: warnCI warnCI.default
### Keywords: math

### ** Examples

## Data from the Lerna population.
nonadult <- subset(lerna, lerna$age <= 10)
adult <- subset(lerna, lerna$age > 17)
female <- subset(adult, adult$sex == "f")

## Calculate maximum density estimators using ABC.
warn.lerna <- warn(
  age = nonadult$age,
  d15N = nonadult$d15N,
  female.mean = mean(female$d15N),
  num.particle = 500,
  female.sd = sd(female$d15N),
  prior = c(0.2, 0.5, 1.6, 0.5, 2.5, 0.5, 8.1, 0.5),
  tolerances = c(1.5, 0.7))

## Calculate over (>=) 50% CIs.
warn.lerna.50ci <- warnCI(warn.lerna, 0.50)

## Indicate result.
warn.lerna.50ci

## Plot.
plot(warn.lerna.50ci, "age")
plot(warn.lerna.50ci, "enrich")




