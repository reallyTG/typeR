library(paleoMAS)


### Name: analog.mult
### Title: Multiple analogs comparison
### Aliases: analog.mult
### Keywords: manip arith math multivariate

### ** Examples

data(quexilchron,quexildepths,quexilper)
#Define chronolgy
age<-quexilchron
ages<-chron(age,quexildepths,max.depth=1957)$chronology[,2]
#If samples are used as representative of time periods
quexilbase<-quexilper[c(1,27,68),]
rownames(quexilbase)<-c("Late Pleistocene","LGM","MIS3")
#comparison of all fossil samples with the three periods 
analog.mult(quexilbase,quexilper,ages,res=500)
#three-dimensional figure
analog.mult(quexilbase,quexilper,ages,res=500,plot=TRUE,dimension=TRUE,wire=TRUE)
#multipanel figure
analog.mult(quexilbase,quexilper,ages,res=500,plot=TRUE,dimension=FALSE)




