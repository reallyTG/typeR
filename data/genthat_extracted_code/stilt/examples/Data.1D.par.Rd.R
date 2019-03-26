library(stilt)


### Name: Data.1D.par
### Title: Parameter settings for 1-parameter ensemble model output in
###   Data.1D.model
### Aliases: Data.1D.par
### Keywords: datasets

### ** Examples

# Fit an emulator to the 1-parameter ensemble data
data(Data.1D.model)
data(Data.1D.par)
emulator(Data.1D.par, Data.1D.model, FALSE, FALSE, 1, 1)




