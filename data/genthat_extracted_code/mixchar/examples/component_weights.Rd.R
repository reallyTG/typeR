library(mixchar)


### Name: component_weights
### Title: Accessor function to extract mean weights
### Aliases: component_weights
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

## No test: 
data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
output <- deconvolve(tmp)
component_weights(output)
## End(No test)



