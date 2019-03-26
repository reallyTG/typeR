library(pairwise)


### Name: pers
### Title: WLE - Rasch Person Parameter
### Aliases: pers

### ** Examples

############
data(sim200x3)
result <- pers(itempar=pair(sim200x3))
summary(result)
plot(result)
logLik(result) # Log-Likelihood for 'estimated' model
logLik(result, sat=TRUE) # Log-Likelihood for saturated model
AIC(logLik(result)) # AIC for 'estimated' model
AIC(logLik(result, sat=TRUE)) # AIC for saturated model
BIC(logLik(result)) # BIC for 'estimated' model
BIC(logLik(result, sat=TRUE)) # BIC for saturated model
###### following example requires package eRm ######
# require(eRm)
# # itemparameter with eRm:
# itempar_eRm <- thresholds(PCM(sim200x3))$ threshtable[[1]][,2:3]
# # pairwise personparameter with eRm-itemparameter and data:
# summary(pers(itempar=itempar_eRm,daten=sim200x3))
# # eRm personparameter:
# person.parameter(PCM(sim200x3))
# # personparameter with pairwise:
# summary(pers(pair(sim200x3))) 



