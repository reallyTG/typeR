library(eemR)


### Name: eem_set_wavelengths
### Title: Set Excitation and/or Emission wavelengths
### Aliases: eem_set_wavelengths

### ** Examples

folder <- system.file("extdata/shimadzu", package = "eemR")

eem <- eem_read(folder)
eem <- eem_set_wavelengths(eem, ex = seq(230, 450, by = 5))

plot(eem)




