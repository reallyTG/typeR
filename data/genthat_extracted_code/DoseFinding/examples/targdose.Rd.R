library(DoseFinding)


### Name: Target Doses
### Title: Calculate dose estimates for a fitted dose-response model (via
###   'fitMod' or 'bFitMod') or a 'Mods' object.
### Aliases: TD ED

### ** Examples

## example for creating a "full-model" candidate set placebo response
## and maxEff already fixed in Mods call
doses <- c(0, 10, 25, 50, 100, 150)
fmodels <- Mods(linear = NULL, emax = 25,
                   logistic = c(50, 10.88111), exponential = 85,
                   betaMod = rbind(c(0.33, 2.31), c(1.39, 1.39)),
                   linInt = rbind(c(0, 1, 1, 1, 1),
                                  c(0, 0, 1, 1, 0.8)), 
                   doses=doses, placEff = 0, maxEff = 0.4,
                   addArgs=list(scal=200))

## calculate doses giving an improvement of 0.3 over placebo
TD(fmodels, Delta=0.3)
## discrete version
TD(fmodels, Delta=0.3, TDtype = "discrete", doses=doses)
## doses giving 50% of the maximum effect
ED(fmodels, p=0.5)
ED(fmodels, p=0.5, EDtype = "discrete", doses=doses)

plot(fmodels, plotTD = TRUE, Delta = 0.3)



