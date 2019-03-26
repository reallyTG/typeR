library(EcoTroph)


### Name: plot.Transpose
### Title: Plot Transpose Function
### Aliases: plot.Transpose
### Keywords: ~EcoTroph ~Transpose

### ** Examples

data(ecopath_guinee)
smoothed<-create.smooth(ecopath_guinee)
plot(Transpose(smoothed,ecopath_guinee,"biomass"),scale=log)
plot(Transpose(smoothed,ecopath_guinee,"catch.1"),
	title="Small Scale Fishery Catch")



