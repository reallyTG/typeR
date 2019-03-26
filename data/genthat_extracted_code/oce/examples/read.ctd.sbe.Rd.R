library(oce)


### Name: read.ctd.sbe
### Title: Read a Seabird CTD File
### Aliases: read.ctd.sbe

### ** Examples

f <- system.file("extdata", "ctd.cnv", package="oce")
## Read the file in the normal way
d <- read.ctd(f)
## Read an imaginary file, in which salinity is named 'salt'
d <- read.ctd(f, columns=list(
  salinity=list(name="salt", unit=list(expression(), scale="PSS-78"))))




