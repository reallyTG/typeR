library(stilt)


### Name: Data.1D.model
### Title: Synthetic model output for a simple 1-parameter ensemble example
### Aliases: Data.1D.model
### Keywords: datasets

### ** Examples

# Fit an emulator to the 1-parameter ensemble data
data(Data.1D.model)
data(Data.1D.par)
emulator(Data.1D.par, Data.1D.model, FALSE, FALSE, 1, 1)



