library(rgr)


### Name: cnpplt
### Title: Cumulative Normal Percentage Probability (CPP) Plot
### Aliases: cnpplt
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## A stand-alone cumulative normal percentage probability plot
cnpplt(Cu)

## A more appropriately labelled and scaled cumulative normal percentage
## probability plot using a cross/x rather than a plus
cnpplt(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE, 
	pch = 4)

## Detach test data
detach(kola.o)



