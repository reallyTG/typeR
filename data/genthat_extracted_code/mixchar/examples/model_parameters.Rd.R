library(mixchar)


### Name: model_parameters
### Title: Accessor function to extract model parameters
### Aliases: model_parameters
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

## No test: 
data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
output <- deconvolve(tmp)
model_parameters(output)
## End(No test)



