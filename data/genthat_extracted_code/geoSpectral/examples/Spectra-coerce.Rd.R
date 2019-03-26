library(geoSpectral)


### Name: Spectra-coerce
### Title: Conversion between 'Spectra' and data.frame objects
### Aliases: Spectra-coerce as,Spectra Spectra-coerce

### ** Examples

#Convert a Spectra object to data.frame
sp <- spc.example_spectra()
df <- as(sp, "data.frame")
class(df); dim(df)
attributes(df)

#Convert the data.frame back to Spectra
sp2 <- as(df, "Spectra")

#Convert a bare data.frame to Spectra with minimal attributes
df2 <- data.frame(ch1=c(1,2,3,4), ch2=c(5,6,7,8), TIME=Sys.time()+1:4, LAT=1:4, LON=5:8)
attr(df2, "Units") <- "m-1"
attr(df2, "Wavelengths") <- c(500, 600)
attr(df2, "ShortName") <- "abs"
as(df2, "Spectra")



