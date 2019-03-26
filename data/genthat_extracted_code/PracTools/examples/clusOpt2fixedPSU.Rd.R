library(PracTools)


### Name: clusOpt2fixedPSU
### Title: Optimal number of sample elements per PSU in a two-stage sample
###   when the sample of PSUs is fixed
### Aliases: clusOpt2fixedPSU
### Keywords: methods survey

### ** Examples

    # optima for a vector of budgets
clusOpt2fixedPSU(C1=500, C2=100, m=100, delta=0.05, unit.rv=2, k=1, CV0=NULL,
       tot.cost=c(100000, 500000, 10^6), cal.sw=1)
    # optima for a target CV and vector of PSU costs
clusOpt2fixedPSU(C1=c(500,1000,5000), C2=100, m=100, delta=0.05, unit.rv=2, k=1,
       CV0=0.05, tot.cost=NULL, cal.sw=2)



