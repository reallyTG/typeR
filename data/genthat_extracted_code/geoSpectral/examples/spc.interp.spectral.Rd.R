library(geoSpectral)


### Name: spc.interp.spectral
### Title: Interpolate spectral values
### Aliases: spc.interp.spectral spc.interp.spectral,Spectra-method

### ** Examples

sp=spc.example_spectra()
lbd = as.numeric(c(412,440,490,555,670))
sp2 = spc.interp.spectral(sp[,lbd],c(430,450,500))
spc.plot.overlay(SpcList(list(sp,sp2)))

#Quick Plot only the first row
spc.interp.spectral(sp[,lbd],c(430,450,500),show.plot=TRUE)




