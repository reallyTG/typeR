library(letsR)


### Name: lets.subsetPAM
### Title: Subset a PresenceAbsence object based on species names
### Aliases: lets.subsetPAM

### ** Examples

## Not run: 
##D data(PAM)
##D # PAM before subset
##D plot(PAM, xlab = "Longitude", ylab = "Latitude",
##D      main = "Phyllomedusa species richness")
##D 
##D # Subset PAM to the first 20 species
##D PAMsub <- lets.subsetPAM(PAM, PAM[[3]][1:20])
##D plot(PAMsub, xlab = "Longitude", ylab = "Latitude",
##D      main = "Phyllomedusa species richness")
## End(Not run)




