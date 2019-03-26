library(measuRing)


### Name: plotSegments
### Title: Image segments
### Aliases: plotSegments

### ** Examples

## (not run) Read one image sample in folder of package measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")        
## column numbers to be included/avoided:
Toinc <- c(196,202,387,1564) 
Toexc <- c(21,130,197,207,1444,1484)        
##(not run) Plotting of five image segments:
plots <- plotSegments(image1,rgb=c(0.5,0,0.5),last.yr=2011,
    marker=8,segs=3,inclu = Toinc,exclu = Toexc)
## plots <- plotSegments(rwidths,segs = 4,marker=8)
## (not run) kill all the image segments:
graphics.off()
    



