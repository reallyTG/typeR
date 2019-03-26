library(metRology)


### Name: duewer.plot
### Title: Duewer concordance/apparent precision plot
### Aliases: duewer.plot duewer.plot.default dplot
### Keywords: hplot

### ** Examples

	require(metRology)
	data(Pb)
	Pb
	
	duewer.plot(Pb$value, Pb$u)

	duewer.plot(Pb$value, Pb$u, basis="prob", df=5)

	#Illustrate contour labelling
	duewer.plot(Pb$value, Pb$u, pos.clab="bottom")



