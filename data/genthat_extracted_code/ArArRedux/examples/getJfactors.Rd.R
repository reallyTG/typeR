library(ArArRedux)


### Name: getJfactors
### Title: Calculate the irradiation parameter ('J factor')
### Aliases: getJfactors

### ** Examples

data(Melbourne)
R <- get4039(Melbourne$X,Melbourne$irr)
J <- getJfactors(R)
plotcorr(J)



