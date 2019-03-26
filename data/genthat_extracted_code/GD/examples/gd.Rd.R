library(GD)


### Name: gd
### Title: Geographical detectors: factor detector.
### Aliases: gd print.gd plot.gd

### ** Examples

g1 <- gd(NDVIchange ~ Climatezone, data = ndvi_40)
g1
## No test: 
data <- ndvi_40[,1:3]
g2 <- gd(NDVIchange ~ ., data = data)
g2
## End(No test)




