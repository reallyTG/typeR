library(plotrix)


### Name: barlabels
### Title: Label the bars on a barplot
### Aliases: barlabels
### Keywords: misc

### ** Examples

 heights<-c(14,20,9,31,17)
 barpos<-barplot(heights,main="A redundant bar plot")
 # show the usual value labels on the bars
 barlabels(barpos,heights)
 # now with stacked bars and offsets
 heights<-matrix(sample(c(1,2,10,15),20,TRUE),ncol=4)
 barpos<-barplot(heights,main="Another redundant bar plot")
 barlabels(barpos,heights,offset=0.1)
 # finally use barp for the plot
 barpos<-barp(heights,main="A third and final bar plot",col=2:6,
  names.arg=paste("Day",1:4))
 barlabels(barpos$x,barpos$y,matrix(LETTERS[1:5],nrow=5,ncol=4))



