library(StatDA)


### Name: boxes
### Title: Boxes
### Aliases: boxes
### Keywords: multivariate

### ** Examples

#plots the background and the boxes for the elements
data(ohorizon)
X=ohorizon[,"XCOO"]
Y=ohorizon[,"YCOO"]
el=log10(ohorizon[,c("Co","Cu","Ni","Rb","Bi","Na","Sr")])
data(kola.background)

sel <- c(3,8,22, 29, 32, 35, 43, 69, 73 ,93,109,129,130,134,168,181,183,205,211,
      218,237,242,276,292,297,298,345,346,352,372,373,386,408,419,427,441,446,490,
      516,535,551,556,558,564,577,584,601,612,617)

x=el[sel,]
xwid=diff(range(X))/12e4
ywid=diff(range(Y))/12e4
plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n",
   xlim=c(360000,max(X)))
plotbg(map.col=c("gray","gray","gray","gray"),add.plot=TRUE)

boxes(x,locations=cbind(X[sel],Y[sel]),len=20000,key.loc=c(800000,7830000),leglen=25000,
     cex=0.75, add=TRUE, labels=NULL, lwd=1.1)




