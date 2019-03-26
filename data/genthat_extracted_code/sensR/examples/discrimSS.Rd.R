library(sensR)


### Name: discrimSS
### Title: Sensory discrimination sample size calculation
### Aliases: discrimSS d.primeSS
### Keywords: models

### ** Examples

## Finding the smallest necessary sample size:
discrimSS(pdA = 0.5, pd0 = 0, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "exact")
## The stable-exact sample size is larger:
discrimSS(pdA = 0.5, pd0 = 0, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "stable.exact")

## Give identical results:
pd <- coef(rescale(d.prime = 1, method = "twoAFC"))$pd
discrimSS(pdA = pd, pd0 = 0, target.power = 0.90, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "exact")
d.primeSS(1, target.power = 0.90, method = "twoAFC")

## A similarity example:
discrimSS(pdA = 0.1, pd0 = 0.2, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "similarity", statistic = "exact")
## Don't show: 
## Test stability of code:
## Finding the smallest necessary sample size:
a <- discrimSS(pdA = 0.5, pd0 = 0, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "exact")
a2 <- discrimSS(pdA = 0.5, pd0 = 0, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "stable.exact")

## Give identical results:
pd <- coef(rescale(d.prime = 1, method = "twoAFC"))$pd
b <- discrimSS(pdA = pd, pd0 = 0, target.power = 0.90, alpha = 0.05,
   pGuess = 1/2, test = "difference", statistic = "exact")
c <- d.primeSS(1, target.power = 0.90, method = "twoAFC")

## A similarity example:
d <- discrimSS(pdA = 0.1, pd0 = 0.2, target.power = 0.80, alpha = 0.05,
   pGuess = 1/2, test = "similarity", statistic = "exact")

expect <- c(23, 28, 30, 30, 604)
stopifnot(c(a, a2, b, c, d) == expect)
## End(Don't show)



