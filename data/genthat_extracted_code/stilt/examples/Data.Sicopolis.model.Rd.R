library(stilt)


### Name: Data.Sicopolis.model
### Title: SICOPOLIS model ensemble output
### Aliases: Data.Sicopolis.model
### Keywords: datasets

### ** Examples

# Fit an emulator to the SICOPOLIS ensemble data
data(Data.Sicopolis.par)
data(Data.Sicopolis.model)
## Not run: 
##D emulator(Data.Sicopolis.par, Data.Sicopolis.model, c(FALSE, FALSE,
##D FALSE, FALSE, FALSE), FALSE, 200000, 20000)
## End(Not run)



