library(sparr)


### Name: NS
### Title: Normal scale (NS) bandwidth selector
### Aliases: NS NS.spattemp

### ** Examples


data(pbc)

NS(pbc)
NS(pbc,nstar="geometric") # uses case-control marks to replace sample size
NS(pbc,scaler="var") # set different scalar measure of spread

data(burk)
NS.spattemp(burk$cases)
NS.spattemp(burk$cases,scaler="sd") 




