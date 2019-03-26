library(geoSpectral)


### Name: spc.data2header,list-method
### Title: Populate fields of header slot using data from data slot
### Aliases: spc.data2header,list-method

### ** Examples

sp=spc.example_spectra()
BL=spc.makeSpcList(sp,"CAST")
BL[[1]]@header
 BL[[1]]=spc.data2header(BL[[1]],"CAST","ProjectCast")
BL[[1]]@header
BL[[1]]$CAST=rep(33, nrow( BL[[1]]))
BL[[1]]=spc.data2header(BL[[1]],"CAST","ProjectCast", compress=TRUE)
BL[[1]]@header




