library(cheddar)


### Name: cheddar
### Title: Analysis and visualisation of ecological communities
### Aliases: cheddar cheddar-package cheddar
### Keywords: package

### ** Examples

# The dataset of Tuesday Lake sampled in 1984
data(TL84)

# Properties of the community
CPS(TL84)

# Properties of each node
head(NPS(TL84))

# Some computed node properties
head(NPS(TL84, c('Log10M', 'Log10N', 'Log10Biomass',
                 TL='PreyAveragedTrophicLevel', TS='TrophicSpecies')))

# Properties of each trophic link
head(TLPS(TL84))

# Computed properties of each node in each link
head(TLPS(TL84, node.properties=c('Log10M', 'Log10N', 'Log10Biomass',
                                  'PreyAveragedTrophicLevel')))


# A collection of 10 webs sampled across a wide pH gradient
data(pHWebs)

# A data.frame of predictors and responses
CollectionCPS(pHWebs, c('pH',
                        S='NumberOfNodes',
                        L='NumberOfTrophicLinks',
                        C='DirectedConnectance',
                        Slope='NvMSlope'))



