library(vcd)


### Name: RepVict
### Title: Repeat Victimization Data
### Aliases: RepVict
### Keywords: datasets

### ** Examples

data("RepVict")

mosaic(RepVict[-c(4,7),-c(4,7)], gp = shading_max,
       main = "Repeat Victimization Data")



