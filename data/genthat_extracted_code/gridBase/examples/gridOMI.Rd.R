library(gridBase)


### Name: Set Base Plot Regions
### Title: Set Base Plotting Regions from Grid Viewport
### Aliases: gridOMI gridFIG gridPLT gridPAR
### Keywords: dplot

### ** Examples

library(grid)
opar <- par(no.readonly=TRUE)
# gridFIG
grid.newpage()
pushViewport(viewport(width=0.5, height=0.5))
grid.rect(gp=gpar(col="grey", lty="dashed"))
par(fig=gridFIG())
par(new=TRUE)
plot(1:10)
# multiple plots
# NOTE the use of par(mfg)
# gridOMI
par(opar)
grid.newpage()
pushViewport(viewport(width=0.5, height=0.5))
grid.rect(gp=gpar(col="grey", lty="dashed"))
par(omi=gridOMI())
par(mfrow=c(2, 2), mfg=c(1, 1), mar=c(3, 3, 1, 0))
for (i in 1:4) {
  plot(i)
}
# gridPLT
par(opar)
grid.newpage()
pushViewport(viewport(width=0.5, height=0.5))
grid.rect(gp=gpar(col="grey", lwd=5))
par(plt=gridPLT())
par(new=TRUE)
plot(1:10)
# gridFIG with par(omi) set
par(opar)
grid.newpage()
par(omi=rep(1, 4))
pushViewport(viewport(width=0.5, height=0.5))
grid.rect(gp=gpar(col="grey", lwd=5))
par(fig=gridFIG())
par(new=TRUE)
plot(1:10)
# gridPLT with par(omi) set
par(opar)
grid.newpage()
par(omi=rep(1, 4))
pushViewport(viewport(width=0.5, height=0.5))
grid.rect(gp=gpar(col="grey", lwd=5))
par(plt=gridPLT())
par(new=TRUE)
plot(1:10)
# gridPAR
par(opar)
grid.newpage()
pushViewport(viewport(width=0.5, height=0.5,
  gp=gpar(col="red", lwd=3, lty="dotted")))
grid.rect(gp=gpar(col="grey", lwd=5))
par(fig=gridFIG())
par(gridPAR())
par(new=TRUE)
plot(1:10, type="b")



