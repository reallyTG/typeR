library(rgr)


### Name: gx.summary1
### Title: Display a one-line Summary Statistics Report
### Aliases: gx.summary1
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display
gx.summary1(Cu)

## Provide a more informative display
gx.summary1(Cu, xname = "Cu (mg/kg) in <2 mm Kola O-horizon soil")

## As above but with a log10 transformation to display
## the geometric mean, etc.
gx.summary1(Cu, xname = "Cu (mg/kg) in <2 mm Kola O-horizon soil", log = TRUE)

## Detach test data
detach(kola.o)



