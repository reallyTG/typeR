library(atlantistools)


### Name: load_box
### Title: Load the box specification file for an Atlantis scenario
### Aliases: load_box

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
bgm <- file.path(d, "VMPA_setas.bgm")

boxes <- load_box(bgm)



