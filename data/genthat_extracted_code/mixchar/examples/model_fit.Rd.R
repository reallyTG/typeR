library(mixchar)


### Name: model_fit
### Title: Accessor function to extract model fit
### Aliases: model_fit
### Keywords: deconvolution fraser-suzuki thermogravimetry

### ** Examples

## No test: 
data(juncus)
tmp <- process(juncus, init_mass = 18.96,
               temp = 'temp_C', mass_loss = 'mass_loss')
output <- deconvolve(tmp)
model_fit(output)
## End(No test)



