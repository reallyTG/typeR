library(geoSpectral)


### Name: spc.rbind
### Title: Combine 'Spectra' Objects by Rows
### Aliases: spc.rbind spc.rbind,Spectra-method

### ** Examples

x <- spc.example_spectra()
nrow(x)  #[1] 26
x2=spc.rbind(x,x)
nrow(x2)  #[1] 52




