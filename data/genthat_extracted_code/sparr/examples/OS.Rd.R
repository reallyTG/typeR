library(sparr)


### Name: OS
### Title: Oversmoothing (OS) bandwidth selector
### Aliases: OS OS.spattemp

### ** Examples


data(pbc)

OS(pbc)
OS(pbc,nstar="geometric") # uses case-control marks to replace sample size
OS(pbc,scaler="var") # set different scalar measure of spread

data(burk)
OS.spattemp(burk$cases)
OS.spattemp(burk$cases,scaler="sd") 




