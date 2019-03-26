library(plotrix)


### Name: emptyspace
### Title: Find an empty space on a plot
### Aliases: emptyspace
### Keywords: misc

### ** Examples

 x<-rnorm(100)
 y<-rnorm(100)
 plot(x,y,main="Find the empty space",xlab="X",ylab="Y")
 es<-emptyspace(x,y)
 # use a transparent background so that any overplotted points are shown
 boxed.labels(es,labels="Here is the\nempty space",bg="transparent")



