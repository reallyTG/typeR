library(sampSurf)


### Name: clipStemsToTract
### Title: Clip stems to lie within tract
### Aliases: clipStemsToTract
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# make a smaller "plot" inside the large one and clip...
#
## Not run: 
##D btr = bufferedTract(.1, Tract(c(x=50,y=50), cellSize=1))
##D bb = bbox(btr)
##D bb[,1] = 20
##D bb[,2] = 40
##D smtr = Tract(bb, cellSize=1)
##D dlogs = downLogs(100, btr)
##D dlogs2 = clipStemsToTract(dlogs, smtr, runQuiet=FALSE, showPlot=TRUE)
##D dlogs2$status
## End(Not run)



