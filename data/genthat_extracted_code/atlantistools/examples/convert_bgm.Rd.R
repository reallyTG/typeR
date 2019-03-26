library(atlantistools)


### Name: convert_bgm
### Title: Transform data from bgm-file to map dataframe.
### Aliases: convert_bgm

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
bgm <- file.path(d, "VMPA_setas.bgm")

bgm <- convert_bgm(bgm)
head(bgm)



