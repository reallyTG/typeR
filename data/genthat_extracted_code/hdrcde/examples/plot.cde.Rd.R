library(hdrcde)


### Name: plot.cde
### Title: Plots conditional densities
### Aliases: plot.cde
### Keywords: distribution hplot smooth

### ** Examples


faithful.cde <- cde(faithful$waiting,faithful$eruptions,
	x.name="Waiting time", y.name="Duration time")
plot(faithful.cde)
plot(faithful.cde,plot.fn="hdr")




