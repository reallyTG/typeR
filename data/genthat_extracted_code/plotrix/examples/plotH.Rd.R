library(plotrix)


### Name: plotH
### Title: Scatterplot with histogram-like bars.
### Aliases: plotH plotH.formula plotH.default
### Keywords: misc

### ** Examples

  d<-data.frame(x=c(1,5,10:20),y=runif(13)+1,
                yn1=runif(13)-0.5,yn2=runif(13)-2,
                g=factor(sample(c("A","B","C"),13,replace=TRUE)))
  # new plotH function with formula notation
  plotH(y~x,data=d)
  # old plot() function with formula notation -- for comparison's purpose
  plot(y~x,data=d,type="h")
  # new function over-riding default ylim, increasing bar width,
  # and changing bar color
  plotH(y~x,data=d,ylim=range(d$y),width=0.9,col="red")
  # handling some negative values
  plotH(yn1~x,data=d) # not so good, because of default ylim
  plotH(yn1~x,data=d,ylim=c(0,max(d$yn1)))  # old look
  # handling all negative values
  plotH(yn2~x,data=d)
  plotH(yn2~x,data=d,ylim=range(d$yn2))  # old look
  # example of pass-through to barplot
  smry<-by(d$y,d$g,mean)
  plotH(levels(d$g),smry,ylab="Mean of Random Variable",xlab="Group")
  # example of non-formula usage
  x1 <- d$x
  y1 <- d$y
  plotH(x1,y1,col="blue")



