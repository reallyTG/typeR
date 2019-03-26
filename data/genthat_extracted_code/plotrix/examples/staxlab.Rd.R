library(plotrix)


### Name: staxlab
### Title: Place staggered or angled labels on an axis
### Aliases: staxlab
### Keywords: misc

### ** Examples

 x<-rnorm(12)
 plot(x,axes=FALSE)
 box()
 months<-c("January","February","March","April","May","June",
  "July","August","September","October","November","December")
 staxlab(1,1:12,months)
 plot(x,axes=FALSE)
 box()
 staxlab(1,1:12,months,srt=45)
 ylabels<-round(seq(min(x),max(x),length.out=10),3)
 staxlab(2,ylabels,ylabels,srt=45)



