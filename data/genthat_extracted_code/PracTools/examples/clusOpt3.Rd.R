library(PracTools)


### Name: clusOpt3
### Title: Compute optimal sample sizes for a three-stage sample
### Aliases: clusOpt3
### Keywords: methods survey

### ** Examples

    # optima for a fixed total budget
clusOpt3(unit.cost=c(500, 100, 120), delta1=0.01, delta2=0.10, unit.rv=1,
       k1=1, k2=1, tot.cost=100000,cal.sw=1)
    # optima for a target CV
clusOpt3(unit.cost=c(500, 100, 120), delta1=0.01, delta2=0.10, unit.rv=1,
       k1=1, k2=1, CV0=0.01,cal.sw=2)



