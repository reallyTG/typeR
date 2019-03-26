library(Redmonder)


### Name: Redmonder
### Title: Redmonder palettes
### Aliases: redmonder.pal display.redmonder.pal display.redmonder.all
###   redmonder.pal.info redmonder colors Redmonder redmonder.all
### Keywords: color

### ** Examples

## create a sequential palette for usage and show colors
mypalette<-redmonder.pal(7,"sPBIRdPu")
image(1:7,1,as.matrix(1:7),col=mypalette,xlab="sPBIRdPu (sequential)",
       ylab="",xaxt="n",yaxt="n",bty="n")
## display a divergent palette
display.redmonder.pal(7,"dPBIYlBu")
devAskNewPage(ask=TRUE)
## display a qualitative palette
display.redmonder.pal(7,"qPBI")
devAskNewPage(ask=TRUE)
## display all palettes simultanoeusly
display.redmonder.all()
## display the first 10 colors of all palettes
display.redmonder.all(n=10, exact.n=FALSE)
devAskNewPage(ask=TRUE)
## display all palettes that have a minimum of 10 colors
display.redmonder.all(n=10)
devAskNewPage(ask=TRUE)
## display only diverging palettes
display.redmonder.all(type="div")
devAskNewPage(ask=TRUE)
## display only sequential palettes
display.redmonder.all(type="seq")
devAskNewPage(ask=TRUE)
## display only qualitative palettes
display.redmonder.all(type="qual")
devAskNewPage(ask=TRUE)
## display the first 5 colors of all diverging palettes
display.redmonder.all(n=5,type="div",exact.n=TRUE)
devAskNewPage(ask=TRUE)
## display palettes that are colorblind friendly
display.redmonder.all(colorblindFriendly=TRUE)
devAskNewPage(ask=TRUE)
## lists information for all palettes
redmonder.pal.info
## produces information for palette sPBIRdPu only
redmonder.pal.info["sPBIRdPu",]
## produces the maximum number of color values for palette sPBIRdPu only
redmonder.pal.info["sPBIRdPu",]$maxcolors



