library(wTO)


### Name: wTO.fast
### Title: wTO.fast
### Aliases: wTO.fast

### ** Examples

wTO.fast(Data = Microarray_Expression1,
Overlap = ExampleGRF$x, 
method = "p")

# For a time series with lag = 4
wTO.fast(Data = Microarray_Expression1,
Overlap = ExampleGRF$x, 
method = "p", 
method_resampling = 'BlockBootstrap', 
lag = 4)
# For a study where the individuals were measured multiple times.
wTO.fast(Data = Microarray_Expression1,
Overlap = ExampleGRF$x, 
method = "p", 
method_resampling = 'BlockBootstrap', 
ID = rep(1:9, each= 2))



