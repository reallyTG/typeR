library(coala)


### Name: scale_model
### Title: Function that downscales a coalescent model
### Aliases: scale_model

### ** Examples

model <- coal_model(10, loci_number = 10) + locus_single(100)
model
# Group 1: 10 loci; group 2: 1 locus

model <- scale_model(model, 3)
model
# Group 1: 3 loci; group 2: 1 locus



