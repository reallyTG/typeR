library(stilt)


### Name: Data.UVic.par
### Title: UVic ESCM climate model ensemble parameter settings
### Aliases: Data.UVic.par
### Keywords: datasets

### ** Examples

# Fit an emulator to the UVic ESCM ensemble data using all parameter and
# time covariates
data(Data.UVic.par)
data(Data.UVic.model)
## Not run: emulator(Data.UVic.par, Data.UVic.model, c(TRUE, TRUE, TRUE), TRUE, 1, 1)



