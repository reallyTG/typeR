library(plotrix)


### Name: size_n_color
### Title: Display circles with specified size and color
### Aliases: size_n_color
### Keywords: misc

### ** Examples

 meantemp<-c(19,22,25,29,21,20,16,27,23,26)
 totalrain<-c(174,152,196,120,177,183,92,153,161,85)
 numpumpkin<-c(53,47,61,63,38,42,48,71,66,29)
 meanwt<-c(1.5,2.3,2.8,1.9,2.4,1.8,2.6,2.2,1.7)
 size_n_color(meantemp,totalrain,meanwt/5,NA,xlim=c(15,30),
  color.scale(numpumpkin,c(0.8,0),c(0.8,1),0),
  xlab="Temperature (degrees C)",ylab="Rainfall (mm)",
  main="Number and weight of pumpkins by temperature and rainfall",
  xat=seq(15,30,by=5),yat=seq(80,200,by=20))  
 color.legend(15,55,18.5,60,seq(40,70,by=10),
  rect.col=color.scale(seq(40,70,by=10),c(0.8,0),c(0.8,1),0))
 points(15:18,rep(126,4),cex=seq(1.5,3.0,by=0.5))
 text(15:19,rep(134,5),c("1.5","2.0","2.5","3.0","kg"))
 par(xpd=TRUE)
 text(13.5,60,"Number of\npumpkins")
 par(xpd=FALSE)
 # now display a "visual table" of delayed registrations by underlying cause of
 # death and year of observation. The sizes of the circles represent the log of
 # the number of deaths and the colors represent the percentage of deaths that
 # occurred in the year prior to registration or earlier
 data(death_reg)
 size_n_color(x=matrix(rep(1996:2010,each=22),nrow=22),
  y=matrix(rep(1:22,15),nrow=22),size=t(death_reg[[1]])/200,
  col=color.scale(t(death_reg[[2]]),c(0,0.8,1),c(1,0.2,0),0),
  ylim=c(1,22),main="Delayed registrations by ICD chapter",
  xlab="Year",xaxlab=1996:2010,xat=1996:2010,xcex=0.8,
  yaxlab=colnames(death_reg[[1]]),ycex=0.8,ygrid=TRUE,mar=c(5,6,4,2))
 color.legend(1994,-3.5,2000,-2.5,seq(0,50,by=10),cex=0.8,
  rect.col=color.scale(seq(0,50,by=10),c(0,0.8,1),c(1,0.2,0),0))
 par(xpd=TRUE)
 text(1993.4,-2.5,"Pct.\nslow",cex=0.8)
 par(xpd=FALSE)



