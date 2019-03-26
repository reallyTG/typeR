library(ArArRedux)


### Name: getages
### Title: Calculate 40Ar/39Ar ages
### Aliases: getages

### ** Examples

data(Melbourne)
R <- get4039(Melbourne$X,Melbourne$irr)
J <- getJfactors(R)
ages <- getages(J)
plotcorr(ages)



