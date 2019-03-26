library(stilt)


### Name: Data.UVic.model
### Title: UVic ESCM climate model ensemble output
### Aliases: Data.UVic.model
### Keywords: datasets

### ** Examples

# Fit an emulator to the UVic ESCM ensemble data using all parameter and
#time covariates
data(Data.UVic.model)
data(Data.UVic.par)
## Not run: emulator(Data.UVic.par, Data.UVic.model, c(TRUE, TRUE, TRUE), TRUE, 1, 1)



