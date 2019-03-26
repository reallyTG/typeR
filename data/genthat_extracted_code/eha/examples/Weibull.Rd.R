library(eha)


### Name: Weibull
### Title: The (Cumulative) Hazard Function of a Weibull Distribution
### Aliases: Weibull hweibull Hweibull
### Keywords: survival

### ** Examples


hweibull(3, 2, 1)
dweibull(3, 2, 1) / pweibull(3, 2, 1, lower.tail = FALSE)
Hweibull(3, 2, 1)
-pweibull(3, 2, 1, log.p = TRUE, lower.tail = FALSE)




