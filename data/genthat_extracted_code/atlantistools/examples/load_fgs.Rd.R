library(atlantistools)


### Name: load_fgs
### Title: Load the functional group file
### Aliases: load_fgs

### ** Examples

d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
file <- "SETasGroups.csv"
fgs <- load_fgs(file.path(d, file))
head(fgs)

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
file <- "SETasGroupsDem_NoCep.csv"
fgs <- load_fgs(file.path(d, file))
head(fgs)



