library(mapfit)


### Name: phfit.3mom
### Title: PH fitting with three moments
### Aliases: phfit.3mom

### ** Examples

## Three moment matching
## Moments of Weibull(shpape=2, scale=1); (0.886227, 1.0, 1.32934)
(result1 <- phfit.3mom(0.886227, 1.0, 1.32934))

## Three moment matching
## Moments of Weibull(shpape=2, scale=1); (0.886227, 1.0, 1.32934)
(result2 <- phfit.3mom(0.886227, 1.0, 1.32934, method="Bobbio05"))

## mean
ph.mean(result1)
ph.mean(result2)

## variance
ph.var(result1)
ph.var(result2)

## up to 5 moments 
ph.moment(5, result1)
ph.moment(5, result2)




