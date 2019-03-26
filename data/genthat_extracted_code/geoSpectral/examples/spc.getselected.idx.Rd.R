library(geoSpectral)


### Name: spc.getselected.idx
### Title: Extract index inside of a 'Spectra' object
### Aliases: spc.getselected.idx spc.getselected.idx,Spectra-method

### ** Examples

x <- spc.example_spectra()
idx=rep(FALSE,nrow(x)); 
idx[1:5]=TRUE
spc.setselected.idx(x)<-idx 
spc.getselected.idx(x)




