library(lmSupport)


### Name: figBarPlot
### Title: Wrapper for standarized use of barplot2() from gplots
### Aliases: figBarPlot
### Keywords: graphic

### ** Examples

##not run
##Means = matrix(c(70,65,68,91,100,90), nrow=2,ncol=3, byrow=TRUE)
##colnames(Means) = c('ITI', 'CUE-', 'CUE+')
##rownames(Means) = c('Non-deprived', 'Deprived')
##se = matrix(c(5,10,4,5,10,4), nrow=2,ncol=3, byrow=TRUE)

##bars.col = c('gray', 'white', 'black')
##bars.density = c(-1,-1,10)  #negative density suppresses lines
##bars.angle = c(0,0,45)

##figNewDevice()
##figBarPlot(Means,ylim=c(0,130), lab.text='Group', ci.plot=TRUE, se=se, 
##           bars.col=bars.col,bars.density=bars.density, 
##           bars.angle = bars.angle)
##figAxis(side=2,lab.text='Startle Response', scale.at=seq(0,120,by=20))
##figLegend('topright', legend=colnames(Means),fill=bars.col, angle=bars.angle,
## density=bars.density)




