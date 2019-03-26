library(mixchar)


### Name: deconvolve
### Title: Deconvolves Thermogravimetric Data
### Aliases: deconvolve
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

## No test: 
data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
output <- deconvolve(tmp)
my_starting_vec <- c(height_1 = 0.003, skew_1 = -0.15, position_1 = 250, width_1 = 50,
                     height_2 = 0.006, skew_2 = -0.15, position_2 = 320, width_2 = 30,
                     height_3 = 0.001, skew_3 = -0.15, position_3 = 390, width_3 = 200)
output <- deconvolve(tmp, n_peaks = 3, start_vec = my_starting_vec)
## End(No test)



