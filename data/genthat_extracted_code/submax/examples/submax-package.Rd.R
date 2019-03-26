library(submax)


### Name: submax-package
### Title: Effect Modification in Observational Studies Using the Submax
###   Method
### Aliases: submax-package
### Keywords: package

### ** Examples

#Reproduces parts of Table 2 of Lee et al. (2017)
data(Active)
submax(Active$delta,Active[,1:7],gamma=1.70,alternative="less")



