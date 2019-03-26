library(maxlike)


### Name: MaungaWhau
### Title: Fake data for the Maunga Whau volcano
### Aliases: MaungaWhau
### Keywords: datasets

### ** Examples

data(MaungaWhau)
elev <- raster(MaungaWhau$elev, xmn=0, xmx=61, ymn=0, ymx=87)
precip <- raster(MaungaWhau$precip, xmn=0, xmx=61, ymn=0, ymx=87)



