library(geoSpectral)


### Name: spc.colnames
### Title: Column names of 'Spectra' object
### Aliases: spc.colnames spc.colnames,Spectra-method spc.colnames<-
###   spc.colnames<-,Spectra-method

### ** Examples

x <- spc.example_spectra()
head(spc.colnames(x))
# or 
spc.colnames(x) <- spc.cname.construct(x)
spc.colnames(x)



