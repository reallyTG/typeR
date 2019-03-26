library(DGVM3D)


### Name: read.LPJ
### Title: Prepare the output table from LPJ-GUESS for visualization
### Aliases: read.LPJ

### ** Examples

## Not run: 
##D dgvm3d.locations = read.table("gridlist.txt",
##D                               col.names=c("Lon", "Lat", "Name"), sep="\t",
##D                               stringsAsFactors=FALSE)
##D dgvm3d.succession=list()
##D for (i in 1:nrow(dgvm3d.locations)) {
##D   dgvm3d.succession[[dgvm3d.locations$Name[i]]] =
##D    read.LPJ("vegstruct.out",
##D             lon=dgvm3d.locations$Lon[i],
##D             lat=dgvm3d.locations$Lat[i])
##D    dgvm3d.succession[[i]] = dgvm3d.succession[[i]][!(dgvm3d.succession[[i]]$Year %% 5) &
##D                                                    dgvm3d.succession[[i]]$Year > 1859, ]
##D }
## End(Not run)



