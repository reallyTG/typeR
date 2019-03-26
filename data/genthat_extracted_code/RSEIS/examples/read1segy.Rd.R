library(RSEIS)


### Name: read1segy
### Title: Read one SEGY/SAC file
### Aliases: read1segy read1sac
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D fnames = list.files(path="/Users/lees/Site/Buf2014/ALL_SEGY",
##D                                      pattern=NULL, full.names=TRUE )
##D 
##D for(i in 1:length(fnames))
##D {
##D fn1  = fnames[i]
##D 
##D bed =  read1segy(fn1   , Iendian = 1 , HEADONLY=TRUE, BIGLONG=FALSE)
##D scaly[i] =  bed$HEAD$scale_fac
##D print(paste(i, fn1, bed$HEAD$station_name , bed$HEAD$channel_name,
##D        bed$HEAD$scale_fac, bed$HEAD$gainConst)  )
##D 
##D }
##D 
##D 
## End(Not run)




