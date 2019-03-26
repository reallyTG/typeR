library(plotrix)


### Name: floating.pie
### Title: Display a floating pie chart
### Aliases: floating.pie
### Keywords: misc

### ** Examples

 plot(1:5,type="n",main="Floating Pie test",xlab="",ylab="",axes=FALSE)
 box()
 polygon(c(0,0,5.5,5.5),c(0,3,3,0),border="#44aaff",col="#44aaff")
 floating.pie(1.7,3,c(2,4,4,2,8),radius=0.5,
  col=c("#ff0000","#80ff00","#00ffff","#44bbff","#8000ff"))
 floating.pie(3.1,3,c(1,4,5,2,8),radius=0.5,
  col=c("#ff0000","#80ff00","#00ffff","#44bbff","#8000ff"))
 floating.pie(4,1.5,c(3,4,6,7),radius=0.5,
  col=c("#ff0066","#00cc88","#44bbff","#8000ff"))
 draw.circle(3.9,2.1,radius=0.04,col="white")
 draw.circle(3.9,2.1,radius=0.04,col="white")
 draw.circle(3.9,2.1,radius=0.04,col="white")
 draw.circle(4,2.3,radius=0.04,col="white")
 draw.circle(4.07,2.55,radius=0.04,col="white")
 draw.circle(4.03,2.85,radius=0.04,col="white")
 text(c(1.7,3.1,4),c(3.7,3.7,3.7),c("Pass","Pass","Fail"))
 plot(0,xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),type="n",axes=FALSE,
  main="Floating pie with minor explosions",xlab="",ylab="")
 floating.pie(x=1:5,explode=c(0,0.1,0,0.2,0))



