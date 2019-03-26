library(RStoolbox)


### Name: classifyQA
### Title: Classify Landsat QA bands
### Aliases: classifyQA

### ** Examples

library(raster)
qa <- raster(ncol = 100, nrow=100, val = sample(1:2^14,  10000))

## QA classes
qacs <- classifyQA(img = qa)
## Confidence levels
qacs_conf <- classifyQA(img = qa, confLayers = TRUE)



