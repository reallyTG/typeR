library(plotrix)


### Name: starPie
### Title: A pie-like graphic object
### Aliases: starPie
### Keywords: misc

### ** Examples

 date_mat<-data.frame(sex=rep(c("M","F"),each=10),
  names=c("Abe","Bob","Col","Dave","Eddie","Frank","Geoff","Harry","Igor","Jack",
  "Alice","Betty","Clare","Dora","Eva","Fran","Grace","Hilda","Iris","Joan"),
  eating=sample(0:100,20),dancing=sample(0:100,20),movies=sample(0:100,20),
  reading=sample(0:100,20),travel=sample(0:100,20))
 plot(0,xlim=c(0.5,10.5),ylim=c(0,3),type="n",axes=FALSE,xlab="",ylab="Sex",
  main="Date matching matrix")
 par(xpd=TRUE)
 legend(0.7,-0.3,c("Eat out","Dance","Movies","Read","Travel"),fill=rainbow(5),
  ncol=5)
 par(xpd=FALSE)
 box()
 axis(2,at=c(0.9,2.4),labels=c("Male","Female"))
 starPie(x=rep(1:10,2),y=rep(c(0.9,2.4),each=10),radext=0.5,
  values=as.matrix(date_mat[,3:7]),label=as.character(date_mat[["names"]]))



