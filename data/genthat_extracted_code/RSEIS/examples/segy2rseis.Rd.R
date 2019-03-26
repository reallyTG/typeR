library(RSEIS)


### Name: segy2rseis
### Title: Read in multiple segy files.
### Aliases: segy2rseis sac2rseis
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D fnames =
##D list.files(path="./SEISMIC_DATA/KARYMSKY/1999/kar99/Day254",
##D pattern="", full.names=TRUE )
##D 
##D MANY = segy2rseis(fnames, Iendian=1 , HEADONLY=FALSE,
##D     BIGLONG=FALSE,  PLOT=1, RAW=FALSE )
##D 
##D 
## End(Not run)




