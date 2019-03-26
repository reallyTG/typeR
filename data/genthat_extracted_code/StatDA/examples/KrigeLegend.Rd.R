library(StatDA)


### Name: KrigeLegend
### Title: Krige
### Aliases: KrigeLegend
### Keywords: aplot

### ** Examples

data(chorizon)
data(kola.background)
X=chorizon[,"XCOO"]
Y=chorizon[,"YCOO"]
el=chorizon[,"As"]
vario.b <- variog(coords=cbind(X,Y), data=el, lambda=0, max.dist=300000)
data(res.eyefit.As_C_m) #need the data 
v5=variofit(vario.b,res.eyefit.As_C_m,cov.model="spherical",max.dist=300000)

plot(X,Y,frame.plot=FALSE,xaxt="n",yaxt="n",xlab="",ylab="",type="n")

# to inclrease the resolution, set e.g. resol=100
data(bordersKola) # x and y coordinates of project boundary
KrigeLegend(X,Y,el,resol=25,vario=v5,type="percentile",whichcol="gray",
    qutiles=c(0,0.05,0.25,0.50,0.75,0.90,0.95,1),borders="bordersKola",
    leg.xpos.min=7.8e5,leg.xpos.max=8.0e5,leg.ypos.min=77.6e5,leg.ypos.max=78.7e5,
    leg.title="mg/kg", leg.title.cex=0.7, leg.numb.cex=0.7, leg.round=2,
    leg.numb.xshift=0.7e5,leg.perc.xshift=0.4e5,leg.perc.yshift=0.2e5,tit.xshift=0.35e5)

plotbg(map.col=c("gray","gray","gray","gray"),map.lwd=c(1,1,1,1),add.plot=TRUE)



