library(rgr)


### Name: gx.quantiles
### Title: Estimate the Common Quantiles
### Aliases: gx.quantiles
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Estimate the common quantiles
gx.quantiles(As, "As (mg/kg) in Kola O-horizon soil")

## Clean-up and detach test data
detach(kola.o) 



