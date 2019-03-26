library(paleoMAS)


### Name: change
### Title: Dissimilarities, distances and rates of change
### Aliases: change
### Keywords: manip arith math multivariate

### ** Examples

data(quexilchron,quexildepths,quexilper)
ages<-chron(quexilchron,quexildepths,max.depth=1957)$chronology[,2]
#Absolute change
change(quexilper,ages,meth="bray")
change(quexilper,ages,dca=TRUE)
#Rate of change
change(quexilper,ages,meth="bray",roc=TRUE)
change(quexilper,ages,dca=TRUE,roc=TRUE)



