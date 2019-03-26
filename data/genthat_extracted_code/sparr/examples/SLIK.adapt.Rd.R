library(sparr)


### Name: SLIK.adapt
### Title: Simultaneous global/pilot likelihood bandwidth selection
### Aliases: SLIK.adapt

### ** Examples



## No test: 

data(pbc)
pbccas <- split(pbc)$case

SLIK.adapt(pbccas)
SLIK.adapt(pbccas,hold=TRUE)

## End(No test) 




