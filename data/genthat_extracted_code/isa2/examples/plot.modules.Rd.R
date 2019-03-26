library(isa2)


### Name: plotModules
### Title: Image plots of biclusters
### Aliases: images plotModules plotModules,list-method
### Keywords: cluster

### ** Examples

## The following should plot the input matrix and the four modules
## found by ISA
set.seed(1)   # to get same plot every time
data <- isa.in.silico(100, 100, num.fact=4)
modules <- isa(data[[1]], thr.row=2, thr.col=2)
plotModules(modules, data=data[[1]], binary=FALSE,
            names=c("Input matrix",
                    paste("Module", seq_len(ncol(modules$rows)))))



