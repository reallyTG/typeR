library(atlantistools)


### Name: load_spec_mort
### Title: Load mortality information from outputSpecificPredMort.txt
### Aliases: load_spec_mort

### ** Examples

d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
specmort <- file.path(d, "outputSETASSpecificPredMort.txt")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_New.prm")
fgs <- file.path(d, "SETasGroups.csv")

df <- load_spec_mort(specmort, prm_run, fgs, version_flag = 1)
head(df)

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
specmort <- file.path(d, "outputSETASSpecificPredMort.txt")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")

df <- load_spec_mort(specmort, prm_run, fgs)
head(df)



