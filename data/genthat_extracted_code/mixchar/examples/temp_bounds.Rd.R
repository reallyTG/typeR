library(mixchar)


### Name: temp_bounds
### Title: Accessor function to extract selected temperature bounds
### Aliases: temp_bounds
### Keywords: deconvolution fraser-suzuki temperature thermogravimetry

### ** Examples

data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
temp_bounds(tmp)




