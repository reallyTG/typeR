library(rgr)


### Name: gx.quantile
### Title: Estimate the Quantile for a Specified Fractile
### Aliases: gx.quantile
### Keywords: univar

### ** Examples

## Make test data available
data(kola.o)
attach(kola.o)

## Estimate the 80th percentile, f = 0.8
gx.quantile(As, 0.8)
temp <- gx.quantile(As, 0.8)
temp

## Clean-up and detach test data
rm(temp)
detach(kola.o) 



