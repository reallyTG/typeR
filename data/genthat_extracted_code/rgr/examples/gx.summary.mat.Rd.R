library(rgr)


### Name: gx.summary.mat
### Title: Displays Summary Statistics for a Matrix or Data Frame
### Aliases: gx.summary.mat
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display for As [6], Co [13], Cu [15],
## Ni [24] and Zn [38] 
gx.summary.mat(kola.o, c(6, 13, 15, 24, 38))

## Alternately
gx.summary.mat(kola.o, c("As", "Co", "Cu", "Ni", "Zn"))

## Provide a more informative display for Be [9], La [19], P [25],
## Th [33], U [35] and Y[37]
gx.summary.mat(kola.o, c(9, 19, 25, 33, 35, 37), 
	banner = "Kola Project, <2 mm O-horizon soils")

## As above but with a log10 transformation to display
## the geometric mean, etc.
gx.summary.mat(kola.o, c("Be", "La", "P", "Th", "U", "Y"), 
	log = TRUE, banner = "Kola Project, <2 mm O-horizon soils")

## Detach test data
detach(kola.o)



