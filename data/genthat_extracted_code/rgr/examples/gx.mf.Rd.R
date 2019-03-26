library(rgr)


### Name: gx.mf
### Title: Prepare a Concentration-Number (C-N) Plot
### Aliases: gx.mf
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display to have a first look at the data and 
## decide how best to proceed
gx.mf(Cu)

## Provides a more appropriate initial display and indicates the 
## quartiles
gx.mf(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", ifqs = TRUE)

## Causes the C-N plot to be cumulated in reverse order.  This will reveal
## any multi-fractal properties of the data at lower concentrations
gx.mf(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", ifrev = TRUE)

## Detach test data
detach(kola.o)



