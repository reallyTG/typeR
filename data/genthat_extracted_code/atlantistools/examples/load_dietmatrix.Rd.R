library(atlantistools)


### Name: load_dietmatrix
### Title: Extract the dietmatrix from the biological parameterfile
### Aliases: load_dietmatrix write_diet

### ** Examples

# Can be applied to trunk models.
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")

dm <- load_dietmatrix(prm_biol, fgs)
head(dm, n = 10)

# Use write_diet to update your existing parameterfile.
dietmatrix <- load_dietmatrix(prm_biol, fgs, transform = FALSE)

# Write is set to FALSE here for technical reasons. Make sure to set it to TRUE in case you
# want to update your file.
new_diet <- write_diet(dietmatrix, prm_biol, save_to_disc = FALSE)

# And to bec-dev models.
d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_New.prm")
fgs <- file.path(d, "SETasGroups.csv")

dm <- load_dietmatrix(prm_biol, fgs, version_flag = 1)
head(dm, n = 10)




