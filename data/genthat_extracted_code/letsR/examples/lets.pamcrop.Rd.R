library(letsR)


### Name: lets.pamcrop
### Title: Crop a PresenceAbsence object based on an input shapefile
### Aliases: lets.pamcrop

### ** Examples

## Not run: 
##D data(PAM)
##D # PAM before crop
##D plot(PAM, xlab = "Longitude", ylab = "Latitude",
##D      main = "Phyllomedusa species richness")
##D 
##D # Crop PAM to Brazil
##D require(maptools)    
##D data(wrld_simpl)  # World map
##D Brazil <- wrld_simpl[wrld_simpl$NAME == "Brazil", ]  # Brazil (polygon)
##D PAM_crop <- lets.pamcrop(PAM, Brazil, remove.sp = TRUE)
##D plot(PAM_crop, xlab = "Longitude", ylab = "Latitude",
##D      main = "Phyllomedusa species richness (Brazil crop)",
##D      col = colorRampPalette(c("darkgreen", "yellow", "blue")))
## End(Not run)




