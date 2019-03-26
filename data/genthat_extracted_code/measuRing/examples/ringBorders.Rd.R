library(measuRing)


### Name: ringBorders
### Title: Ring borders
### Aliases: ringBorders

### ** Examples

## (not run) Read one image sample in folder of package
## measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")        
## column numbers in gray matrix to be included/avoided:
Toinc <- c(196,202,387,1564) 
Toexc <- c(21,130,197,207,1444,1484)        
##(not run) the ring borders:
borders <- ringBorders(image1,inclu = Toinc,exclu = Toexc)
str(borders)
##(not run) Plot of smoothed grays with the ring borders:
Smooth <- ts(borders[,1])
inclupix <- subset(borders,borders%in%TRUE)
inclucol <- as.numeric(rownames(inclupix))
xyborders <- data.frame(column=inclucol,smooth=inclupix[,1])
y.lim <- c(-0.05,0.05)
main. <- 'Ring borders'
{plot(Smooth,xlab = 'Column',ylab = 'Smoothed gray',
      main=main.,col = 'darkgoldenrod1')
 points(xyborders[,1],xyborders[,2],pch=19,cex=0.5,col='orangered')}



