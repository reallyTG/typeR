library(SWMPr)


### Name: comb
### Title: Combine swmpr data
### Aliases: comb comb.swmpr comb.default

### ** Examples


## get wq and met data as separate objects for the same station
swmp1 <- apacpnut
swmp2 <- apaebmet

## combine nuts and wq data by union, set timestep to 120 minutes
## Not run: 
##D comb(swmp1, swmp2, timestep = 120, method = 'union')
## End(Not run)



