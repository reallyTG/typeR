library(GNAR)


### Name: GNARfit
### Title: Fitting function for GNAR models
### Aliases: GNARfit

### ** Examples

#Fit the GNAR(2,[1,1]) model to the fiveVTS data
data(fiveNode)
GNARfit()

#Convert the residuals to matrix form
residToMat(GNARfit())$resid



