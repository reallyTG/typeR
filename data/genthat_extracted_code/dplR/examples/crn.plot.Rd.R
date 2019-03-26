library(dplR)


### Name: crn.plot
### Title: Plot a Tree-Ring Chronology
### Aliases: plot.crn crn.plot
### Keywords: hplot

### ** Examples
library(graphics)
library(utils)
data(cana157)
crn.plot(cana157)
plot(cana157, main='Twisted Tree Heartrot Hill')
# with added spline
crn.plot(cana157,add.spline=TRUE, nyrs=32)
## Without sample depth
cana157.mod <- cana157
cana157.mod$samp.depth <- NULL
crn.plot(cana157.mod, add.spline = TRUE)
## A raw ring-width chronology with prewhitening
data(ca533)
ca533.raw.crn <- chron(ca533, prefix = "CAM", prewhiten=TRUE)
plot(ca533.raw.crn,ylab='mm',
     abline.pos=mean(ca533.raw.crn[,1],na.rm = TRUE))  

## Not run: 
##D   # not pretty - but illustrates the coloring options
##D   my.cols <- c("#3182BD","#9ECAE1","#DEEBF7","#31A354","#A1D99B","#E5F5E0")
##D   crn.plot(cana157,add.spline=TRUE,nyrs=32,
##D              crn.line.col=my.cols[5],
##D              spline.line.col=my.cols[4],
##D              samp.depth.col=my.cols[3],
##D              samp.depth.border.col=my.cols[2],
##D              abline.col=my.cols[1],
##D              crn.lwd=1.5,spline.lwd=3,
##D              abline.lwd=1,
##D              xlab="Year", ylab="RWI")
## End(Not run)



