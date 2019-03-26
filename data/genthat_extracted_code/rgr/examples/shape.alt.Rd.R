library(rgr)


### Name: shape.alt
### Title: An Alternate EDA Graphical Summary
### Aliases: shape.alt
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display to have a first look at the data and 
## decide how best to proceed
shape.alt(Cu)

## Provides a more appropriate initial display and indicates the 
## quartiles
shape.alt(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE,
	ifqs = TRUE)

## Causes the C-N plot to be cumulated in reverse order.  This will reveal
## any multifractal properties of the data at lower concentrations
shape.alt(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE, 
	ifrev = TRUE)

## Detach test data
detach(kola.o)



