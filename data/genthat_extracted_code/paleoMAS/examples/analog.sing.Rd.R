library(paleoMAS)


### Name: analog.sing
### Title: Single analog comparison
### Aliases: analog.sing
### Keywords: manip arith math multivariate

### ** Examples

data(quexilper,quexilchron,quexildepths)
age<-quexilchron
d<-quexildepths
ages<-chron(age,d,max.depth=1957,dates="bars")$chronology[,2]
#distance to the first sample without DCA, using canberra metric
analog.sing(quexilper,base=1,ages,method="canberra")
#distance to the first sample with DCA, using euclidean distance
analog.sing(quexilper,base=1,ages,dca=TRUE)



