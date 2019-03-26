library(rgr)


### Name: gx.fractile
### Title: Estimate the Fractile for a Specified Quantile
### Aliases: gx.fractile
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Estimate the fractile for 20 mg/kg As
gx.fractile(As, 20)
temp <- gx.fractile(As, 20)
temp

## Clean-up and detach test data
rm(temp)
detach(kola.o) 



