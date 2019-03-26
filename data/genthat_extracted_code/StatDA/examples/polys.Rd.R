library(StatDA)


### Name: polys
### Title: Connect the Values with a Polygon
### Aliases: polys
### Keywords: aplot multivariate

### ** Examples

data(ohorizon)
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]
el=log10(ohorizon[,c("Cu","Ni","Na","Sr")])
sel <- c(3,8,22, 29, 32, 35, 43, 69, 73 ,93,109,129,130,134,168,181,183,205,211,
      218,237,242,276,292,297,298,345,346,352,372,373,386,408,419,427,441,446,490,
      516,535,551,556,558,564,577,584,601,612,617)
x=el[sel,]
plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n",
   xlim=c(360000,max(X)))
polys(x,ncol=8,key.loc=c(15,1),factx=0.30,facty=2.0,cex=0.75,lwd=1.1)



