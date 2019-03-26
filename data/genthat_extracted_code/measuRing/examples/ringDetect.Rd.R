library(measuRing)


### Name: ringDetect
### Title: Single Detection of TRWs
### Aliases: ringDetect

### ** Examples

image1 <- system.file("P105_a.tif", package="measuRing")
## (not run) Initial diagnostic:
detect1 <- ringDetect(image1,segs=3)
## (not run) Updating ringDetect to chage arguments;
## and flagged rings
detect1 <- update(detect1,marker=8) 
## (not run) Some noise in smoothed gray can be avoided
## by moving the origin: 
detect1 <- update(detect1,origin = -0.03)
## (not run) columns 21 and 130 are not considered now.
##
## (not run) Choose other columns in gray matrix (see ringSelect);
## (not run) graphical devices from ringDetect should be active!
## (not run) Including columns:
## (uncomment and run):
## detect1 <- update(detect1)
## Toinc <- ringSelect(detect1)
## detect1 <- update(detect1, inclu = Toinc)
## or, include the next columns: 
Toinc <- c(202,387,1564) 
detect1 <- update(detect1,inclu = Toinc)        
## (not run) Object detec1 is updated with Toinc;
##
## (not run)  ring borders to be excluded:
## (uncomment and run):
## detect1 <- update(detect1)
## Toexc <- ringSelect(detect1,any.col = FALSE)
## detect1 <- update(detect1,exclu=Toexc)
## or, exclude the nex columns: 
Toexc <- c(208,1444,1484)
detect1 <- update(detect1,exclu = Toexc)        
##
## (not run) Final arguments:
detect2 <- update(detect1,last.yr=2011,marker = 8)
str(detect2)
##
## (not run) kill previous plot:
graphics.off()
##
## (not run) Tree-ring widths and attributes:
rings <- detect2$'ringWidths'
##
## (not run) Plot of the tree-ring witdths:        
maint <- 'Hello ring widths!'
plot(rings,ylab = 'width (mm)',type='l',col = 'red',main=maint)



