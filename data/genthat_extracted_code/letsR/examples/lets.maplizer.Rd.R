library(letsR)


### Name: lets.maplizer
### Title: Create a matrix summarizing species' attributes within cells of
###   a PresenceAbsence object
### Aliases: lets.maplizer

### ** Examples

## Not run: 
##D data(PAM)
##D data(IUCN)
##D trait <- IUCN$Description_Year
##D resu <- lets.maplizer(PAM, trait, PAM$S, ras = TRUE)
##D head(resu$Matrix)
##D plot(resu$Raster, xlab = "Longitude", ylab = "Latitude", 
##D main = "Mean description year per site") ; map(add = TRUE)
## End(Not run)




