library(GD)


### Name: gdinteract
### Title: Geographical detectors: interaction detector.
### Aliases: gdinteract print.gdinteract plot.gdinteract

### ** Examples

gi1 <- gdinteract(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
gi1
## No test: 
data <- ndvi_40[,1:3]
gi2 <- gdinteract(NDVIchange ~ ., data = data)
gi2
## End(No test)




