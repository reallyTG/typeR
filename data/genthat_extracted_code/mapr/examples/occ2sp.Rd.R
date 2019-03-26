library(mapr)


### Name: occ2sp
### Title: Create a spatial points dataframe from a spocc search
### Aliases: occ2sp

### ** Examples

## Not run: 
##D ### See points on a map
##D library("maptools")
##D library("spocc")
##D data(wrld_simpl)
##D plot(wrld_simpl[wrld_simpl$NAME == "United States", ], xlim = c(-70, -60))
##D out <- occ(query = "Accipiter striatus", from = c("vertnet", "gbif"),
##D   limit = 50)
##D xx <- occ2sp(out, just_coords = TRUE)
##D points(xx, col = 2)
## End(Not run)



