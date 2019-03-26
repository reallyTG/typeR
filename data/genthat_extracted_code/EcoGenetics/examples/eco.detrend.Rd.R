library(EcoGenetics)


### Name: eco.detrend
### Title: Detrending spatial data with polynomial interpolation
### Aliases: eco.detrend

### ** Examples

## Not run: 
##D 
##D data(eco2)
##D 
##D # original data
##D data1 <- matrix(eco2[["P"]][,1], 30, 30)
##D image(data1)
##D 
##D # original data + trend
##D data2 <- matrix(eco2[["P"]][,2], 30, 30)
##D image(data2)
##D 
##D # data detrending
##D data2.det <- eco.detrend(Z = eco2[["P"]][,2], XY =  eco2[["XY"]], degree =  1)
##D 
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accesed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D data2.det <- ecoslot.RES(data2.det)       # detrended data in slot RES
##D 
##D data2.det <- matrix(data2.det[,1], 30, 30)
##D image(data2.det)
##D 
##D 
## End(Not run)





