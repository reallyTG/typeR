library(gridBase)


### Name: baseViewports
### Title: Generate grid Viewports from Base Plot
### Aliases: baseViewports
### Keywords: dplot

### ** Examples

library(grid)
par(oma=rep(1, 4), mfrow=c(1, 2), xpd=NA)
plot(1:10)
vps <- baseViewports()
pushViewport(vps$inner)
grid.rect(gp=gpar(lwd=3, col="red"))
pushViewport(vps$figure)
grid.rect(gp=gpar(lwd=3, col="green"))
pushViewport(vps$plot)
grid.rect(gp=gpar(lwd=3, col="blue"))
grid.points(1:10, 10:1)



