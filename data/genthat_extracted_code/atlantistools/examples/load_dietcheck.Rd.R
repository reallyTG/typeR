library(atlantistools)


### Name: load_dietcheck
### Title: Read in the atlantis dietcheck.txt file and perform some basic
###   data transformations.
### Aliases: load_dietcheck

### ** Examples

# Apply to bec-dev models.
d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
dietcheck <- file.path(d, "outputSETASDietCheck.txt")
fgs <- file.path(d, "SETasGroups.csv")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_New.prm")

diet <- load_dietcheck(dietcheck, fgs, prm_run, version_flag = 1)
head(diet, n = 10)

# Apply to trunk models.
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
dietcheck <- file.path(d, "outputSETASDietCheck.txt")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
diet <- load_dietcheck(dietcheck, fgs, prm_run)
head(diet, n = 10)



