library(geoSpectral)


### Name: spc.setselected.idx<-
### Title: Set index to a 'Spectra' object
### Aliases: spc.setselected.idx<- spc.setselected.idx<-,Spectra-method

### ** Examples

x <- spc.example_spectra()
idx=rep(FALSE,nrow(x)); 
idx[1:5]=TRUE
spc.setselected.idx(x)<-idx 
spc.plot(x)



