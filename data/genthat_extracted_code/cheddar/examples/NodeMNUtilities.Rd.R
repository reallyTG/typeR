library(cheddar)


### Name: Body mass, numerical abundance and biomass abundance
### Title: Body mass, numerical abundance and biomass abundance
### Aliases: Log10M Log10N Biomass Log10Biomass Log10MNBiomass RCMRatio
###   Log10RCMRatio CRMRatio Log10CRMRatio
### Keywords: utilities

### ** Examples

data(TL84)

NPS(TL84, c('M', 'Log10M', 'N', 'Log10N', 'Biomass', 'Log10Biomass'))

NPS(TL84, 'Log10MNBiomass')

TLPS(TL84, link.properties=c('Log10RCMRatio', 'Log10CRMRatio'))



