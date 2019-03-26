library(PreProcess)


### Name: graph.utility
### Title: OOMPA graphical utility functions
### Aliases: ellipse f.qq f.qt
### Keywords: aplot

### ** Examples

x <- rnorm(1000, 1, 2)
y <- rnorm(1000, 1, 2)
plot(x,y)
ellipse(1, 1, col=6, type='l', lwd=2)
ellipse(3, 2, col=6, type='l', lwd=2)
f.qq(x, main='Demo', col='blue')
f.qq(x, cut=3)
f.qt(x, df=3)
f.qt(x, df=40)



