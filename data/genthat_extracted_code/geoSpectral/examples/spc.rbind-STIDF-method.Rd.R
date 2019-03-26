library(geoSpectral)


### Name: spc.rbind,STIDF-method
### Title: Combine 'STIDF' objects by Rows
### Aliases: spc.rbind,STIDF-method

### ** Examples

x <- spc.example_spectra()
nrow(x)  #[1] 26
x2 <- spc.rbind(as(x, "STIDF"),as(x, "STIDF"))
nrow(x2)  #[1] 52




