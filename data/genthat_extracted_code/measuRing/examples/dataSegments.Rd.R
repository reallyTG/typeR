library(measuRing)


### Name: dataSegments
### Title: Data segments
### Aliases: dataSegments

### ** Examples

## (not run) Read one image section in package measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")    
## (not run) compute a gray matrix from its RGB:
gray <- imageTogray(image1)
## (not run) Columns in gray matrix to be included/excluded:
Toinc <- c(196,202,387,1564) 
Toexc <- c(21,130,197,207,1444,1484)
## (not run) segmented data:
segm <- dataSegments(image1,segs = 3)
lapply(segm,str)
attributes(segm)



