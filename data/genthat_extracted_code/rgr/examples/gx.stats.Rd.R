library(rgr)


### Name: gx.stats
### Title: Function to Compute and Display Summary Statistics
### Aliases: gx.stats
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display
gx.stats(Cu)

## Provides a more appropriate labelled display
gx.stats(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil")

## Detach test data
detach(kola.o)



