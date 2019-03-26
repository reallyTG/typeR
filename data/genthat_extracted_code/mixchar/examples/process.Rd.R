library(mixchar)


### Name: process
### Title: Calculates the derivative rate of mass loss of thermogravimetric
###   data
### Aliases: process
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')




