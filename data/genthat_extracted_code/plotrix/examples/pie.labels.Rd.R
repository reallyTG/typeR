library(plotrix)


### Name: pie.labels
### Title: Place labels on a pie chart
### Aliases: pie.labels
### Keywords: misc

### ** Examples

 pieval<-c(2,1,3,94)
 plot(0,xlim=c(1.5,5),ylim=c(1,5),type="n",axes=FALSE,xlab="",ylab="")
 box()
 bisect.angles<-floating.pie(3,3,pieval,explode=c(0.1,0.2,0.3,0))
 pie.labels(3,3,bisect.angles,c("two","one","three","ninety\nfour"),
  minangle=0.2,,explode=c(0.1,0.2,0.3,0))



