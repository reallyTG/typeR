library(plotrix)


### Name: thigmophobe.labels
### Title: Place labels away from the nearest point
### Aliases: thigmophobe.labels
### Keywords: misc

### ** Examples

 x<-rnorm(20)
 y<-rnorm(20)
 xlim<-range(x)
 xspace<-(xlim[2]-xlim[1])/20
 xlim<-c(xlim[1]-xspace,xlim[2]+xspace)
 ylim<-range(y)
 yspace<-(ylim[2]-ylim[1])/20
 ylim<-c(ylim[1]-yspace,ylim[2]+yspace)
 plotlabels<-
  c("one","two","three","four","five","six","seven","eight","nine","ten",
  "eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen",
  "eighteen","nineteen","twenty")
 plot(x=x,y=y,xlim=xlim,ylim=ylim,main="Test thigmophobe.labels")
 # skip the almost invisible yellow label, make them bold
 thigmophobe.labels(x,y,plotlabels,col=c(2:6,8:12),font=2)



