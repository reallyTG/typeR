library(KMDA)


### Name: sscore
### Title: Distance-based Kernel Score Test
### Aliases: sscore

### ** Examples

data(hcc)
x=hcc[1:3,3:57]  ## This metabolite-set contains the first three metabolites in the hcc dataset.
y=c(rep(0,35),rep(1,20))
sscore(x,y,10^-3,10^3,10)



