library(PracTools)


### Name: clusOpt3fixedPSU
### Title: Compute optimal number of sample secondary sampling units (SSUs)
###   and elements per SSU for a fixed set of primary sampling units (PSUs)
###   in a three-stage sample
### Aliases: clusOpt3fixedPSU
### Keywords: methods survey

### ** Examples

    # optima for a fixed total budget
clusOpt3fixedPSU(unit.cost=c(500, 100, 120), m=100, delta1=0.01, delta2=0.05, unit.rv=1,
     k1=1, k2=1, tot.cost=500000,cal.sw=1)
    # optima for a target CV
clusOpt3fixedPSU(unit.cost=c(500, 100, 120), m=100, delta1=0.01, delta2=0.05, unit.rv=1,
     k1=1, k2=1, CV0=0.05,cal.sw=2)



