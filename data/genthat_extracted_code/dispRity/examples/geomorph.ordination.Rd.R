library(dispRity)


### Name: geomorph.ordination
### Title: Imports data from geomorph
### Aliases: geomorph.ordination

### ** Examples

## Not run: 
##D require(geomorph)
##D ## Loading the plethodon dataset
##D data(plethodon)
##D 
##D ## Performing a Procrustes transform
##D procrustes <- geomorph::gpagen(plethodon$land, PrinAxes = FALSE)
##D 
##D ## Obtaining the ordination matrix
##D geomorph.ordination(procrustes)
##D 
##D 
##D ## Using a geomorph.data.frame
##D geomorph_df <- geomorph.data.frame(procrustes, species = plethodon$species)
##D 
##D geomorph.ordination(geomorph_df)
##D 
##D ## Calculating disparity from dispRity or geomorph::morphol.disparity
##D geomorph_disparity <- geomorph::morphol.disparity(coords ~ 1,
##D                       groups= ~ species, data = geomorph_df)
##D dispRity_disparity <- dispRity(geomorph.ordination(geomorph_df),
##D                       metric = function(X) return(sum(X^2)/nrow(X)))
##D 
##D ## Extracting the raw disparity values
##D geomorph_val <- round(as.numeric(geomorph_disparity$Procrustes.var), 15)
##D dispRity_val <- as.vector(summary(dispRity_disparity, digits = 15)$obs)
##D 
##D ## Comparing the values (to the 15th decimal!)
##D geomorph_val == dispRity_val # all TRUE
## End(Not run)




