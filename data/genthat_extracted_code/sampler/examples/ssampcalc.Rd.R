library(sampler)


### Name: ssampcalc
### Title: Determines sample size by strata using proportional allocation
### Aliases: ssampcalc

### ** Examples

ssampcalc(df=albania, n=544, strata=qarku, over=0.05)

size <- rsampcalc(nrow(albania), 3, 95, 0.5)
ssampcalc(albania, size, qarku)



