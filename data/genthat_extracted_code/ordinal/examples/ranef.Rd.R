library(ordinal)


### Name: ranef
### Title: Extract conditional modes and conditional variances from clmm
###   objects
### Aliases: ranef condVar ranef.clmm condVar.clmm
### Keywords: models

### ** Examples


fm1 <- clmm(rating ~ contact + temp + (1|judge), data=wine)

## Extract random effect estimates/conditional modes:
re <- ranef(fm1, condVar=TRUE)

## Get conditional variances:
attr(re$judge, "condVar")
## Alternatively:
condVar(fm1)




