library(atlantistools)


### Name: extract_prm
### Title: Extract values for Atlantis parameters from the biological
###   parameter file.
### Aliases: extract_prm extract_prm_cohort

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")

# You can pass a single variable
extract_prm(prm_biol, variables = "KWRR_FVS")

# Or multiple variables
extract_prm(prm_biol, variables = paste("KWRR", c("FVS", "FPS"), sep = "_"))

# Use extract_prm_cohort do extract data for age specific parameters.
# They are usually stored in the next line following the parameter tag.
extract_prm_cohort(prm_biol, variables = "C_FVS")
extract_prm_cohort(prm_biol, variables = paste("C", c("FVS", "FPS"), sep = "_"))



