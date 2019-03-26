library(plotrix)


### Name: barp
### Title: A bar plotting routine
### Aliases: barp
### Keywords: misc

### ** Examples

 # get some extra room on the left
 par(mar=c(5,5,4,2))
 # make up some happiness data, as so many seem to do
 happyday<-data.frame(Monday=c(2.3,3.4),Tuesday=c(2.8,3.3),Wednesday=c(3.2,3.1),
 Thursday=c(3.6,2.8),Friday=c(4.2,2.6),Saturday=c(4.5,2.9),Sunday=c(4.1,2.8))
 happylabels<-c("Utterly dashed","Rather mopey","Indifferent","Somewhat elated",
  "Euphoric")
 barp(happyday,names.arg=names(happyday),legend.lab=c("Slaves","Unemployed"),
  legend.pos=list(x=2,y=4.5),col=c("#ee7700","#3333ff"),main="9AM happiness by weekday",
  xlab="Day of week",ylab="Happiness rating",ylim=c(1,5),staxx=TRUE,staxy=TRUE,
  height.at=1:5,height.lab=happylabels,cex.axis=0.9,cylindrical=TRUE,
  shadow=TRUE)
 # now do a plot with colors scaled to the sex ratio (real data!)
 sexratio<-c(0.24,0.35,0.09,0.59,0.63,0.34,0.7,0.6)
 # the fun ratings are once again a pack of lies
 funrating<-c(3.2,3.5,1.5,5.4,4.5,2.7,6.8,4.9)
 funstudy<-c("Astronomy","Chemistry","Economics","Anthropology","Linguistics",
  "Math/Stats","Psychology","Sociology")
 funlabels<-c("Torture","Agony","Boredom","Neutral","Entertaining","Exhilarating",
  "Maniacal")
 # xrange is used to get the colors to match the 0-100% scale
 barp(funrating,names.arg=funstudy,main="Fun ratings for various areas of study",
  col=color.scale(sexratio,c(0.2,1),c(0.2,0.4),c(1,0.4),xrange=c(0,1)),
  xlab="Study",ylab="Rating",height.at=1:7,height.lab=funlabels,ylim=c(1,7),
  staxx=TRUE,staxy=TRUE,cex.axis=0.9)
 # here we want the full scale from zero to one
 color.legend(2,6,4,6.4,legend=c("100% guys","100% girls"),
  rect.col=color.scale(seq(0,1,by=0.25),c(0.2,1),c(0.2,0.4),c(1,0.4)))
 par(mar=c(5,4,4,2))
 # use barp to display a multiple histogram with a shaded background
 # notice how the expression uses local variables inside the barp function
 gradbg<-"gradient.rect(xlim[1],ylim[1],xlim[2],ylim[2],
  c(1,0.5,1),c(1,0.5,1),c(1,0.5,1),gradient=\"y\",nslices=100)"
 h1<-table(cut(rnorm(100,4),breaks=seq(0,8,by=2)))
 h2<-table(cut(rnorm(100,4),breaks=seq(0,8,by=2)))
 h3<-table(cut(rnorm(100,4),breaks=seq(0,8,by=2)))
 hmat<-matrix(c(h1,h2,h3),nrow=3,byrow=TRUE)
 barp(hmat,names.arg=names(h1),width=0.45,col=2:4,do.first=gradbg,
  main="Multiple histogram using barp",xlab="Bins",ylab="Frequency")
 legend(3.8,50,c("h1","h2","h3"),fill=2:4)
 # now display a positive/negative plot
 barp(c(2,-3,4,-5,6,-7,8),main="Positive/negative plot",
  xlab="Alternating colors",ylab="For alternating values",
  col=2+(c(2,-3,4,-5,6,-7,8)>0))



