library(plotrix)


### Name: kiteChart
### Title: Magnitude by position chart.
### Aliases: kiteChart
### Keywords: misc

### ** Examples

 testmat<-matrix(c(runif(50),sample(1:50,50),rnorm(50)+5,
  sin(1:50)),ncol=50,byrow=TRUE)
 kiteChart(testmat,varlabels=c("Uniform","Sample","Normal","Sine"),
  timepos=seq(1,50,by=5),timex=FALSE)
 # not enough space for the last label, add it
 mtext("Sine",at=65,side=1,line=2)
 # now show it with kite line maxima
 kiteChart(testmat,varlabels=c("Uniform","Sample","Normal","Sine"),
  timepos=seq(1,50,by=5),timex=FALSE,varscale=TRUE)
 mtext("Sine",at=65,side=1,line=2)
 musicmat<-matrix(c(c(0.5,0.4,0.3,0.25,0.2,0.15,0.1,rep(0.05,44))+runif(51,0,0.05),
  c(0.1,0.2,0.3,0.35,0.4,0.5,0.4,rep(0.5,14),rep(0.4,15),rep(0.3,15))+runif(51,0,0.1),
  rep(0.15,51)+runif(51,0,0.1),
  c(rep(0,29),c(0.1,0.2,0.4,0.5,0.3,0.2,rep(0.05,16))+runif(22,0,0.05)),
  c(rep(0,38),c(rep(0.05,6),0.08,0.15,0.20,0.25,0.2,0.25,0.3)+runif(13,0,0.05))),
  ncol=51,byrow=TRUE)
 kiteChart(musicmat,varlabels=c("Swing","Rock","Jazz","Disco","Rap"),
  main="An utterly imaginary chart of music popularity",
  timepos=seq(1,51,by=10),timelabels=seq(1950,2000,by=10),mar=c(5,4,4,2))
 # now flip it to vertical, normalize and show the normalization factors
 kiteChart(musicmat,varlabels=c("Swing","Rock","Jazz","Disco","Rap"),
  main="An utterly imaginary chart of music popularity",xlab="Style",
  timepos=seq(1,51,by=10),timelabels=seq(1950,2000,by=10),mar=c(5,4,4,2),
  timex=FALSE,normalize=TRUE,shownorm=TRUE)



