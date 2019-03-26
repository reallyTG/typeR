library(WARN)


### Name: warnProb
### Title: Calculate posterior probability of the weaning parameters
### Aliases: warnProb warnProb.default
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

## Calculate probabilities for a given parameter range.
warnprob.age <- warnProb(warn.lerna, "age", c(0.0, 1.1), c(0.8, 2.3))
warnprob.enrich <- warnProb(warn.lerna, "enrich", c(1.5, 3.5))
warnprob.wnfood <- warnProb(warn.lerna, "wnfood", c(7.3, 8.8))

## Indicate summary.
summary(warnprob.age)
summary(warnprob.enrich)

## Plot.
plot(warnprob.age)
plot(warnprob.wnfood)

## Plot with image.
plot(warnprob.age, is.image = TRUE)



