library(KMDA)


### Name: dscore
### Title: Distance-based Kernel Score Test
### Aliases: dscore

### ** Examples

data(hcc)
x=hcc[1:3,3:57]  ## This metabolite-set contains the first three metabolites in the hcc dataset.
y=c(rep(0,35),rep(1,20))
dscore(x,y,1,10,3)



