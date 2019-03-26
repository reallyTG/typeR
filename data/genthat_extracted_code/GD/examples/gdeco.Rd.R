library(GD)


### Name: gdeco
### Title: Geographical detectors: ecological detector.
### Aliases: gdeco print.gdeco plot.gdeco

### ** Examples

ge1 <- gdeco(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
ge1
## No test: 
data <- ndvi_40[,1:3]
ge2 <- gdeco(NDVIchange ~ ., data = data)
ge2
## End(No test)




