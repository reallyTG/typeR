library(pBrackets)


### Name: brackets
### Title: Add brackets to a plot.
### Aliases: brackets
### Keywords: braces brackets

### ** Examples


par(mar=c(1,1,1,1))
plot(0,0, type='n', xlim=c(0,20), ylim=c(0,20), axes=FALSE, xlab='', ylab='')
abline(h=seq(0,20), v=seq(0, 7), col=rgb(0.8, 0.9, 0.95))

brackets(0, 18, 7, 20, lwd=2)
text(8, 20, labels=expression(paste(bold('Braces:'), ' default')), adj=c(0,0))

brackets(0, 16, 7, 18, lwd=2, curvatur=1, type=2)
text(8, 18, labels=expression(paste(bold('Braces 2:'), ' curvatur=1, type=2')), adj=c(0,0))

brackets(0, 14, 7, 16, lwd=2, ticks=NA, curvatur=1, type=5)
text(8, 16, labels=expression(paste(bold('Parentheses:'), ' ticks=NA, curvature=1, type=5')),
 adj=c(0,0))

brackets(0, 12, 7, 14, lwd=2, ticks=NA, type=4, h=0.5)
text(8, 14, labels=expression(paste(bold('Square brackets:'), ' ticks=NA, type=4')), adj=c(0,0))

brackets(0, 10, 7, 12, lwd=2, ticks=NA, curvature=1, type=3)
text(8, 12, labels=expression(paste(bold('Chevrons:'), ' ticks=NA, curvature=1, type=3')),
 adj=c(0,0))

brackets(0, 8, 7, 10, lwd=2, ticks=NA, type=3, curvature=0.2, h=0.75)
text(8, 10, labels=expression(paste(bold('Stump brackets:'), ' ticks=NA, curvature=0.2, type=3')),
adj=c(0,0))

brackets(0, 6, 7, 8, lwd=2, type=4)
text(8, 8, labels=expression(paste(bold('Square brackets with tick:'), ' type=4')), adj=c(0,0))

brackets(0, 4, 7, 6, lwd=2, ticks=c(0.25, 0.75))
text(8, 6, labels=expression(paste(bold('Double tick braces:'), ' ticks=c(0.25, 0.75)')),
adj=c(0,0))

brackets(0, 2, 7, 4, lwd=2, ticks=-0.5, h=0.5)
text(8, 4, labels=expression(paste(bold('Negative tick braces:'), ' ticks=-0.5')), adj=c(0,0))

brackets(0, 0, 7, 2, lwd=2, ticks=c(-0.2, -0.4, -0.6, -0.8, 1), type=4)
text(8,2,labels=expression(paste(bold('Multiples ticks:'),'ticks=c(-0.2,-0.4,-0.6,-0.8,1),type=4')),
adj=c(0,0))




