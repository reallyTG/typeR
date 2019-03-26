library(rangeMapper)


### Name: global.bbox.save
### Title: Global bounding box
### Aliases: global.bbox.save global.bbox global.bbox.fetch

### ** Examples

require(rangeMapper)
wd = tempdir()

f= system.file(package = "rangeMapper", "extdata", "wrens", "vector")

# Using default values for both bbox and p4s
dbcon = rangeMap.start(file = "test.sqlite", overwrite = TRUE, dir = wd )
global.bbox.save(con = dbcon)
bbox0 = global.bbox.fetch(dbcon)

plot(bbox0, axes = TRUE)




