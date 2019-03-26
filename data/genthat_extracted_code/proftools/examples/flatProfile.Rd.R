library(proftools)


### Name: flatProfile
### Title: Flat Profile for Rprof Profile Data
### Aliases: flatProfile
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
flatProfile(pd)
flatProfile(pd, FALSE)



