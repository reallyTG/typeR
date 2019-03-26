library(atlantistools)


### Name: prm_to_df
### Title: Extract parameters from the biological parameter file and
###   transform them to a dataframe.
### Aliases: prm_to_df prm_to_df_ages

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
group <- c("FPS", "FVS")
parameter <- c("mum", "C")

prm_to_df_ages(prm_biol, fgs, group, parameter)
prm_to_df(prm_biol, fgs, group, parameter)



