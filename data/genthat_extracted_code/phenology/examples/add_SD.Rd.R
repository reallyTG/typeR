library(phenology)


### Name: add_SD
### Title: Add SD for a fixed parameter.
### Aliases: add_SD

### ** Examples

library(phenology)
# Generate a set of fixed parameter: Flat and Min
pfixed<-c(Flat=0, Min=0)
# Add SD for the Flat parameter
pfixed<-add_SD(fixed.parameters=pfixed, parameters="Flat", SD=5)



