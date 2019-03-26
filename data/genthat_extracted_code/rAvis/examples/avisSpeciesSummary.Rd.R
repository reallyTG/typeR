library(rAvis)


### Name: avisSpeciesSummary
### Title: avisSpeciesSummary
### Aliases: avisSpeciesSummary

### ** Examples

## Not run: 
##D avis_summary<- avisSpeciesSummary()
##D # general overview of the data aggregated by species
##D par (mfrow =c(2,2))
##D hist (avis_summary$Observations, col="red", border=FALSE, main=NULL)
##D hist (avis_summary$Individuals, col="red", border=FALSE, main=NULL)
##D hist (avis_summary$UTM.10x10, col="red", border=FALSE, main=NULL)
##D hist (avis_summary$Birdwatchers, col="red", border=FALSE, main=NULL)
## End(Not run)



