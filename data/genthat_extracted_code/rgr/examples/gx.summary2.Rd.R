library(rgr)


### Name: gx.summary2
### Title: Display a ten-line Summary Statistics Report
### Aliases: gx.summary2
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display
gx.summary2(Cu)

## Provide a more informative display
gx.summary2(Cu, xname = "Cu (mg/kg) in <2 mm Kola O-horizon soil")

## Detach test data
detach(kola.o)



