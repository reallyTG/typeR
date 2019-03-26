library(rgr)


### Name: shape
### Title: An EDA Graphical Summary
### Aliases: shape
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display to have a first look at the data and 
## decide how best to proceed
shape(Cu)

## Provides a more appropriate initial display and indicates the 
## quartiles
shape(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE,
	ifqs = TRUE)

## Causes the Friedman-Diaconis rule to be used to select the number of
## histogram bins and changes the ECDF and CPP plotting symbols to a
## cross/x
shape(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE, 
	nclass = "fd", pch = 4)

## Replaces the Tukey boxplot with a box-and-whisker plot where the 
## whiskers extend to the 10th and 90th percentiles and the minimum
## and maximum observed values are marked with a plus sign.
shape(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE, 
	ifbw =TRUE, wend = 0.1)

## Detach test data
detach(kola.o)



