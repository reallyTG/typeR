library(atlantistools)


### Name: get_boundary
### Title: Get boundary boxes from Atlantis box information.
### Aliases: get_boundary

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
boxes <- load_box(bgm = file.path(d, "VMPA_setas.bgm"))
get_boundary(boxinfo = boxes)



