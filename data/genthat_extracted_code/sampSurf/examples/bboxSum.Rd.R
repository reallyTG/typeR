library(sampSurf)


### Name: bboxSum
### Title: Function to Compute an Overall Bounding Box (bbox)
### Aliases: bboxSum
### Keywords: ~kwd1 ~kwd2

### ** Examples

dlogs = downLogs(3)
bboxArray = array(dim=c(2,2,3))
bboxArray[,,1] = bbox(perimeter(dlogs@logs$log.1))
bboxArray[,,2] = bbox(perimeter(dlogs@logs$log.2))
bboxArray[,,3] = bbox(perimeter(dlogs@logs$log.3))
dimnames(bboxArray) = dimnames(bbox(dlogs@logs$log.1)) #page dim doesn't matter
bbox = bboxSum(bboxArray)    
## Not run: 
##D plot(dlogs, axes=TRUE)
##D plot(bboxToPoly(bbox), add=TRUE)
## End(Not run)



