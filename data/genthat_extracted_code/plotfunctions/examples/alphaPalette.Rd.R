library(plotfunctions)


### Name: alphaPalette
### Title: Manipulate the transparency in a palette.
### Aliases: alphaPalette

### ** Examples

# a palette of 5 white transparent colors:
alphaPalette('white', f.seq=1:5/5)
# the same palette:
alphaPalette('white', f.seq=c(.2,1), n=5)
# a palette with 10 colors blue, yellow and red, that differ in transparency
alphaPalette(c('blue', "yellow", "red"), f.seq=c(0.1,.8), n=10)

emptyPlot(1,1, axes=FALSE, main="Tunnel of 11 squares")
mycol <- "steelblue"
center <- c(.75, .25)
i = seq(0,1,by=.1)
fillcol <- alphaPalette(c(mycol, "black"), f.seq=i)
linecol <- alphaPalette(mycol, f.seq=1-i)
rect(center[1]-center[1]*(1.1-i), center[2]-center[2]*(1.1-i), 
    center[1]+(1-center[1])*(1.1-i), center[2]+(1-center[2])*(1.1-i), 
    col=fillcol, border=linecol, lty=1, lwd=1, xpd=TRUE)




