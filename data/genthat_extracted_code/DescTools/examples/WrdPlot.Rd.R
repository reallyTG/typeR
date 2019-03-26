library(DescTools)


### Name: WrdPlot
### Title: Insert Active Plot to Word
### Aliases: WrdPlot
### Keywords: print

### ** Examples

## Not run: 
##D  # Windows-specific example
##D # let's have some graphics
##D plot(1,type="n", axes=FALSE, xlab="", ylab="", xlim=c(0,1), ylim=c(0,1), asp=1)
##D rect(0,0,1,1,col="black")
##D segments(x0=0.5, y0=seq(0.632,0.67, length.out=100),
##D   y1=seq(0.5,0.6, length.out=100), x1=1, col=rev(rainbow(100)))
##D polygon(x=c(0.35,0.65,0.5), y=c(0.5,0.5,0.75), border="white",
##D   col="black", lwd=2)
##D segments(x0=0,y0=0.52, x1=0.43, y1=0.64, col="white", lwd=2)
##D x1 <- seq(0.549,0.578, length.out=50)
##D segments(x0=0.43, y0=0.64, x1=x1, y1=-tan(pi/3)* x1 + tan(pi/3) * 0.93,
##D   col=rgb(1,1,1,0.35))
##D 
##D 
##D # get a handle to a new word instance
##D wrd <- GetNewWrd()
##D # insert plot with a specified height
##D WrdPlot(wrd=wrd, height=5)
##D ToWrd("Remember?\n", fontname="Arial", fontsize=14, bold=TRUE, wrd=wrd)
##D # crop the picture
##D WrdPlot(wrd=wrd, height=5, crop=c(9,9,0,0))
##D 
##D 
##D wpic <- WrdPlot(wrd=wrd, height=5, crop=c(9,9,0,0))
##D wpic
## End(Not run)



