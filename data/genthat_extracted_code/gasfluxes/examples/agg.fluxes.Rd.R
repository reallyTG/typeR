library(gasfluxes)


### Name: agg.fluxes
### Title: Accumulation of fluxes
### Aliases: agg.fluxes

### ** Examples

#Some random example data
datetimes <- Sys.time() + (1:20)/2*24*3600
set.seed(42)
fluxes <- rlnorm(20, 5)
agg.fluxes(fluxes, datetimes)




