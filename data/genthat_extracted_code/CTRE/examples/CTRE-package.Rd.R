library(CTRE)


### Name: CTRE-package
### Title: Continuous Time Random Exceedances
### Aliases: CTRE CTRE-package

### ** Examples

library(CTRE)
## Not run: 
##D runCTREshiny()
## End(Not run)

ctre_mod <- ctre(flares)
ctre_mod
length(ctre_mod)
ctre_mod <- thin(ctre_mod, k = 500)
ctre_mod
magnitudes(ctre_mod)
time(ctre_mod)
interarrival(ctre_mod)
MLestimates(ctre_mod, tail = 0.8, scale = 3E7)
library(magrittr)
ctre_mod %>% interarrival() %>% mlqqplot(tail = 0.8, log = 'xy')
acf(ctre_mod)
empcopula(ctre_mod)




