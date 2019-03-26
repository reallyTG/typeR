library(mixchar)


### Name: rate_data
### Title: Accessor function to extract processed dataframe
### Aliases: rate_data
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
rate_data(tmp)




