library(rgr)


### Name: gx.plot2parts
### Title: Display Plots for Two Parts from a Compositional Data Set
### Aliases: gx.plot2parts
### Keywords: multivariate

### ** Examples
 
## Make test data available
data(sind)
attach(sind)

## Display
gx.plot2parts(Cu, Zn)

## Display with alternate xy-plot titling
gx.plot2parts(Cu, Zn, x1lab = "Cu (mg/kg) in stream sediment",
	x2lab = "Zn (mg/kg) in stream sediment")

## Detach test data
detach(sind)



