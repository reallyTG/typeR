library(measuRing)


### Name: ringWidths
### Title: Ring widths
### Aliases: ringWidths

### ** Examples

## (not run) Read one image section:
image1 <- system.file("P105_a.tif", package="measuRing")       
## (not run) columns in gray matrix to be included/excluded:
Toinc <- c(196,202,387,1564) 
Toexc <- c(21,130,197,207,1444,1484)
## (not run) tree-ring widths
rwidths <- ringWidths(image1,inclu = Toinc,exclu = Toexc,last.yr=NULL)
str(rwidths)
##plot of computed tree-ring widths:
maint <- 'Hello ring widths!'
plot(rwidths,type='l',col = 'red',main = maint,
     xlab = 'Year',ylab = 'Width (mm)')    



