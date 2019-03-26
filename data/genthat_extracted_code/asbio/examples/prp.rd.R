library(asbio)


### Name: prp
### Title: Perpendicularity
### Aliases: prp print.prp.index

### ** Examples

## Not run: 
##D ###Diagram describing prp output.  
##D y<-rnorm(100,0,5)
##D plot(seq(1,100),sort(y),type="l",xaxt="n",yaxt="n",lwd=2,xlab="",ylab="")
##D op <- par(font=3)
##D 
##D segments(52,-12,46,sort(y)[46],lty=1,col=1,lwd=1)##A
##D segments(90,-8,85,sort(y)[85],lty=1,col=1,lwd=1)##B
##D segments(46,sort(y)[46],85,sort(y)[85],lty=1)##F
##D segments(90,-8,46,sort(y)[46],lty=2)##D
##D arrows(52,-12,90,-8,length=.1,lwd=3)##C
##D arrows(20,-12,20,8,lty=2,col="gray",length=.1)#North
##D arrows(20,sort(y)[46],95,sort(y)[46],length=.1,lty=2,col="gray")
##D arrows(20,-12,95,-12,length=.1,lty=2,col="gray")#East
##D 
##D text(20,9,"N",col="gray");text(97,-12, "E", col= "gray");text(97,sort(y)[46], "E",
##D col= "gray")
##D text(49.5,-12.5,"a");text(92.5,-8.5,"b")
##D text(45.5,-5.5,"A",font=4,col=1);text(70,-9,"C",font=4,col=1);text(91.5,-1.75,"B",
##D font=4,col=1)
##D text(44,sort(y)[46]+1,"c");text(67.5,-2.5,"D",font=4,col=1);text(65,3.9,"F",font=4,
##D col=1)
##D text(87,sort(y)[87]+1,"d");text(57,-10,expression(kappa),col=1);
##D text(81,sort(y)[87]-3,expression(gamma),col=1);text(57,1.3,expression(theta),col=1)
##D text(64,-11.5,expression(beta),col=1)
##D 
##D library(plotrix)
##D draw.arc(50,-12,6,1.35,col=1);draw.arc(50,-12,6,.3,col=1);draw.arc(50,-12,6,0.02,
##D col=1)
##D draw.arc(46,sort(y)[46],7,.01,col=1);draw.arc(46,sort(y)[46],7,.5,col="white")
##D draw.arc(85,sort(y)[85],6,-2.7,col=1);draw.arc(85,sort(y)[85],6,-1.4,col="white",
##D lwd=2)
##D legend("topleft",c(expression(paste(kappa, " = acos[(",C^2," + ",X^2," - ",D^2,")
##D /2CX]")),
##D expression(paste(gamma," = acos[(",Y^2," + ",F^2," - ",D^2,")/2YF]")),
##D expression(paste(theta," = atan[(",y[f]," - ",y[n],")/(",x[f]," - ",x[n],")]")),
##D expression(paste(beta, " = atan[(",y[epsilon]," - ",y[alpha],")/(",x[epsilon],
##D " - ",x[alpha],")]"))),
##D bty="n",cex=.9,inset=-.025)
##D 
##D ###Figure for demo dataset.
##D bX<-seq(0,49)/46
##D 
##D bY<-c(4.89000,4.88200,4.87400,4.87300,4.88000,4.87900,4.87900,4.90100,4.90800,
##D 4.91000,4.93300,4.94000,4.91100,4.90000,4.91700,4.93000,4.93500,4.93700,
##D 4.93300,4.94500,4.95900,4.95400,4.95100,4.95800,4.95810,4.95811,4.95810,
##D 4.96100,4.96200,4.96300,4.96500,4.96500,4.96600,4.96700,4.96540,4.96400,
##D 4.97600,4.97900,4.98000,4.98000,4.98100,4.97900,4.98000,4.97800,4.97600,
##D 4.97700,4.97400,4.97300,4.97100,4.97000)
##D 
##D X<-c(0.004166667,0.108333333,0.316666667,0.525000000,0.483333333,0.608333333,
##D 0.662500000,0.683333333,0.900000000,1.070833333)
##D Y<-c(4.67,4.25,4.26,4.50,4.90,4.10,4.70,4.40,4.20,4.30)
##D 
##D plot(bX,bY,type="l",lwd=2,xlab="",ylab="",ylim=c(4,5.1))
##D lines(X,Y)
##D 
##D for(i in 1:9)arrows(X[i],Y[i],X[i+1],Y[i+1],length=.1,lwd=1,angle=20)
##D mx<-rep(1,9)
##D my<-rep(1,9)
##D for(i in 1:9)mx[i]<-mean(c(X[i],X[i+1]))
##D for(i in 1:9)my[i]<-mean(c(Y[i],Y[i+1]))
##D for(i in 1:9)text(mx[i],my[i],i,font=2,cex=1.3)
##D 
##D nn<-near.bound(X,Y,bX,bY)
##D prp(seq(1,10),X,Y,nn[,1],nn[,2])$moment.by.moment
##D par(op)
## End(Not run)



