library(rgr)


### Name: gx.hist
### Title: Plot a Histogram
### Aliases: gx.hist
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o) 
attach(kola.o)

## Generates an initial display to have a first look at the data and
## decide how best to proceed
gx.hist(Cu)

## Provides a more appropriate initial display
gx.hist(Cu, xlab = "Cu (mg/kg) in <2 mm Kola O-horizon soil", log = TRUE)

## Causes the Sturges rule to be used to select the number 
## of histogram bins
gx.hist(Cu, xlab = "Cu (mg/kg) in <2 mm Kola O-horizon soil", log = TRUE, 
	nclass = "sturges")

## Detach test data
detach(kola.o)



