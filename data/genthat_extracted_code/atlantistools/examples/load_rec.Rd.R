library(atlantistools)


### Name: load_rec
### Title: Load information for SSB and Recruits from an Atlantis model
###   run.
### Aliases: load_rec

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
yoy <- file.path(d, "outputSETASYOY.txt")
ssb <- file.path(d, "outputSETASSSB.txt")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")

load_rec(yoy, ssb, prm_biol)



