library(StatDA)


### Name: SmoothLegend
### Title: Plots Smoothing Maps and a Legend
### Aliases: SmoothLegend
### Keywords: dplot smooth

### ** Examples

data(chorizon)
X=chorizon[,"XCOO"]
Y=chorizon[,"YCOO"]
el=log10(chorizon[,"As"])

# generate plot 
plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n")

data(bordersKola) # list with list elements x and y for x- and y-corrdinates of map borders
SmoothLegend(X,Y,el,resol=200,type="contin",whichcol="gray",
    qutiles=c(0,0.05,0.25,0.50,0.75,0.90,0.95,1), borders="bordersKola",
    leg.xpos.min=7.8e5,leg.xpos.max=8.0e5,leg.ypos.min=77.6e5,leg.ypos.max=78.7e5,
    leg.title="mg/kg", leg.title.cex=0.7, leg.numb.cex=0.7, leg.round=2,leg.wid=4,
    leg.numb.xshift=0.7e5,leg.perc.xshift=0.4e5,leg.perc.yshift=0.2e5,tit.xshift=0.35e5)

# plot background
data(kola.background)
plotbg(map.col=c("gray","gray","gray","gray"),map.lwd=c(1,1,1,1),add.plot=TRUE)



