library(PracTools)


### Name: clusOpt2
### Title: Compute optimal sample sizes for a two-stage sample
### Aliases: clusOpt2
### Keywords: methods survey

### ** Examples

    # optimum for a fixed total budget
clusOpt2(C1=750, C2=100, delta=0.05, unit.rv=1, k=1, tot.cost=100000, cal.sw=1)
    # optimum for a target CV
clusOpt2(C1=750, C2=100, delta=0.01, unit.rv=1, k=1, CV0=0.05, cal.sw=2)



