library(eseis)


### Name: signal_integrate
### Title: Integrate a seismic signal
### Aliases: signal_integrate
### Keywords: eseis

### ** Examples


## load example data set
data(rockfall)

## deconvolve signal
rockfall_decon <- signal_deconvolve(data = rockfall_eseis)
                                    
## integrate signal
rockfall_int <- signal_integrate(data = rockfall_decon)
                                 
## Note that usually the signal should be filtered prior to integration.
                     



