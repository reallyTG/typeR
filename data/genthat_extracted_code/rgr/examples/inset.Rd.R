library(rgr)


### Name: inset
### Title: An EDA Graphical and Statistical Summary
### Aliases: inset
### Keywords: hplot

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Generates an initial display
inset(Cu)

## Provides a more appropriate display for pubication
inset(Cu, xlab = "Cu (mg/kg) in <2 mm O-horizon soil", log = TRUE)

## NOTE: The example statistics table may not display correctly

## Detach test data
detach(kola.o)



