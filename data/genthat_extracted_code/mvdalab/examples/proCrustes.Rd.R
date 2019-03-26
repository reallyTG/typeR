library(mvdalab)


### Name: proCrustes
### Title: Comparison of n-point Configurations vis Procrustes Analysis
### Aliases: proCrustes print.proC

### ** Examples

X <- iris[, 1:2]
Y <- iris[, 3:4]

proc <- proCrustes(X, Y)
proc
names(proc)



