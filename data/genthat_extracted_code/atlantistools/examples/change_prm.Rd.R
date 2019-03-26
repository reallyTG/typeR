library(atlantistools)


### Name: change_prm
### Title: Change biological parameterfile to simplify automated ATLANTIS
###   calibrations.
### Aliases: change_prm

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")

new_prm <- change_prm(prm_biol,
                      select_acronyms = c("FPS", "FVS"),
                      roc = c(2,3),
                      parameter = "KWRR",
                      save_to_disc = FALSE)



