library(marmap)


### Name: readGEBCO.bathy
### Title: Read bathymetric data from a GEBCO file
### Aliases: readGEBCO.bathy

### ** Examples

## Not run: 
##D # This example will not run, and we do not provide the dummy "gebco_file.nc" file, 
##D # because a copyright license must be signed on the GEBCO website before the data can be 
##D # downloaded and used. We just provide this line as an example for synthax. 
##D   readGEBCO.bathy(file="gebco_file.nc", resolution=1) -> nw.atl
##D 
##D # Second not-run example, with GEBCO_08 and SID: 
##D   readGEBCO.bathy("gebco_08_7_38_10_43_corsica.nc") -> med
##D   summary(med) # the bathymetry data
##D 
##D   readGEBCO.bathy("gebco_SID_7_38_10_43_corsica.nc")-> sid
##D   summary(sid) # the SID data
##D 
##D   colorRampPalette(c("lightblue","cadetblue1","white")) -> blues # custom col palette
##D   plot(med, n=1, im=T, bpal=blues(100)) # bathymetry
##D 
##D   as.numeric(rownames(sid)) -> x.sid
##D   as.numeric(colnames(sid)) -> y.sid
##D   contour(x.sid, y.sid, sid, drawlabels=FALSE, lwd=.1, add=TRUE) # SID
## End(Not run)



