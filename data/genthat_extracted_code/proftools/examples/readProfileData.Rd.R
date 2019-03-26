library(proftools)


### Name: readProfileData
### Title: Read Rprof Profile Data
### Aliases: readProfileData
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
flatProfile(pd)
flatProfile(pd, FALSE)



