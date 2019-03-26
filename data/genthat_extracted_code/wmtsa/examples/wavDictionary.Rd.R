library(wmtsa)


### Name: wavDictionary
### Title: Constructor function for objects of class wavDictionary
### Aliases: wavDictionary as.list.wavDictionary print.wavDictionary
### Keywords: univar

### ** Examples

## create a faux wavelet dictionary 
wavelet <- "s8"
wavDictionary(wavelet=wavelet, dual=FALSE,
    decimate=FALSE, n.sample=1024,
    attr.x=NULL, n.levels=3,
    boundary="periodic", conv=TRUE,
    filters=wavDaubechies(wavelet),
    fast=TRUE, is.complex=FALSE)



