library(sampler)


### Name: ssamp
### Title: Draws stratifed sample without replacement using proportional
###   allocation
### Aliases: ssamp

### ** Examples

ssamp(df=albania, n=360, strata=qarku, over=0.1)

size <- rsampcalc(nrow(albania), 3, 95, 0.5)
stratifiedsample <- ssamp(albania, size, qarku)



