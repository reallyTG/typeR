library(spant)


### Name: read_mrs
### Title: Read MRS data from a file.
### Aliases: read_mrs

### ** Examples

fname <- system.file("extdata", "philips_spar_sdat_WS.SDAT", package = "spant")
mrs_data <- read_mrs(fname, format = "spar_sdat")
print(mrs_data)



