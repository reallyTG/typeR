library(mosaic)


### Name: ladd
### Title: Add to Lattice Plots
### Aliases: ladd
### Keywords: graphics

### ** Examples

p <- xyplot(rnorm(100) ~rnorm(100))
print(p)
ladd(panel.abline(a=0,b=1))
ladd(panel.abline(h=0,col='blue'))
ladd(grid.text('Hello'))
ladd(grid.text(x=.95,y=.05,'text here',just=c('right','bottom')))
q <- xyplot(rnorm(100) ~rnorm(100)|factor(rbinom(100,4,.5)))
q <- update(q, layout=c(3,2))
ladd(panel.abline(a=0,b=1), plot=q)
ladd(panel.abline(h=0,col='blue'))
ladd( grid.text("(2,1)",gp=gpar(cex=3,alpha=.5)), columns=2, rows=1)
ladd( grid.text("p5",gp=gpar(cex=3,alpha=.5)), packets=5)
q
ladd( grid.text(paste(current.column(), current.row(),sep=','), gp=gpar(cex=3,alpha=.5)) )
histogram( ~eruptions, data=faithful )
# over would probably be better here, but the demonstrates what under=TRUE does.
ladd(panel.densityplot(faithful$eruptions, lwd=4), under=TRUE) 




