library(meteogRam)


### Name: crosssection
### Title: Atmospheric cross section
### Aliases: crosssection
### Keywords: cross section

### ** Examples

data(example_humi)
data(example_wind)
data(example_temperature)
crosssection(humi,wind,temperature,plot.temp=TRUE,plot.wind=TRUE,
	colors=c("brown", "yellow","green"),
	ylab_tics=c(0,0.2,0.4,0.6,0.8,0.9),
	ylab=c(1000,800,600,400,200,100),
	h_limit=54,h_step=3,p_nr=10)



