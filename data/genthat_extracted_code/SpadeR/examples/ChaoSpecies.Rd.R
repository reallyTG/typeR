library(SpadeR)


### Name: ChaoSpecies
### Title: Estimation of species richness in a community
### Aliases: ChaoSpecies

### ** Examples

data(ChaoSpeciesData)
# Type (1) abundance data
ChaoSpecies(ChaoSpeciesData$Abu,"abundance",k=10,conf=0.95)
# Type (1A) abundance-frequency counts data
ChaoSpecies(ChaoSpeciesData$Abu_count,"abundance_freq_count",k=10,conf=0.95)
# Type (2) incidence-frequency data
ChaoSpecies(ChaoSpeciesData$Inci,"incidence_freq",k=10,conf=0.95)
# Type (2A) incidence-frequency counts data
ChaoSpecies(ChaoSpeciesData$Inci_count,"incidence_freq_count",k=10,conf=0.95)
# Type (2B) incidence-raw data 
ChaoSpecies(ChaoSpeciesData$Inci_raw,"incidence_raw",k=10,conf=0.95)



