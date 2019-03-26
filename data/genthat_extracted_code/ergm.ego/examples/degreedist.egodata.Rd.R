library(ergm.ego)


### Name: degreedist.egodata
### Title: Plotting the degree distribution of an egocentric dataset
### Aliases: degreedist.egodata

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)

degreedist(fmh.ego,by="Grade",brgmod=TRUE)




