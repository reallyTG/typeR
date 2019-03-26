library(rgr)


### Name: caplot
### Title: Prepare a Concentration-Area (C-A) Plot
### Aliases: caplot
### Keywords: hplot

### ** Examples
 
## The following examples are commented out as package akima is not 
## automatically made available as it is only a suggest, not a depends,
## and therefore caplot fails when the examples are run during package
## checking and building.  Functions shape.alt and/or gx.mf also be used
## to study mulifractality, and these have no restrictions

## Make test data available
## data(kola.o)
## attach(kola.o)

## A default (uninformative) C-A plot
## caplot(UTME/1000, UTMN/1000, Cu)

## Plot a more appropriately scaled (log transformed data) and 
## titled display
## caplot(UTME/1000, UTMN/1000, Cu, log = TRUE,
##	zname = "Cu (mg/kg) in\n<2 mm O-horizon soil",
##	caname = "Kola Project, 1995\nCu (mg/kg) in <2 mm O-horizon soil") 

## Plot as above but with the C-A plot accumulation reversed
## caplot(UTME/1000, UTMN/1000, Cu, log = TRUE, ifrev = TRUE,
##	zname = "Cu (mg/kg) in\n<2 mm O-horizon soil",
##	caname = "Kola Project, 1995\nCu (mg/kg) in <2 mm O-horizon soil") 

## Detach test data
## detach(kola.o)



