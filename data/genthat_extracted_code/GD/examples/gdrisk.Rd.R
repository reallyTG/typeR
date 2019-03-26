library(GD)


### Name: gdrisk
### Title: Geographical detectors: risk detector.
### Aliases: gdrisk print.gdrisk plot.gdrisk

### ** Examples

gr1 <- gdrisk(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
gr1
plot(gr1)
## No test: 
data <- ndvi_40[,1:3]
gr2 <- gdrisk(NDVIchange ~ ., data = data)
gr2
## End(No test)




