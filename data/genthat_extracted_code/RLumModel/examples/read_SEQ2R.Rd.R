library(RLumModel)


### Name: read_SEQ2R
### Title: Parse a Risoe SEQ-file to a sequence neccessary for simulating
###   quartz luminescence
### Aliases: read_SEQ2R

### ** Examples

##search "example_SAR_cycle.SEQ" in "extdata" in package "RLumModel"
path <- system.file("extdata", "example_SAR_cycle.SEQ", package="RLumModel")

sequence <- read_SEQ2R(file = path, txtProgressBar = FALSE)




