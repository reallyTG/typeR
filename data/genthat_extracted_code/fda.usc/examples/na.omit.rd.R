library(fda.usc)


### Name: na.omit.fdata
### Title: A wrapper for the na.omit and na.fail function for fdata object
### Aliases: na.omit.fdata na.fail.fdata
### Keywords: descriptive

### ** Examples

fdataobj<-fdata(MontrealTemp)
fdataobj$data[3,3]<-NA
fdataobj$data[10,]<-NA
fdastaobj2<-na.omit.fdata(fdataobj)



