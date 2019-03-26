library(DescTools)


### Name: PowerPoint Interface
### Title: Add Slides, Insert Texts and Plots to PowerPoint
### Aliases: PpPlot PpText PpAddSlide GetNewPP GetCurrPP
### Keywords: print

### ** Examples

## Not run: 
##D # Windows-specific example
##D 
##D # let's have some graphic
##D plot(1,type="n", axes=FALSE, xlab="", ylab="", xlim=c(0,1), ylim=c(0,1))
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
##D # get a handle to a new PowerPoint instance
##D pp <- GetNewPP()
##D # insert plot with a specified height
##D PpPlot(pp=pp,  x=150, y=150, height=10, width=10)
##D 
##D PpText("Remember?\n", fontname="Arial", x=200, y=70, height=30, fontsize=14,
##D        bold=TRUE, pp=pp, bg="lemonchiffon", hasFrame=TRUE)
##D 
##D PpAddSlide(pp=pp)
##D # crop the picture
##D pic <- PpPlot(pp=pp, x=1, y=200, height=10, width=10, crop=c(9,9,0,0))
##D pic
##D 
##D 
##D # some more automatic procedure
##D pp <- GetNewPP()
##D PpText("Hello to my presentation", x=100, y=100, fontsize=32, bold=TRUE,
##D        width=300, hasFrame=FALSE, col="blue", pp=pp)
##D 
##D for(i in 1:4){
##D   barplot(1:4, col=i)
##D   PpAddSlide(pp=pp)
##D   PpPlot(height=15, width=21, x=50, y=50, pp=pp)
##D   PpText(gettextf("This is my barplot nr %s", i), x=100, y=10, width=300, pp=pp)
##D }
## End(Not run)



