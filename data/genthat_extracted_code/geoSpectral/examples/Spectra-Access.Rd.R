library(geoSpectral)


### Name: $,Spectra-method
### Title: Extract or replace parts of a 'Spectra' object
### Aliases: $,Spectra-method $,Spectra $<-,Spectra-method $<-,Spectra
###   [,Spectra-method [[,Spectra,character,missing-method
###   [[<-,Spectra,character,missing-method

### ** Examples

 sp<-spc.example_spectra()
 # spc.colnames() is used to extract column names
 head(spc.colnames(sp))
 head(sp$anap_300)
 sp[,"anap_345"]
 sp[,"anap_345"] #returns Spectra object with only one channel (column)
 sp[1:3,"anap_345"] #returns Spectra object with first 3 rows and only one channel (column)
 # spc.colnames() is used to extract column names
 head(spc.colnames(sp))
 head(sp$anap_300)
 sp[,"anap_345"]
sp=spc.example_spectra()
sp #501 spectral channels in columns and 26 observations in rows 
sp[1] #returns Spectra object, 501 spectral channels in columns and 1 observations in rows
names(sp)
sp[["CAST"]] #returns the CAST data column
sp[[4]] #returns the CAST data column
sp[["CAST"]]=12 #Modify the CAST column
sp[["CAST"]] #returns the CAST data column




