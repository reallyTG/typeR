library(plotrix)


### Name: rescale
### Title: Scale numbers into a new range
### Aliases: rescale
### Keywords: misc

### ** Examples

 # scale one vector into the range of another
 normal.counts<-rnorm(100)
 normal.tab<-tabulate(cut(normal.counts,breaks=seq(-3,3,by=1)))
 normal.density<-rescale(dnorm(seq(-3,3,length=100)),range(normal.tab))
 # now plot them
 plot(c(-2.5,-1.5,-0.5,0.5,1.5,2.5),normal.tab,xlab="X values",
  type="h",col="green")
 lines(seq(-3,3,length=100),normal.density,col="blue")



