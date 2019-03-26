library(forestr)


### Name: process_tls
### Title: Process single PCL transects.
### Aliases: process_tls
### Keywords: processing tls

### ** Examples


# with designated file
uva.tls<- system.file("extdata", "UVAX_A4_01_tls.csv", package = "forestr")

process_tls(uva.tls, slice = 5, pavd = FALSE, hist = FALSE)





