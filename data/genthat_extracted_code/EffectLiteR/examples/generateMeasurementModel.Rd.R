library(EffectLiteR)


### Name: generateMeasurementModel
### Title: Generate measurement model
### Aliases: generateMeasurementModel

### ** Examples

## Example with three latent variables
names <- c("eta", "xi1", "xi2")
indicators <- list("eta" = c("y1","y2","y3"), 
                   "xi1" = c("z1","z2"),
                   "xi2" = c("z12","z22","z32","z42"))
ncells = 6
model = c("parallel","tau-equi","tau-cong")
cat(generateMeasurementModel(names, indicators, ncells, model))

## Example with method factor
names <- c("eta", "xi", "mf")
indicators <- list("eta" = c("y12","y22"), 
                   "xi" = c("y11","y21"),
                   "mf" = c("y12","y22"))
ncells = 2
cat(generateMeasurementModel(names, indicators, ncells))




