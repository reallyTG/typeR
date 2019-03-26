library(WARN)


### Name: warn
### Title: Weaning parameter estimation with approximate Bayesian
###   computation
### Aliases: warn warn.default
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

## Indicate summary.
summary(warn.lerna)

## Plot.
plot(warn.lerna)

## Plot with adult mean.
plot(warn.lerna,
  hline.adult = TRUE,
  adult.mean = mean(adult$d15N),
  adult.sd = sd(adult$d15N),
  is.female = FALSE)



