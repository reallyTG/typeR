library(atlantistools)


### Name: get_conv_mgnbiot
### Title: Extract conversion factor used to transform data from nitrogen
###   in mg to biomass in tonnes.
### Aliases: get_conv_mgnbiot

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")

get_conv_mgnbiot(prm_biol)



