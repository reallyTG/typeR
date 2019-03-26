library(geoSpectral)


### Name: spc.setinvalid.idx<-
### Title: Set rows of 'Spectra' as invalid
### Aliases: spc.setinvalid.idx<- spc.setinvalid.idx<-,Spectra-method

### ** Examples

 
sp = spc.example_spectra()
spc.getinvalid.idx(sp) #No invalid rows
vld = rep(TRUE,26)
vld[1:5]<-FALSE
spc.setinvalid.idx(sp)<-vld #Mark the first 5 rows as invalid
spc.getinvalid.idx(sp)




