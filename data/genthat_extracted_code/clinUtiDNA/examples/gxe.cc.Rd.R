library(clinUtiDNA)


### Name: gxe.cc
### Title: Estimation of gene-environment interaction on the additive scale
###   for case-control data
### Aliases: gxe.cc

### ** Examples

## Parameter initialisation
cases <- c(36,10,84,25)
contr <- c(100,4,63,2)
pD <- c(22,9420)
## Calculation of the interaction effect
gxe.cc(cases,contr,pD)  # with pD estimated from external data
gxe.cc(cases,contr,pD=0.002) # with known pD



