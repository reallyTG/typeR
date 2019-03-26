library(SpadeR)


### Name: ChaoShared
### Title: Estimation of the number of shared species between two
###   communities/assemblages
### Aliases: ChaoShared

### ** Examples

data(ChaoSharedData)
# Type (1) abundance data
ChaoShared(ChaoSharedData$Abu,"abundance",se=TRUE,nboot=200,conf=0.95)
# Type (2) incidence-frequency data 
ChaoShared(ChaoSharedData$Inci,"incidence_freq",se=TRUE,nboot=200,conf=0.95)
# Type (2B) incidence-raw data   
ChaoShared(ChaoSharedData$Inci_raw,"incidence_raw",units=c(16,17),se=TRUE,nboot=200,conf=0.95)



