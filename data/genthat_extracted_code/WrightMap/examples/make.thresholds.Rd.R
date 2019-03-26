library(WrightMap)


### Name: make.thresholds
### Title: Calculate Thurstonian thresholds.
### Aliases: make.thresholds make.thresholds.default
###   make.thresholds.CQmodel make.thresholds.character
###   make.thresholds.matrix

### ** Examples

fpath <- system.file("extdata", package="WrightMap")

# Partial credit model
model1 <- CQmodel(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw")) 
deltas <- make.deltas(model1)
make.thresholds(deltas)
make.thresholds(model1)



